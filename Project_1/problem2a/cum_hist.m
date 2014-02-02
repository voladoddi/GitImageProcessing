%function to perform histogram equalization of the input image

function H=cum_hist(gray_image)
global intensitylevel_pixels final_mat
k=1;
for i=1:512*512
    
        g_image(i,1)=gray_image(k,1);
   
    k=k+1;
end
    
 
intensity_levels=0:1:255; %array to store no.of pixels of each intensity level (0 to 255)
intensitylevel_pixels=1:1:256;
pixel_count=0;
sum=0;
bins=255;

%computing cumulative probability of each pixel occurrence in each intensity level
for int_level=1:256 %intensity level 0 to 255
for row=1:512*512
  
    %for col=1:512
  
   if g_image(row,1)==int_level-1
   pixel_count=(pixel_count+1);
   end
 
end
           sum=sum+pixel_count; 
           intensitylevel_pixels(int_level)=round((sum*bins)/(512*512));
           pixel_count=0;
end

for i=1:512*512
    final_mat(i,1)=intensitylevel_pixels(g_image(i,1)+1);
end


%open file to store output
fid=fopen('cumulative_histogram.raw','wb'); %create file ID
fwrite(fid,final_mat,'uchar')

%final cumulative histogram 
stem(intensity_levels,intensitylevel_pixels);
title('cumulative output');
xlabel('intensity levels');
ylabel('pixel count');


end
            

















 