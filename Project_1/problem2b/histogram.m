%function to plot the histogram of individual channels of input image

function H= histogram(colour_channel)
[M,N]=size(colour_channel);

 
intensity_levels=0:1:255; %array to store intensity level number(0 to 255)
total_intensitylevel_pixels=1:1:256; %to store pixel numbers in each intensity level
pixel_count=0;

for int_level=1:256 %intensity level 0 to 255
for row=1:M %
  
   if colour_channel(row,1)==int_level-1
   pixel_count=pixel_count+1;
   end
end
           total_intensitylevel_pixels(int_level)=pixel_count;
            pixel_count=0;
end

stem(intensity_levels,total_intensitylevel_pixels); 
xlabel('intensity levels');
ylabel('pixel count');






end
 