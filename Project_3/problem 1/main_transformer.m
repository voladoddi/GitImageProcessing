
                                                                     
                                                                     
                                             
%%%%%%Circular Warping

%%%%%%Warping Via Control Points Selection

clc 
clear all
close all
Image_Transformmer = Read_Raw_('transformmer.raw',500,500);
Normalized_Transformer_Image  = Image_Transformmer;
%delete Point.txt



N1 = Image_Transformmer(:,:,1);
N1 = max(N1(:));

N2 = Image_Transformmer(:,:,2);
N2 = max(N2(:));

N3 = Image_Transformmer(:,:,3);
N3 = max(N3(:));

Normalized_Transformer_Image(:,:,1) = Image_Transformmer(:,:,1) ./ N1;
Normalized_Transformer_Image(:,:,2) = Image_Transformmer(:,:,2) ./ N2;
Normalized_Transformer_Image(:,:,3) = Image_Transformmer(:,:,3) ./ N3;


% figure
 imshow(Normalized_Transformer_Image)

Circular_Image_Red_Plane = Circular_Warp(Image_Transformmer(:,:,1));
Circular_Image_Green_Plane = Circular_Warp(Image_Transformmer(:,:,2));
Circular_Image_Blue_Plane = Circular_Warp(Image_Transformmer(:,:,3));



N1 = max(Circular_Image_Red_Plane(:));
N2 = max(Circular_Image_Green_Plane(:));
N3 = max(Circular_Image_Blue_Plane(:));


Normalized_Circulat_Transformer_Image(:,:,1) = Circular_Image_Red_Plane' ./ N1;
Normalized_Circulat_Transformer_Image(:,:,2) = Circular_Image_Green_Plane' ./ N2;
Normalized_Circulat_Transformer_Image(:,:,3) = Circular_Image_Blue_Plane' ./ N3;

imtool(Normalized_Circulat_Transformer_Image,[])

%  %%%%%%%%%%%%%UNWARPING via FORWARD MAPPING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 reverse_red_plane= Reverse_Circular_Warp(Circular_Image_Red_Plane);
 reverse_green_plane= Reverse_Circular_Warp(Circular_Image_Green_Plane);
 reverse_blue_plane= Reverse_Circular_Warp(Circular_Image_Blue_Plane);
 
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