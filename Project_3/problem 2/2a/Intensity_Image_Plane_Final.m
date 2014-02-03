function [Intensity] = Intensity_Image_Plane_Final(World_Cordinate_In,Image_Width,Image_Height,f)


%%%%%% This function will give the intensity value at the Normalized Image
%%%%%% Plane 

Face_1_Image = Read_Raw_('image1.raw',200,200);
Face_2_Image = Read_Raw_('image2.raw',200,200);
Face_3_Image = Read_Raw_('image3.raw',200,200);
%%%%%%% Visibility Check for the point
Face_1 = World_Cordinate_In(3) == 1 && abs(World_Cordinate_In(1)) >= 0 && abs(World_Cordinate_In(2)) >= 0 && abs(World_Cordinate_In(1)) < 1 && abs(World_Cordinate_In(2)) < 1;
Face_2 = World_Cordinate_In(1) == 1 && abs(World_Cordinate_In(2)) >= 0 && abs(World_Cordinate_In(3)) >= 0 && abs(World_Cordinate_In(3)) < 1 && abs(World_Cordinate_In(2)) < 1;
Face_3 = World_Cordinate_In(2) == 1 && abs(World_Cordinate_In(1)) >= 0 && abs(World_Cordinate_In(3)) >= 0 && abs(World_Cordinate_In(1)) < 1 && abs(World_Cordinate_In(3)) < 1;

if Face_1==0
    if World_Cordinate_In(3) ==1 && abs(World_Cordinate_In(1)*World_Cordinate_In(2))==1
        Face_1=1;
%         Face_2=0;
%         Face_3=0;
    end
end

if Face_2==0
    if World_Cordinate_In(1) ==1 && abs(World_Cordinate_In(2)*World_Cordinate_In(3))==1
%         Face_1=0;
        Face_2=1;
%         Face_3=0;
    end
end
if Face_3==0
    if World_Cordinate_In(2) ==1 && abs(World_Cordinate_In(1)*World_Cordinate_In(3))==1
%         Face_1=0;
%         Face_2=0;
        Face_3=1;
    end
end


if((Face_1 || Face_2 || Face_3))

%%%%%%%% Defining the Extrinsic Matrix

r = [5 5 5];
X_c = [-1/sqrt(2) 1/sqrt(2) 0];
Y_c = [1/sqrt(6) 1/sqrt(6) -2/sqrt(6)];
Z_c = [-1/sqrt(3) -1/sqrt(3) -1/sqrt(3)];

Extrinsic_Matrix_Forward = [ X_c -dot(r,X_c);Y_c -dot(r,Y_c);Z_c -dot(r,Z_c)];



cx = Image_Width / 2;
cy = Image_Height / 2;

 Intrinsic_Matrix_Forward =[f 0 cx;0 f cy;0 0 1];

 

% 
% 
Cordinate_Actual_Image = (Intrinsic_Matrix_Forward*Extrinsic_Matrix_Forward*[World_Cordinate_In';1]);

w = Cordinate_Actual_Image(3);

Location  = (Cordinate_Actual_Image ./ w);
Location(1) = ((Location(1)));
Location(2) = ((Location(2)));


x_display= floor(100*World_Cordinate_In(1))+100;
y_display= floor(100*World_Cordinate_In(2))+100;
z_display= floor(100*World_Cordinate_In(3))+100;

if  x_display==0
    x_display=1;
end
if y_display==0
       y_display=1;
end
if z_display==0
       z_display=1;
end

if(Face_1) %z=1
    disp('face 1 - placed image1.raw "funny 569"');
    Intensity = [Face_1_Image(x_display,y_display,1) Face_1_Image(x_display,y_display,2) Face_1_Image(x_display,y_display,3)];
    X_=x_display
    Y_=y_display
end

if(Face_2) %x=1
    disp('face 2 - placed image2.raw "trojan helmet"');
Intensity = [Face_2_Image(y_display,z_display,1) Face_2_Image(y_display,z_display,2) Face_2_Image(y_display,z_display,3)];
X_=y_display
Y_=z_display
end

if(Face_3) %y=1
disp('face 3 - placed image3.raw "football player"');
    Intensity = [Face_3_Image(x_display,z_display,1) Face_3_Image(x_display,z_display,2) Face_3_Image(x_display,z_display,3)];
X_=x_display
Y_=y_display
end

else
    display('Not Visible')
    Intensity = 0;
    Location = 0;
end






end