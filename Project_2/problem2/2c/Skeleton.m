%%%%2c


%%%%Only Thresholding 
Dinosaur = read_raw('dinosaur.raw',444,960,3);

Dinosaur_Gray = read_raw_gray('dinosaur.raw',444,960,3); 
Size = size(Dinosaur_Gray);
imtool(Dinosaur_Gray,[])


 T = mean_(Dinosaur_Gray(:));
 
 Thresholded_Image_Dinosaur = zeros(Size);
 
 for i = 1 : Size(1)
     for j = 1 : Size(2)
         
         if(Dinosaur_Gray(i,j) > T)
             Thresholded_Image_Dinosaur(i,j) = 1;
         end
     end
 end
 

imtool(Thresholded_Image_Dinosaur,[])
 Dinosaur_New_Image = zeros(Size);
 %%%%Conditional Marking 
 for k = 1 :100
 for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        Pixel_Neighbour = [Thresholded_Image_Dinosaur(i-1,j-1) Thresholded_Image_Dinosaur(i-1,j) Thresholded_Image_Dinosaur(i-1,j+1)...
                           Thresholded_Image_Dinosaur(i,j-1) Thresholded_Image_Dinosaur(i,j) Thresholded_Image_Dinosaur(i,j+1)...
                           Thresholded_Image_Dinosaur(i+1,j-1) Thresholded_Image_Dinosaur(i+1,j) Thresholded_Image_Dinosaur(i+1,j+1)];
        
           Dinosaur_New_Image(i,j) = cond_mark(Pixel_Neighbour);
       
    end
 end

 %imtool(Dinosaur_New_Image,[])

 Dinosaur_New_Image_Uncontd = zeros(size(Dinosaur_New_Image));
%%%%%%%%%%Unconditional masking
for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        
                       if(Dinosaur_New_Image(i,j) == 2)
                           %%%%%Removing
                           
                           Pixel_Neighbour = [Dinosaur_New_Image(i-1,j-1) Dinosaur_New_Image(i-1,j) Dinosaur_New_Image(i-1,j+1)...
                           Dinosaur_New_Image(i,j-1) Dinosaur_New_Image(i,j) Dinosaur_New_Image(i,j+1)...
                           Dinosaur_New_Image(i+1,j-1) Dinosaur_New_Image(i+1,j) Dinosaur_New_Image(i+1,j+1)];
                           
                            Dinosaur_New_Image_Uncontd(i,j) = unconditional(Pixel_Neighbour);
                      
                            
                           
                       else
                           Dinosaur_New_Image_Uncontd(i,j) =  Dinosaur_New_Image(i,j);
                       end
        
                       
    end
end

P = Thresholded_Image_Dinosaur - Dinosaur_New_Image_Uncontd;
if(~maximum(P(:)))
    break;
end
Thresholded_Image_Dinosaur = Dinosaur_New_Image_Uncontd;


 end
imtool(Dinosaur_New_Image_Uncontd,[])