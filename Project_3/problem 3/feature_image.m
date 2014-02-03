%%%%%%%%%%%%%%%%%%%%%FILTERING ACTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fi=feature_image(mask,picture)

filter_window=mask;
image_layer=picture;

output_image=zeros(size(image_layer));

sum=0;


x=1;
y=1;

for i=3:130
    for j=3:130
         
                for l=1:5
                for m=1:5
                 sum=sum + image_layer(i+x-3,j+y-3)*filter_window(l,m); %convolution
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

fi=output_image(3:130,3:130);


end 
