%function to plot the histogram of individual channels
function H= input_histo_cdf(gray_image)

global total_intensitylevel_pixels total_intlevel_pixels_cdf final_mat CDF table image
k=1;
for i=1:512*512
%    for j=1:512
        g_image(i,1)=gray_image(k,1);
k=k+1;
end
    
%end



bins=255;
intensity_levels=0:1:255; %array to store no.of pixels of each intensity level (0 to 255)
total_intensitylevel_pixels=1:1:256;
total_intlevel_pixels_cdf=1:1:256;
pixel_count=0;
sum=0;
for int_level=1:256 %intensity level 0 to 255
for row=1:512*512
    %for col=1:512
  
   if g_image(row,1)==int_level-1
   pixel_count=(pixel_count+1);
   end
 
end
            pixel_count=(pixel_count);    
            sum=sum+pixel_count;
            total_intensitylevel_pixels(int_level)=(pixel_count)/(512*512);
            total_intlevel_pixels_cdf(int_level)=(sum)/(512*512);
            pixel_count=0;
end


figure(1)
stem(intensity_levels,total_intensitylevel_pixels); 
title('probability distribution');
xlabel('intensity levels');
ylabel('pixel count');



figure(2)
stem(intensity_levels,total_intlevel_pixels_cdf); 
title('cumulative probability distribution');
xlabel('intensity levels');
ylabel('pixel count');


mean=input('Enter mean');
sd=input('Enter standard deviation');




sum=0;
sumP=0;
x=0:1:255; %intensity level 0 to 255
PDF_x=(1/(sqrt(2*pi)*sd))*exp((-(x-mean).^2)/(2*(sd*sd)));

%Get sum of all the probabilities to renormalize PDF in the next loop
for int_level=1:256
    P(int_level)=PDF_x(int_level);
    sum=sum+P(int_level);
      
end

%Renormalizing the PDFs to calculate the CDF in the next step.
sumP=0;
for int_level=1:256
    norm_P(int_level)=PDF_x(int_level)/sum;
   
end

%calculating the CDF
int_level=1:256;
 CDF(1)=(norm_P(1));
 for int_level=2:256
     CDF(int_level)=(CDF(int_level-1)+norm_P(int_level));
 end

      
     

figure(3)
plot(intensity_levels,PDF_x);
title('probability distribution');

figure(4)
plot(intensity_levels,norm_P);
title('Normalized Distribution');


figure(5)
stem(intensity_levels,CDF);
title('Cumulative Probability Distribution');

   

min=100;
temp=0;
loc=0;
loc_array=1:256;
for i=1:256
    for j=1:256
        
      temp=abs(total_intlevel_pixels_cdf(i)-CDF(j));
         
      if temp<min
          min=temp;
          loc=j;
          
      end
      loc_array(i)=loc;
    end
        
        total_intlevel_pixels_cdf(i)=CDF(loc); 
        min=100;
        
end


for i=1:(512*512)
       image(i,1)=(CDF(loc_array(g_image(i,1)+1)))*255;
   
end


fid=fopen('2c_output.raw','wb'); %create file ID
fwrite(fid,image,'uchar')
       
        

H=image;


end 