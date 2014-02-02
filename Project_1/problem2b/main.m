%clear the command window
clc;
clear all;
%----------------------------------------------------------------
%Read the input image
input_image=read_raw('ocean_contrast.raw'); 
global Mlen Nlen ch_no matrix
%------------------------------------------------------------------
%initialise the loop variables 'i'(every 3rd byte of RGB to individual
%channels) and 'j'(index of elements in Red,Blue,Green channels
%respectively)
j=1;
i=1;

for i=1:3:(Mlen*Nlen*ch_no)
Red(j,1)=input_image(i,1);
Green(j,1)=input_image(i+1,1);
Blue(j,1)=input_image(i+2,1);
  
j=j+1;
end


%-------------------------------------------------------------------
%Plot the histogram of RGB-channels respectively.

[M,N]=size(Red);


 
intensity_levels=0:1:255; %array to store no.of pixels of each intensity level (0 to 255)
total_intensitylevel_pixelsR=1:1:256;
total_intensitylevel_pixelsG=1:1:256;
total_intensitylevel_pixelsB=1:1:256;


pixel_countR=0;
pixel_countG=0;
pixel_countB=0;


for int_level=1:256 %intensity level 0 to 255
for rw=1:M %
  
   if Red(rw,1)==int_level-1      %to count the pixels of Red channel
   pixel_countR=pixel_countR+1;
   end

   if Green(rw,1)==int_level-1     %to count the pixels of Green channel 
   pixel_countG=pixel_countG+1;
   end
   
   if Blue(rw,1)==int_level-1      %to count the pixels of Blue channel
   pixel_countB=pixel_countB+1;
   end
end
           total_intensitylevel_pixelsR(int_level)=pixel_countR;
            pixel_countR=0;
            
             total_intensitylevel_pixelsG(int_level)=pixel_countG;
            pixel_countG=0;
            
             total_intensitylevel_pixelsB(int_level)=pixel_countB;
            pixel_countB=0;
end

figure(1)
stem(intensity_levels,total_intensitylevel_pixelsR); 

title('Histogram of Red channel')
xlabel('intensity levels');
ylabel('pixel count');

figure(2)
stem(intensity_levels,total_intensitylevel_pixelsG); 
title('Histogram of Green channel')

xlabel('intensity levels');
ylabel('pixel count');

figure(3)

stem(intensity_levels,total_intensitylevel_pixelsB); 
title('Histogram of Blue channel')
xlabel('intensity levels');
ylabel('pixel count');


% % % -----------------CUMULATIVE EQUALIZED HISTOGRAM-----------------------------
k=1;
for i=1:M*N
    
        CE_imageR(i,1)=Red(k,1);
        CE_imageG(i,1)=Green(k,1);
        CE_imageB(i,1)=Blue(k,1);
    k=k+1;
end
    
 
intensity_levels=0:1:255; %array to store intensity level (0 to 255)
intensitylevel_pixelsR=1:1:256;%array to store the no.of pixels in each intensity level
intensitylevel_pixelsG=1:1:256;
intensitylevel_pixelsB=1:1:256;
pixel_countR=0;
pixel_countG=0;
pixel_countB=0;

sumR=0;
sumG=0;
sumB=0;

bins=255;

%computing cumulative probability of each pixel occurrence in each intensity level
for int_level=1:256 %intensity level 0 to 255
for row=1:M*N
  
    %for col=1:512
  
   if CE_imageR(row,1)==int_level-1
   pixel_countR=(pixel_countR+1);
   end
     
   if CE_imageG(row,1)==int_level-1
   pixel_countG=(pixel_countG+1);
   end
   
   if CE_imageB(row,1)==int_level-1
   pixel_countB=(pixel_countB+1);
   end
 
end
          sumR=sumR+pixel_countR; 
           intensitylevel_pixelsR(int_level)=round((sumR*bins)/(M*N));
           pixel_countR=0;
         
           sumG=sumG+pixel_countG; 
           intensitylevel_pixelsG(int_level)=round((sumG*bins)/(M*N));
           pixel_countG=0;
         
           sumB=sumB+pixel_countB; 
           intensitylevel_pixelsB(int_level)=round((sumB*bins)/(M*N));
           pixel_countB=0;
           
           
end

for i=1:M*N
    final_matR(i,1)=intensitylevel_pixelsR(CE_imageR(i,1)+1);
    final_matG(i,1)=intensitylevel_pixelsG(CE_imageG(i,1)+1);
    final_matB(i,1)=intensitylevel_pixelsB(CE_imageB(i,1)+1);
end

%plotting if cumulative histograms for Red,Green and Blue channels
figure(4)
stem(intensity_levels,intensitylevel_pixelsR); 
xlabel('intensity levels');
ylabel('pixel count')
title('Cumulative Histogram for Red channel')

figure(5)
stem(intensity_levels,intensitylevel_pixelsG); 
xlabel('intensity levels');
ylabel('pixel count')
title('Cumulative Histogram for Green channel')

figure(6)
stem(intensity_levels,intensitylevel_pixelsB); 
xlabel('intensity levels');
ylabel('pixel count')
title('Cumulative Histogram for Blue channel');

index=1;
for i=1:3:(Mlen*Nlen*ch_no)
                              %convolve the bytes (interleave) into RGB format to create final output image
Output_Image(i,1)=final_matR(index,1);
Output_Image(i+1,1)=final_matG(index,1);
Output_Image(i+2,1)=final_matB(index,1);
index=index+1;
end


fid=fopen('2b_eqCumHist.raw','wb'); %create file ID
fwrite(fid,Output_Image,'uchar')


% %---------------------- EQUALIZED HISTOGRAM--------------------------
   equalized_histogram();

