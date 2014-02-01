
 %clear the command window
clear all;
clc;

%----------------------------------------------------------------
%Read the input image
input_image=read_raw('shapes.raw'); 

%------------------------------------------------------------------
%initialise the loop variables 'i'(every 3rd byte of RGB to individual
%channels) and 'j'(index of elements in Red,Blue,Green channels
%respectively)
j=1;
i=1;
global red2d matrix matrix_red  non_white_ycoordinate green2d blue2d;
global matrix_green matrix_blue object_count radius;
global distance_nonwhite non_white_xcoordinate non_white_x length rad distance_nonwhite;

for i=1:3:198147 %size of image -rows*columns*channels
Red(j,1)=input_image(i,1);
Green(j,1)=input_image(i+1,1);
Blue(j,1)=input_image(i+2,1);
  
j=j+1;
end
%-------------------------------------------------------------------
%Plot the histogram to observe background and foreground ranges of RGB-
%-channels respectively.

 figure(1)
 histogram(Red);
 title('histogram of red channel');
 

 figure(2)
 histogram(Green);
 title('histogram of green channel');

figure(3)
histogram(Blue);
title('histogram of blue channel');

%--------------------------------------------------------------------
%Manipulate the blue screen (blue background to change into white)
j=1;%loop variable initialisation

for j=1:66049 %each channel has 66049 bytes.
    if Red(j,1)<31 
      Red(j,1)=255; %Change the pels (Red channel) in the background to white
    end

    if Green(j,1)<51
      Green(j,1)=255;%Change the pels (Green channel) in the background to white
    end

	 if Blue(j,1)>213
       Blue(j,1)=255;%Change the pels (Green channel) in the background to white
    end
end
%-----------------------------------------------------------------------
finalimg_index=1;
index=1;

for finalimg_index=1:3:198147          %convolve the bytes (interleave) into RGB format to create fianl output image
Output_Image(finalimg_index,1)=Red(index,1);
Output_Image(finalimg_index+1,1)=Green(index,1);
Output_Image(finalimg_index+2,1)=Blue(index,1);
index=index+1;
end

Output_Image=Output_Image'; %Orient the RGB bytes properly for writing into file and viewing output image
%----------------------------------------------------------------------
fid=fopen('output_shapes.raw','wb'); %create file ID
fwrite(fid,Output_Image,'uchar')%Write the output vector of the changed image into a RAW file 'output_shapes.raw')

%----------------------------------------------------------------
%------////////////////////////////////////////////---------------

g=input('enter 1 to call identify_shapes function, and 2 to call extract_shapes');

if g==1;
    Identify_shape('output_shapes.raw');
elseif g==2;
    extract_shape('output_shapes.raw');
end


            

