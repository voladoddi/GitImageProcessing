%clear the command window
clc;
clear all;
%----------------------------------------------------------------
%Read the input image
input_image=read_raw('peppers_mix.raw'); 
global check fil_output2d

%------------------------------------------------------------------
%initialise the loop variables 'i'(every 3rd byte of RGB to individual
%channels) and 'j'(index of elements in Red,Blue,Green channels
%respectively)
j=1;
i=1;

for i=1:3:(256*256*3)-2
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
title('histogram red channel')

figure(2)
histogram(Green);
title('histogram green channel')

figure(3)
histogram(Blue);
title('histogram blue channel')
%--------------------------------------------------------------------
%                    FILTERING 
%-----------------------------------------------------------------------

%Red channel 2-D image
var=1;
for i=1:256
    for j=1:256
        colour_channelR(i,j)=Red(var,1);
                          
     var=var+1;
    end
end

%Green channel 2-d image
var=1;
for i=1:256
    for j=1:256
        colour_channelG(i,j)=Green(var,1);
                          
     var=var+1;
    end
end

%Blue channel 2-d image
var=1;
for i=1:256
    for j=1:256
        colour_channelB(i,j)=Blue(var,1);
                          
     var=var+1;
    end
end

%---------------------------Call filter function----------------------
choice=input('Enter 1 for Median filter ;2 for Average Filter ;3 for Average weighted filter; 4 for combinations');

if choice==1 %call median filter
    wind_size=input('Enter the window size - 1) for 3x3 and 2) for 5x5');
             if wind_size==1 
                MF1= median_filter(colour_channelR);
                MF2= median_filter(colour_channelG);
                MF3= median_filter(colour_channelB);
             end
             if wind_size==2 
                MF1= median_filter_5(colour_channelR);
                MF2= median_filter_5(colour_channelG);
                MF3= median_filter_5(colour_channelB);
             end
end


if choice==2 %call averaging filter
    wind_size=input('Enter the window size - 1) for 3x3 and 2) for 5x5');
             if wind_size==1 
                MF1= average_filter(colour_channelR);
                MF2= average_filter(colour_channelG);
                MF3= average_filter(colour_channelB);
             end
             if wind_size==2 
                MF1= average_filter_5(colour_channelR);
                MF2= average_filter_5(colour_channelG);
                MF3= average_filter_5(colour_channelB);
             end
end


if choice==3 %call weighted averaging filter
              
                MF1= average_wt_filter(colour_channelR);
                MF2= average_wt_filter(colour_channelG);
                MF3= average_wt_filter(colour_channelB);
end
%--------------------combination of filters-------------------------
if choice==4
ch=input('Enter 1 for combination of Weighted Average(3x3),Median(5x5),Median(3x3) or 2 for its reverse combination' );

if ch==1 %Weighted Avg(3x3) Median(5x5) and Median(3x3)
                MF1= average_wt_filter(colour_channelR);
                MF2= average_wt_filter(colour_channelG);
                MF3= average_wt_filter(colour_channelB);
                    
                MF1= median_filter_5(MF1);
                MF2= median_filter_5(MF2);
                MF3= median_filter_5(MF3);
                
                MF1= median_filter(MF1);
                MF2= median_filter(MF2);
                MF3= median_filter(MF3);
end

if ch==2 %reverse of combination 1
                MF1= median_filter(colour_channelR);
                MF2= median_filter(colour_channelG);
                MF3= median_filter(colour_channelB);
    
                MF1= median_filter_5(MF1);
                MF2= median_filter_5(MF2);
                MF3= median_filter_5(MF3);
                
                MF1= average_wt_filter(MF1);
                MF2= average_wt_filter(MF2);
                MF3= average_wt_filter(MF3);
                    
                
                
end
end

                

%convert MF1 MF2 MF3 back into 1-D form
var=1;
for i=1:256
    for j=1:256
        MF1D_red(var,1)=MF1(i,j);
        MF1D_green(var,1)=MF2(i,j);
        MF1D_blue(var,1)=MF3(i,j);
    var=var+1;
    end
end


%Final output image after filtering
index=1;
for final_index=1:3:(256*256*3)          %convolve the bytes (interleave) into RGB format to create final output image
Output_Im(final_index,1)=MF1D_red(index,1);
Output_Im(final_index+1,1)=MF1D_green(index,1);
Output_Im(final_index+2,1)=MF1D_blue(index,1);
index=index+1;
end
%Store the output image in a RAW file
fid=fopen('filtered_output.raw','wb'); %create file ID
fwrite(fid,Output_Im,'uchar')