%function to plot the histogram of individual channels
function H= histogram(colour_channel)
[M,N]=size(colour_channel);

 
intensity_levels=0:1:255; %array to store no.of pixels of each intensity level (0 to 255)
total_intensitylevel_pixels=1:1:256;
pixel_count=0;

for int_level=1:1:256 %intensity level 0 to 255
for wt=1:M
for ht=1:N
  
   if colour_channel(wt,ht)==int_level-1
   pixel_count=pixel_count+1;
   end
end
           total_intensitylevel_pixels(int_level)=pixel_count;
            pixel_count=0;
end
end


plot(intensity_levels,total_intensitylevel_pixels,'r'); 
xlabel('intensity levels');
ylabel('pixel count');


H=1;


end 