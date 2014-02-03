%Part1
clear all;
clc;
close all;

Man_Image = read_raw('man.raw',1024,1024,1);

Size_Man_Image = size(Man_Image);
imtool(Man_Image , []) %image0

% %Fixed Thresholding
% 
% T = 127;
% 
% Fixed_Thresholded_Image = zeros(size(Man_Image));
% 
% for i = 1 : Size_Man_Image(1)
%     for j = 1 : Size_Man_Image(2)
%         if(Man_Image(i,j) > T)
%             Fixed_Thresholded_Image(i,j) = 255;
%         end
%     end
% end
% imtool(Fixed_Thresholded_Image,[])     %image1
% fid=fopen('fixed_threshold.raw','wb');
% fwrite(fid,Fixed_Thresholded_Image);
% fclose(fid);
% 
% %Random Thresholding using uniform distribution 
% 
% Random_Thresholded_Image = zeros(size(Man_Image));
% for i = 1 : Size_Man_Image(1)
%    for j = 1 : Size_Man_Image(2)
%      T = round(255 * rand(1)); 
%         if( T < Man_Image(i,j))
%             Random_Thresholded_Image(i,j) = 255;
%         end
%     end
% end
% 
% imtool(Random_Thresholded_Image,[]) %image2
% fid=fopen('random_threshold.raw','wb');
% fwrite(fid,Random_Thresholded_Image);
% fclose(fid);
% 
% %Random Thresholding using normal distribution 
% SD=0.5;
% Random_Thresholded_Image = zeros(size(Man_Image));
%   disp(T);
% for i = 1 : Size_Man_Image(1)
%    for j = 1 : Size_Man_Image(2)
%      T = rand(1); 
%        T=round(255*((1/sqrt(2*pi)*SD)*(exp(-T^2)/(2*SD*SD))));
%         if( T < Man_Image(i,j))
%             Random_Thresholded_Image_2(i,j) = 255;
%         end
%     end
% end
% imtool(Random_Thresholded_Image_2,[]) %image3
% 
% fid=fopen('random_threshold_norm.raw','wb');
% fwrite(fid,Random_Thresholded_Image_2);
% fclose(fid);
% %Dithering Matrix
% 
% 
%Half Toning  using 2 x 2 dithering matrix 

I_0 = [1 2;3 0];
N = 2;
T = (255/(N*N)) * (I_0 + .5);


Dithered_Image_2_2 = zeros(size(Man_Image));
for i = 1 : Size_Man_Image(1)
    for j = 1 : Size_Man_Image(2)
        
        if(Man_Image(i,j) > T(mod(i,N)+1,mod(j,N)+1))
            Dithered_Image_2_2(i,j) = 255;
        end
    end
end

imtool(Dithered_Image_2_2,[]) %image4
fid=fopen('Dithered_2.raw','wb');
fwrite(fid,Dithered_Image_2_2);
fclose(fid);
% three_c(Dithered_Image_2_2); %image5

%Half Toning  using 4 x 4 dithering matrix 
N = 4;
T =  (255/(N*N))*round([(4*I_0 + 1) (4*I_0 + 2);(4*I_0 + 3) (4*I_0)] + .5);


Dithered_Image_4_4 = zeros(size(Man_Image));
for i = 1 : Size_Man_Image(1)
    for j = 1 : Size_Man_Image(2)
        
        if(Man_Image(i,j) > T(mod(i,N)+1,mod(j,N)+1))
            Dithered_Image_4_4(i,j) = 255;
        end
    end
end

imtool(Dithered_Image_4_4,[]) %image6
fid=fopen('dith4.raw','wb');
fwrite(fid,Dithered_Image_4_4);
fclose(fid);
% three_c(Dithered_Image_4_4); %image7