%%%%%%%%%%%%%%%%%%%%%FILTERING ACTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fi=feature_image1(mask,picture)

filter_window=mask;
image_layer=picture;

output_image=zeros(size(image_layer));

sum=0;

Size=size(output_image);

x=1;
y=1;

for i=2:Size(1)-1
    for j=2:Size(2)-1
         
                for l=1:3
                for m=1:3
                 sum=sum + image_layer(i+x-2,j+y-2)*filter_window(l,m); %convolution
                 y=y+1;
                end
                 y=1;
                 x=x+1;
                end
                 x=1;
            
output_image(i,j)=sum; %replacing the pixels with the average of the neighbourhood pixels in window 
sum=0;
    end
end

fi=output_image(2:Size(1)-1,2:Size(2)-1);


end 
