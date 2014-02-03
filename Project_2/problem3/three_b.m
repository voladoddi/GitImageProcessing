%%%%%%% 3b
clear 
clc
global MAXVAR
Gradient_Image = read_raw('gradient.raw',256,256,1); %%%% Read the image you want to perform analysis on
%imtool(Gradient_Image, [])

Size_Gradient = size(Gradient_Image);
%%%%%%Error Diffusion using Flyod-Stienberg matrix with normal scanning

FSDM = (1/16) * [0 0 0;0 0 7;3 5 1];

%%% Assuming N is always odd
N = 3;
mid = floor(N/2) + 1;

Padded_Gradient_Image = zeros(Size_Gradient(1) + 2 * (mid - 1), Size_Gradient(2) + 2 * (mid - 1));
Size_Padded_Gradient = size(Padded_Gradient_Image);
Padded_Gradient_Image(mid:Size_Padded_Gradient(1) - (mid - 1), mid : Size_Padded_Gradient(2) - (mid - 1)) = Gradient_Image;

Image_After_FSDM = zeros(size(Gradient_Image));
Error_Matrix = zeros(size(Gradient_Image));

T = 127;

for i = mid : Size_Padded_Gradient(1) - (mid - 1)
    for j = mid : Size_Padded_Gradient(2) - (mid - 1) 
         
        if(Padded_Gradient_Image(i,j) > T)
           
            Image_After_FSDM(i - mid + 1,j - mid + 1) = 255;
        end
        Error_Matrix(i,j) = Padded_Gradient_Image(i,j) - Image_After_FSDM(i - mid + 1,j - mid + 1);
         %%%%Pulling the Error Forward
         Diffused_Error_Value = Error_Matrix(i,j) * FSDM;
         
         for k = -floor(N/2): 1 : floor(N/2)
             for l = -floor(N/2) : 1 : floor(N/2)
                Padded_Gradient_Image(i + k,j + l) =  Padded_Gradient_Image(i + k ,j + l) + Diffused_Error_Value(k + mid, l + mid);
             end
         end
    end
end



imtool(Image_After_FSDM,[])



%%%%%%Error Diffusion using Flyod-Stienberg matrix with serpentine scanning

FSDM = (1/16) * [0 0 0;0 0 7;3 5 1];
FSDM_Back = (1/16) * [0 0 0;7 0 0;1 5 3];


N = 3;
mid = floor(N/2) + 1;

Padded_Gradient_Image_Serpentine = zeros(Size_Gradient(1) + 2 * (mid - 1), Size_Gradient(2) + 2 * (mid - 1));
Size_Padded_Gradient = size(Padded_Gradient_Image_Serpentine);
Padded_Gradient_Image_Serpentine(mid:Size_Padded_Gradient(1) - (mid - 1), mid : Size_Padded_Gradient(2) - (mid - 1)) = Gradient_Image;

Image_After_FSDM_Serpentine = zeros(size(Gradient_Image));
Error_Matrix = zeros(size(Gradient_Image));

T = 127;

for i = mid : Size_Padded_Gradient(1) - (mid - 1)
    
    if(mod(i,2) == 0)
    for j = mid : Size_Padded_Gradient(2) - (mid - 1) 
         
        if(Padded_Gradient_Image_Serpentine(i,j) > T)
           
            Image_After_FSDM_Serpentine(i - mid + 1,j - mid + 1) = 255;
        end
        Error_Matrix(i,j) = Padded_Gradient_Image_Serpentine(i,j) - Image_After_FSDM_Serpentine(i - mid + 1,j - mid + 1);
         %%%%Pulling the Error Forward
         Diffused_Error_Value = Error_Matrix(i,j) * FSDM;
         
         for k = -floor(N/2): 1 : floor(N/2)
             for l = -floor(N/2) : 1 : floor(N/2)
                Padded_Gradient_Image_Serpentine(i + k,j + l) =  Padded_Gradient_Image_Serpentine(i + k ,j + l) + Diffused_Error_Value(k + mid, l + mid);
             end
         end
    end
    else
        for j = Size_Padded_Gradient(2) - (mid - 1) : -1 : mid 
         
        if(Padded_Gradient_Image_Serpentine(i,j) > T)
           
            Image_After_FSDM_Serpentine(i - mid + 1,j - mid + 1) = 255;
        end
        Error_Matrix(i,j) = Padded_Gradient_Image_Serpentine(i,j) - Image_After_FSDM_Serpentine(i - mid + 1,j - mid + 1);
         %%%%Pulling the Error Forward
         Diffused_Error_Value = Error_Matrix(i,j) * FSDM_Back;
         
         for k = -floor(N/2): 1 : floor(N/2)
             for l = -floor(N/2) : 1 : floor(N/2)
                Padded_Gradient_Image_Serpentine(i + k,j + l) =  Padded_Gradient_Image_Serpentine(i + k ,j + l) + Diffused_Error_Value(k + mid, l + mid);
             end
         end
        end
    end
    
end

imtool(Image_After_FSDM_Serpentine,[])




%%%%Error Diffusion by JJN

N = 5;
mid = floor(N/2) + 1;
JJN = (1/48) * [0 0 0 0 0;0 0 0 0 0;0 0 0 7 5;3 5 7 5 3;1 3 5 3 1];
Padded_Gradient_Image_JJN = zeros(Size_Gradient(1) + 2 * (mid - 1), Size_Gradient(2) + 2 * (mid - 1));

Size_Padded_Gradient = size(Padded_Gradient_Image_JJN);
Padded_Gradient_Image_JJN(mid : Size_Padded_Gradient(1) - (mid - 1), mid : Size_Padded_Gradient(2) - (mid - 1)) = Gradient_Image;
size(Padded_Gradient_Image_JJN)
Image_After_JJN = zeros(size(Gradient_Image));
Error_Matrix = zeros(size(Gradient_Image));

for i = mid : Size_Padded_Gradient(1) - (mid - 1)
    for j = mid : Size_Padded_Gradient(2) - (mid - 1)
        
        if(Padded_Gradient_Image_JJN(i,j) > T)
           
            Image_After_JJN(i - mid + 1,j - mid + 1) = 255;
        end
        Error_Matrix(i,j) = Padded_Gradient_Image_JJN(i,j) - Image_After_JJN(i - mid + 1,j - mid + 1);
         %%%%Pulling the Error Forward
         Diffused_Error_Value = Error_Matrix(i,j) * JJN;
         
         for k = -floor(N/2): 1 : floor(N/2)
             for l = -floor(N/2) : 1 : floor(N/2)
                 Padded_Gradient_Image_JJN(i + k,j + l) =  Padded_Gradient_Image_JJN(i + k ,j + l) + Diffused_Error_Value(k + mid, l + mid);
             end
         end
    end
end

imtool(Image_After_JJN,[])

%%%%%%%%Stucki Error Diffusion (SED)
N = 5;
mid = floor(N/2) + 1;
SED = (1/42) * [0 0 0 0 0;0 0 0 0 0;0 0 0 8 4;2 4 8 4 2;1 2 4 2 1];
Padded_Gradient_Image_SED = zeros(Size_Gradient(1) + 2 * (mid - 1), Size_Gradient(2) + 2 * (mid - 1));

Size_Padded_Gradient = size(Padded_Gradient_Image_SED);
Padded_Gradient_Image_SED(mid : Size_Padded_Gradient(1) - (mid - 1), mid : Size_Padded_Gradient(2) - (mid - 1)) = Gradient_Image;

Image_After_SED = zeros(size(Gradient_Image));
Error_Matrix = zeros(size(Gradient_Image));

for i = mid : Size_Padded_Gradient(1) - (mid - 1)
    for j = mid : Size_Padded_Gradient(2) - (mid - 1)
        
        if(Padded_Gradient_Image_SED(i,j) > T)
           
            Image_After_SED(i - mid + 1,j - mid + 1) = 255;
        end
        Error_Matrix(i,j) = Padded_Gradient_Image_SED(i,j) - Image_After_SED(i - mid + 1,j - mid + 1);
         %%%%Pulling the Error Forward
         Diffused_Error_Value = Error_Matrix(i,j) * SED;
         
         for k = -floor(N/2): 1 : floor(N/2)
             for l = -floor(N/2) : 1 : floor(N/2)
                 Padded_Gradient_Image_SED(i + k,j + l) =  Padded_Gradient_Image_SED(i + k ,j + l) + Diffused_Error_Value(k + mid, l + mid);
             end
         end
    end
end

imtool(Image_After_SED,[])


x=three_c(Image_After_FSDM);
y=three_c(Image_After_FSDM_Serpentine);

imtool(x,[]);
title('FSDM error diffused')

imtool(y,[]);
title('FSDM serpentine error diffused');
