clc;
clear all;

Image_Out=zeros(500,500,3);

Face_1_Image = Read_Raw_('image1.raw',200,200);
Face_2_Image = Read_Raw_('image2.raw',200,200);
Face_3_Image = Read_Raw_('image3.raw',200,200);

f=sqrt(3);

%face 1
Z=1;
var=1;
for X=-1:0.01:1
    for Y= -1:0.01:1
        
        Location_call=Intensity_Image_Plane([X Y Z],200,200,f);
x_display= floor(100*X)+100;
y_display= floor(100*Y)+100;
z_display= floor(100*Z)+100;

if  x_display==0
    x_display=1;
end
if y_display==0
       y_display=1;
end
       if z_display==0
       z_display=1;
end
    Image_Out(Location_call(2)-50,Location_call(1)-50,:)=Face_1_Image(x_display,y_display,:);
    
    end
end


Y=1; disp('y=1');

for X=-1:0.01:1
    for Z= -1:0.01:1
        
       
        Location_call=Intensity_Image_Plane([X Y Z],200,200,f);
        
x_display= floor(100*X)+100;
y_display= floor(100*Y)+100;
z_display= floor(100*Z)+100;

if  x_display==0
    x_display=1;
end
if y_display==0
       y_display=1;
end
if z_display==0
       z_display=1;
end
    Image_Out(Location_call(2)-50,Location_call(1)-50,:)=Face_2_Image(x_display,z_display ,:);
    
    end
end

X=1;
 disp('y=2');
for Y=-1:0.01:1
    for Z= -1:0.01:1
       
        Location_call=Intensity_Image_Plane([X Y Z],200,200,f);
        
x_display= floor(100*X)+100;
y_display= floor(100*Y)+100;
z_display= floor(100*Z)+100;

if  x_display==0
    x_display=1;
end
if y_display==0
       y_display=1;
end
if z_display==0
       z_display=1;
end
    Image_Out(Location_call(2)-50,Location_call(1)-50,:)=Face_3_Image(y_display,201-z_display,:);
    
    end
end


imshow(uint8(Image_Out));

