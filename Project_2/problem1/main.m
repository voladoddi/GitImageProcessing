%Performing first order derivative and second order derivative edge
%detection to generate pencil sketch image

clc;
clear all;
close all;

global Filtered_Image Zero_Crossing_Image 
pot=read_raw('harrypotter.raw',256,256,3);
ln=read_raw('lena_noisy.raw',256,256,3);
nar=read_raw('naruto.raw',256,256,3);

potter=read_raw_gray('harrypotter.raw',256,256,3);
lnoisy=read_raw_gray('lena_noisy.raw',256,256,3);
naruto=read_raw_gray('naruto.raw',256,256,3);

grainy=read_raw_gray('grainy.raw',256,256,3);

%display original image vs grayscale image
figure(1)
subplot(1,2,1)
imshow(uint8(pot));%original
title('original');
subplot(1,2,2)
imshow(uint8(potter));%grayscale
title('grayscale image');

%display original image vs grayscale image
figure(2)
subplot(1,2,1)
imshow(uint8(ln));%original
title('original');
subplot(1,2,2)
imshow(uint8(lnoisy));%grayscale
title('grayscale image');

%display original image vs grayscale image
figure(3)
subplot(1,2,1)
imshow(uint8(nar));%original
title('original');
subplot(1,2,2)
imshow(uint8(naruto));%grayscale
title('grayscale image');


%ask the user to enter which image file
str=input('enter 1 for harrypotter.raw ((OR)) 2 for  lena_noisy.raw ((OR)) 3 for naruto.raw');


if str==1
    x_img=potter;
elseif str==2
    disp('Please wait until denoising of Lena picture takes place');
    x_img=median_filter_5(lnoisy);
    
elseif str ==3
    x_img=naruto;
else
    disp('invalid choice. please type "main" in the command window and press "enter" ');
    

end


choice=input('enter 1 for first order derivative filter or 2 for second order zero crossing filter');


if choice==1
%----------------START FIRST ORDER DERIVATIVE EDGE DETECTION---------------
  f_ord=first_edge(x_img);

 figure(5)
 imshow(uint8(f_ord));
 
 f_ord=f_ord';
 fid=fopen('potter_forder_output.raw','wb');
 fwrite(fid,f_ord,'uchar')
 fclose(fid);

elseif choice==2
%----------START SECOND ORDER DERIVATIVE EDGE DETECTION--------------------
s_ord=second_edge(x_img);
figure(6)
imshow(uint8(s_ord));

end       
 
%---------------------special background effect----------------------------
 grain_edge=first_edge(grainy);
 figure(7)
 imshow(uint8(grain_edge));
 
 a=input('enter Alpha value');
 b=input('enter Beta value');
 special_effect(x_img,grain_edge,a,b);
 
%------------------------END OF MAIN---------------------------