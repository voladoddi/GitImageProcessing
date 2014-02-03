function Image = Skeletonizing(In_Image)



Thresholded_Image_Dinasour = In_Image;
Size = size(Thresholded_Image_Dinasour);
%imtool(Thresholded_Image_Dinasour,[])
 Dinasour_New_Image = zeros(Size);
 
 
for k = 1 :100
 for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        Pixel_Neighbour = [Thresholded_Image_Dinasour(i-1,j-1) Thresholded_Image_Dinasour(i-1,j) Thresholded_Image_Dinasour(i-1,j+1)...
                           Thresholded_Image_Dinasour(i,j-1) Thresholded_Image_Dinasour(i,j) Thresholded_Image_Dinasour(i,j+1)...
                           Thresholded_Image_Dinasour(i+1,j-1) Thresholded_Image_Dinasour(i+1,j) Thresholded_Image_Dinasour(i+1,j+1)];
        
           Dinasour_New_Image(i,j) = cond_mark(Pixel_Neighbour);
       
    end
 end

 %imtool(Dinasour_New_Image,[])

 Dinasour_New_Image_Uncontd = zeros(size(Dinasour_New_Image));
%%%%%%%%%%Unconditional Removing
for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        
                       if(Dinasour_New_Image(i,j) == 2)
                           %%%%%Removing
                           
                           Pixel_Neighbour = [Dinasour_New_Image(i-1,j-1) Dinasour_New_Image(i-1,j) Dinasour_New_Image(i-1,j+1)...
                           Dinasour_New_Image(i,j-1) Dinasour_New_Image(i,j) Dinasour_New_Image(i,j+1)...
                           Dinasour_New_Image(i+1,j-1) Dinasour_New_Image(i+1,j) Dinasour_New_Image(i+1,j+1)];
                           
                            Dinasour_New_Image_Uncontd(i,j) = unconditional(Pixel_Neighbour);
                      
                            
                           
                       else
                           Dinasour_New_Image_Uncontd(i,j) =  Dinasour_New_Image(i,j);
                       end
        
                       
    end
end
k
P = Thresholded_Image_Dinasour - Dinasour_New_Image_Uncontd;
if(~maximum(P(:)))
    break;
end
Thresholded_Image_Dinasour = Dinasour_New_Image_Uncontd;


 end

Image = Dinasour_New_Image_Uncontd;

end