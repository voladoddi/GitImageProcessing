%%%%%%Warping Via Control Points Selection

clc 
clear all
close all
Image_Transformmer = Read_Raw_('puppy.raw',500,500);
Normalized_Transformer_Image  = Image_Transformmer;
%delete Point.txt



N1 = max(Image_Transformmer(:,:,1));
N1 = max(N1(:));

N2 = Image_Transformmer(:,:,2);
N2 = max(N2(:));

N3 = Image_Transformmer(:,:,3);
N3 = max(N3(:));

Normalized_Transformer_Image(:,:,1) = Image_Transformmer(:,:,1) ./ N1;
Normalized_Transformer_Image(:,:,2) = Image_Transformmer(:,:,2) ./ N2;
Normalized_Transformer_Image(:,:,3) = Image_Transformmer(:,:,3) ./ N3;


 figure(1)
 imshow(Normalized_Transformer_Image)



Diamond_Red_Plane = Diamond_Warping(Image_Transformmer(:,:,1));
Diamond_Green_Plane = Diamond_Warping(Image_Transformmer(:,:,2));
Diamond_Blue_Plane = Diamond_Warping(Image_Transformmer(:,:,3));

Diamond_Image(:,:,1) = Diamond_Red_Plane;
Diamond_Image(:,:,2) = Diamond_Green_Plane;
Diamond_Image(:,:,3) = Diamond_Blue_Plane;

N1 = max(Diamond_Red_Plane(:));
N2 = max(Diamond_Green_Plane(:));
N3 = max(Diamond_Blue_Plane(:));

Normalized_Diamond_Image(:,:,1) = Diamond_Red_Plane' ./ N1;
Normalized_Diamond_Image(:,:,2) = Diamond_Green_Plane' ./ N2;
Normalized_Diamond_Image(:,:,3) = Diamond_Blue_Plane' ./ N3;


 figure(2)
 imshow(Normalized_Diamond_Image,[])
 
 
 
 %%%%%%%%%%%%%UNWARPING via FORWARD MAPPING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 reverse_red_plane= reverse(Diamond_Red_Plane);
 reverse_green_plane=reverse(Diamond_Green_Plane);
 reverse_blue_plane=reverse(Diamond_Blue_Plane);
 
 unwarped_image(:,:,1)=reverse_red_plane;
 unwarped_image(:,:,2)=reverse_green_plane;
 unwarped_image(:,:,3)=reverse_blue_plane;

 
 N1=max(reverse_red_plane(:));
 N2=max(reverse_green_plane(:));
 N3=max(reverse_blue_plane(:));
 
normalized_unwarped_image(:,:,1) = unwarped_image(:,:,1) ./ N1;
normalized_unwarped_image(:,:,2) = unwarped_image(:,:,2) ./ N2;
normalized_unwarped_image(:,:,3) = unwarped_image(:,:,3)./ N3;

imtool(normalized_unwarped_image,[])

