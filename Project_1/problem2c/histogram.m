%function to plot the histogram of the grayscale image
function H= histogram(gray_image)

global total_intensitylevel_pixels

%assigning the argument to a variable
k=1;
for i=1:512*512
        g_image(i,1)=gray_image(k,1);
k=k+1;
end
    
[m n] =size(g_image);

intensity_levels=0:1:255; %array to store no.of pixels of each intensity level (0 to 255)
total_intensitylevel_pixels=1:1:256; %to store the pixels in each intensity level
pixel_count=0;

for int_level=1:256 %intensity level 0 to 255
for row=1:m*n
     
   if g_image(row,1)==int_level-1
   pixel_count=(pixel_count+1);
   end
 
end

            total_intensitylevel_pixels(int_level)=(pixel_count);
            pixel_count=0;
end

plot(intensity_levels,total_intensitylevel_pixels); 
xlabel('intensity levels');
ylabel('pixel count');


H=1;


end 