%colour sketching the image

ch=input('Enter 1) for harrypotter.raw, 2) for lena_noisy.raw and 3) for naruto.raw');

if ch==1
    Read_The_Image = read_raw('harrypotter.raw',256, 256,3);
elseif ch==2
    Read_The_Image = read_raw('lena_noisy.raw',256, 256,3);
    %disp('please wait until lena_noisy is filtered');
    %Read_The_Image = median_filter_5(Read_The_Image(:,:,1))+median_filter_5(Read_The_Image(:,:,2))+median_filter_5(Read_The_Image(:,:,3));
elseif ch==3
    Read_The_Image = read_raw('naruto.raw',256,256,3);
end

Grainy_Image_Read = read_raw('grainy.raw',256, 256,3);
A = 3;  %% Its range is (.75,.95);
B = 30;  %% Its range is (10,30);

Read_Img_Red_Plane_Pencil = first_edge(Read_The_Image(:,:,1));
Read_Img_Green_Plane_Pencil = first_edge(Read_The_Image(:,:,2));
Read_Img_Blue_Plane_Pencil = first_edge(Read_The_Image(:,:,3));


% Do the sketching for the red plane
Size_Image_Pencil = size(Read_Img_Red_Plane_Pencil);
for i = 1 : Size_Image_Pencil(1)
    for j = 1 : Size_Image_Pencil(2)
        if( Read_Img_Red_Plane_Pencil(i,j) ~= 1)
        Read_Img_Red_Plane_Pencil(i,j) = Read_Img_Red_Plane_Pencil(i,j) + A * Grainy_Image_Read(i,j,1) + B ;
        end
    end
end

imtool(Read_Img_Red_Plane_Pencil, [])


% Do the sketching for the Green plane
for i = 1 : Size_Image_Pencil(1)
    for j = 1 : Size_Image_Pencil(2)
        if( Read_Img_Green_Plane_Pencil(i,j) ~= 1)
        Read_Img_Green_Plane_Pencil(i,j) = Read_Img_Green_Plane_Pencil(i,j) + A * Grainy_Image_Read(i,j,2) + B ;
        end
    end
end
imtool(Read_Img_Green_Plane_Pencil, [])

% Do the sketching for the Blue plane

for i = 1 : Size_Image_Pencil(1)
    for j = 1 : Size_Image_Pencil(2)
        if( Read_Img_Blue_Plane_Pencil(i,j) ~= 1)
        Read_Img_Blue_Plane_Pencil(i,j) = Read_Img_Blue_Plane_Pencil(i,j) + A * Grainy_Image_Read(i,j,3) + B ;
        end
    end
end

imtool(Read_Img_Blue_Plane_Pencil, [])



%Normalizing the channels for displaying only

N1 = maximum(Read_Img_Red_Plane_Pencil);
N2 = maximum(Read_Img_Green_Plane_Pencil);
N3 = maximum(Read_Img_Blue_Plane_Pencil);

Color_Image(:,:,1) = (Read_Img_Red_Plane_Pencil./N1);
Color_Image(:,:,2) =(Read_Img_Green_Plane_Pencil./N2);
Color_Image(:,:,3) =(Read_Img_Blue_Plane_Pencil./N3);

imtool((Color_Image), [])

% %Restoring the Image back
% 
% Color_Image(:,:,1) = Read_Img_Red_Plane_Pencil.* N1;
% Color_Image(:,:,2) = Read_Img_Green_Plane_Pencil.* N2;
% Color_Image(:,:,3) = Read_Img_Blue_Plane_Pencil.* N3;








            