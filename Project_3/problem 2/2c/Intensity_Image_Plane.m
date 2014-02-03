function Location = Intensity_Image_Plane(World_Cordinate_In,Image_Width,Image_Height,f)


%%%%%% This function will give the intensity value at the Normalized Image
%%%%%% Plane 
% 
% Face_1_Image = Read_Raw_('image1.raw',200,200);
% Face_2_Image = Read_Raw_('image2.raw',200,200);
% Face_3_Image = Read_Raw_('image3.raw',200,200);
% %%%%%%% Visibility Check for the point
% Face_1 = World_Cordinate_In(3) == 1 && abs(World_Cordinate_In(1)) >= 0 && abs(World_Cordinate_In(2)) >= 0 && abs(World_Cordinate_In(1)) < 1 && abs(World_Cordinate_In(2)) < 1;
% Face_2 = World_Cordinate_In(1) == 1 && abs(World_Cordinate_In(2)) >= 0 && abs(World_Cordinate_In(3)) >= 0 && abs(World_Cordinate_In(3)) < 1 && abs(World_Cordinate_In(2)) < 1;
% Face_3 = World_Cordinate_In(2) == 1 && abs(World_Cordinate_In(1)) >= 0 && abs(World_Cordinate_In(3)) >= 0 && abs(World_Cordinate_In(1)) < 1 && abs(World_Cordinate_In(3)) < 1;
% 
% if((Face_1 || Face_2 || Face_3))

%%%%%%%% Defining the Extrinsic Matrix

r = [5 5 5];
X_c = [-1/sqrt(2) 1/sqrt(2) 0];
Y_c = [1/sqrt(6) 1/sqrt(6) -2/sqrt(6)];
Z_c = [-1/sqrt(3) -1/sqrt(3) -1/sqrt(3)];

Extrinsic_Matrix_Forward = [ X_c dot(-r,X_c);Y_c dot(-r,Y_c);Z_c dot(-r,Z_c)];



cx = Image_Width / 2;
cy = Image_Height / 2;

 Intrinsic_Matrix_Forward =[f 0 cx;0 f cy;0 0 1];

 

% 
% 

Cordinate_Actual_Image = (Intrinsic_Matrix_Forward*Extrinsic_Matrix_Forward*[World_Cordinate_In';1]);

w = Cordinate_Actual_Image(3);

Locations  = (Cordinate_Actual_Image ./ w);
Location(1) = floor((Locations(1)-100)*300)+300;
Location(2) = floor ((Locations(2)-100)*300)+300;


% Location=[Location(1) Location(2)];


% 
% if(Face_1) %z=1
%     disp('face 1 - placed image1.raw "funny 569"');
% Intensity = [Face_1_Image(x_display,y_display,1) Face_1_Image(x_display,y_display,2) Face_1_Image(x_display,y_display,3)];
% end
% 
% if(Face_2) %x=1
%     disp('face 2 - placed image2.raw "trojan helmet"');
% Intensity = [Face_2_Image(y_display,z_display,1) Face_2_Image(y_display,z_display,2) Face_2_Image(y_display,z_display,3)];
% end
% 
% if(Face_3) %y=1
% Intensity = [Face_3_Image(x_display,z_display,1) Face_3_Image(x_display,z_display,2) Face_3_Image(x_display,z_display,3)];
% disp('face 3 - placed image3.raw "football player"');
% end
% 
% else
%     display('Not Visible')
%     Intensity = 0;
%     Location = 0;
% end






end