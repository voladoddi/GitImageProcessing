
%function to produce equalised histogram of color image

clc;
clear all;

%read image
input_image=read_raw('ocean_contrast.raw'); 

j=1;
i=1;

global Mlen Nlen ch_no

%separate image into Red Green and Blue channels
for i=1:3:Mlen*Nlen*ch_no
Red(j,1)=input_image(i,1);
Green(j,1)=input_image(i+1,1);
Blue(j,1)=input_image(i+2,1);
  
j=j+1;
end

%arrange those RGB channels into 2-D form 
k=1;
for i=1:500
    for j=1:332
        CE_imageR(i,j)=Red(k,1);
        CE_imageG(i,j)=Green(k,1);
        CE_imageB(i,j)=Blue(k,1);
    k=k+1;
    end
end
 

%------------------------------equalized histogram -------------------------
pixel_countR=0;
pixel_countG=0;
pixel_countB=0;
sumR=0;
sumG=0;
sumB=0;

bins=0; %initialising the histogram output level for output Red image

output_R=zeros(500,332); %new red channel for the output image


%histogram equalized for red channel
for int_level=1:256 %intensity level 0 to 255
for row=1:500
    for col=1:332
    %for col=1:512
  
    if CE_imageR(row,col)==int_level-1
    

     
        if pixel_countR<=649 %defines N^2/256
            pixel_countR=(pixel_countR+1);      
            output_R(row,col)=bins;
             
        else
             bins=bins+1;
            pixel_countR=0;
        end
                   
       
     
     end
   
     end
end
end

%equalising the green channel pixels 
bins=0; %initialising the histogram output level for output Red image 
output_G=zeros(500,332); %matrix for output image green channel after getting equalised
for int_level=1:256 %intensity level 0 to 255
for row=1:500
  for col=1:332
    %for col=1:512
  
   if CE_imageG(row,col)==int_level-1
     
    
        if pixel_countG<=649
            pixel_countG=(pixel_countG+1);
            output_G(row,col)=bins;
   
        else
             bins=bins+1;
             pixel_countG=0;   
   end
 
   end
               
        
 
  end
end
    

end


% equalising the blue channel intensity levels
bins=0;
output_B=zeros(500,332);
for int_level=1:256 %intensity level 0 to 255
for row=1:500
  for col=1:332
    %for col=1:512
  
   if CE_imageB(row,col)==int_level-1
     
       
    if pixel_countB<=649          %check if maximum bin level has reached
        pixel_countB=(pixel_countB+1);   
        output_B(row,col)=bins;
        
    else
          bins=bins+1;
          pixel_countB=0;      
    
   end
      
  end
   
end
      
  
end
end






%2-D array form into 1-d array - RGB channels respectively
vari=1;
for i=1:500
    for j=1:332
        final_matR(vari,1)=output_R(i,j);
        final_matG(vari,1)=output_G(i,j);
        final_matB(vari,1)=output_B(i,j);
        vari=vari+1;
    end
    
end


index=1;
for i=1:3:(500*332*3)
                              %convolve the bytes (interleave) into RGB format to create final output image
Output_Image(i,1)=final_matR(index,1);
Output_Image(i+1,1)=final_matG(index,1);
Output_Image(i+2,1)=final_matB(index,1);
index=index+1;
end

fid=fopen('equalized__hist.raw','wb'); %Equalized histogram by bucket filling method -final output image.
fwrite(fid,Output_Image,'uchar')

%---------------------------------------histogram of output----------------           
figure(7)
histogram(final_matR);
title('Equalised histogram-Red channel');

figure(8)
histogram(final_matG);
title('Equalised histogram-Green channel')

figure(9)
histogram(final_matB);
title('Equalised histogram-blue channel');