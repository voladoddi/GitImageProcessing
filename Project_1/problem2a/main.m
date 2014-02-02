
%clear the command window
clear all;
clc;
global total_intensitylevel_pixels intensitylevel_pixels final_mat

%----------------------------------------------------------------
%Read the input image
choice=input('enter 1) for barbara_dark , 2) for barbara_mid and 3) for barbara_bright');

if choice==1
    input_image=read_raw('barbara_dark.raw'); 
elseif choice==2
    input_image=read_raw('barbara_mid.raw');
elseif choice==3
    input_image=read_raw('barbara_bright.raw');
end
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
%------------------------------------------------------------------
% CONTRAST ENHANCEMENT BY FULL SCALE LINEAR RANGING

[m n]=size(in_image);

a=0;   %min intensity level for stretching
b=255; %max intensity level for stretching

d=maximum(in_image); %maximum intensity value in the image
c=minimum(in_image); %minimum intensity value in the image

for i=1:ht*wt %contrast stretching
     full_scale(i,1)=round(((in_image(i,1)-c)*((b-a)/(d-c)))+a);
end

 
 for i=1:m %transfer function plot
     for j=1:n
         trans_sc(i,j)=round((full_scale(i,1)-a)*((d-c)/(b-a)));
     end
 end
 
figure(2)
plot(trans_sc,in_image); %plot of transfer function 
xlabel('Intensity levels');
ylabel('Transfer function');
title('transfer function for full scale linear ranging image');

figure(3)
histogram(full_scale); %histogram of contrast stretched image
title('histogram of full scale linear ranging contrast stretched image')

fid=fopen('out_contraststretched.raw','wb'); %create file ID
fwrite(fid,full_scale,'uchar'); %Write the output vector of the changed image into a RAW file 'output_shapes.raw')

%-----------------------------------------------------------------
%CONTRAST ENHANCEMENT BY CUMULATIVE HISTOGRAM EQUALIZATION
figure(4)
cum_hist(in_image); %cumulative histogram of histogram equalized image


figure(5)
histogram(final_mat); %final histogram after cumulative histogram equalization
%-----------------------------END------------------------