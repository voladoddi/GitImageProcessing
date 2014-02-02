
 %clear the command window
clear all;
clc;
global total_intensitylevel_pixels intensitylevel_pixels final_mat CDF table image total_intlevel_pixels_cdf

%----------------------------------------------------------------
%Read the input image


    input_image=read_raw('barbara_contrast.raw'); 

%------------------------------------------------------------------

ht=512;
wt=512;
j=1;

for i=1:ht*wt
in_image(j,1)=input_image(i,1);
j=j+1;
end

figure(1)
histogram(in_image); %histogram of input image
title('input image histogram')
%------------------------------------------------------------------

%-----------------------------------------------------------------

figure(2)
input_histo_cdf(in_image); %histogram of histogram equalized image

figure(6)
histogram(round(image));%histogram of gaussian distributed image
title('final image histogram')