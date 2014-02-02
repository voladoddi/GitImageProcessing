function s_order=second_edge(image)
global Filtered_Image Zero_Crossing_Image
x_img=image;

 SD=20;
 %Generate Gaussian filter
 for i=1:3
    for j=1:3
         GS(i,j)=((-1/(2*pi*SD*SD))*exp(-((i^2+j^2)/(2*SD*SD))));
    end
 end
 
 %normalize Gaussian kernel
 s=0;
 for i=1:3
     for j=1:3
         s=s+GS(i,j);
     end
 end
 GS=GS/s;

 
 % performing Gaussian blur on the x_img
filter_window=GS;

sum=0;
x=0;
y=0;

gx_img=zeros(size(x_img));
for i=1:256-2
    for j=1:256-2
       
            for l=1:3
            for m=1:3
              sum= sum + x_img(i+x,j+y)*filter_window(l,m); %calculation of sum for averaging
              y=y+1;
            end
              y=0;
              x=x+1;
            end
            x=0;
            gx_img(i,j)=sum; %replacing the pixels with the average of the neighbourhood pixels in window 
sum=0;
    end
end

 figure(6)
 imshow(uint8(gx_img));
 title('gaussian blurred image');



%Perform LaPlacian operator action to get second derivative
  Operator = [0 -1 0;-1 4 -1;0 -1 0];
 
   sum=0;
x=0;
y=0;
  
         G_col=zeros(size(gx_img));
        
         
for i=1:256-2
    for j=1:256-2
       
            for l=1:3
            for m=1:3
              sum= sum + gx_img(i+x,j+y)*Operator(l,m); %calculation of sum for averaging
              y=y+1;
            end
              y=0;
              x=x+1;
            end
            x=0;
            G_col(i,j)=sum/4; %replacing the pixels with the average of the neighbourhood pixels in window 
sum=0;
    end
end
    
    Filtered_Image=G_col;
    


 %%%%Implementing zero Crossing
 Zero_Crossing_Image = zeros(size(Filtered_Image));
 Size_Image = size(Filtered_Image);
 
 Mean = mean_(Filtered_Image(:)); %threshold=mean of the image
  
 
 figure(7)
 imshow(Filtered_Image);

 Fmax=maximum(Filtered_Image);
 Fmin=minimum(Filtered_Image);
 

 for i = 2 : Size_Image(1) - 1
     for j = 2 : Size_Image(2) - 1
         
         if abs(Filtered_Image(i,j))>1.5*Mean
         if((Filtered_Image(i-1, j) * Filtered_Image(i+1 , j) <0 ) || (Filtered_Image(i, j-1) * Filtered_Image(i , j+1) <0))
             Zero_Crossing_Image(i,j) =abs(Filtered_Image(i,j))*255/(Fmax-Fmin);
          else
              Zero_Crossing_Image(i,j)=255;
         end
         end
     end
 end
 s_order=255-Zero_Crossing_Image;
end