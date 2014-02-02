%SLIDE TRANSITIONS 1 & 2


clear all;
close all;
clc;

axis tight
set(gca, 'nextplot','replacechildren');



ch=input('enter 1) for "harrypotter.raw" 2) for "lena_noisy.raw" 3) for "naruto.raw"');

if ch==1
    Read_The_Image = read_raw('harrypotter.raw',256, 256,3);
elseif ch==2
    Read_The_Image = read_raw('lena_noisy.raw',256,256,3);
elseif ch==3
    Read_The_Image = read_raw('naruto.raw',256,256,3);
end

Grainy_Image_Read = read_raw('grainy.raw',256, 256,3);

Gray_Image =.299 * Read_The_Image(: , : , 1) + .587 * Read_The_Image(: , : , 2) + 0.114 * Read_The_Image(: , : , 3);
Edge_Image = first_edge(Gray_Image);

A = .85;  % range (.75,.95);
B = 25;  % range (10,30);


Size_Image_Pencil = size(Edge_Image);

%pencil sketch with background
for i = 1 : Size_Image_Pencil(1)
    for j = 1 : Size_Image_Pencil(2)
        if( Edge_Image(i,j) ~= 1)
        Edge_Image(i,j) = Edge_Image(i,j) + A * Grainy_Image_Read(i,j,1) + B ;
        end
    end
end



%%%%%%Now start making movie 
Size_Frame = size(Edge_Image);

Frame1(:,:,1) = Edge_Image;
Frame1(:,:,2) = Edge_Image;
Frame1(:,:,3) = Edge_Image;

% %%%Normalization for displaying the Image
 N1 = maximum(Edge_Image);
 
 Frame1(:,:,1) = Edge_Image ./ N1;
 Frame1(:,:,2) = Edge_Image ./ N1;
 Frame1(:,:,3) = Edge_Image ./ N1;



 %%Restoring back the Frame1 pixel values
 Frame1(:,:,1) = Edge_Image .* N1;
 Frame1(:,:,2) = Edge_Image .* N1;
 Frame1(:,:,3) = Edge_Image .* N1;
 
 Frame2 = Frame1;


%%%%%Now replacing half of the pixels in Frame1 with the original color
%%%%%pixels

% % % %------------TRANSITION 1 - slide from left-----------------

for i = 1 : Size_Frame(1)
    for j = 1 : Size_Frame(2)/2
        Frame2(i,j,1) = Read_The_Image(i,j,1);
        Frame2(i,j,2) = Read_The_Image(i,j,2);
        Frame2(i,j,3) = Read_The_Image(i,j,3);
    end
end
% %%%Normalization for displaying the Image
 N2 = maximum(Read_The_Image(:,:,1));
 N3 = maximum(Read_The_Image(:,:,2));
 N4 = maximum(Read_The_Image(:,:,3));
 
 Frame2(:,:,1) = Read_The_Image(:,:,1) ./ N2;
 Frame2(:,:,2) = Read_The_Image(:,:,2) ./ N3;
 Frame2(:,:,3) = Read_The_Image(:,:,3) ./ N4;

imtool(Frame2 ,[])

 %%Restoring back the Frame1 pixel values
 Frame2(:,:,1) = Read_The_Image(:,:,1) .* N2;
 Frame2(:,:,2) = Read_The_Image(:,:,2) .* N3;
 Frame2(:,:,3) = Read_The_Image(:,:,3) .* N4;


%# create AVI object
nFrames = 256;
vidObj = VideoWriter('transition1.avi');
vidObj.Quality = 100;
open(vidObj);

A=struct('cdata',[],'colormap',[]);


for i=1:nFrames

 %putting colour image on pencil sketch  
 
    %to normalize
    N1_First_Half = Frame2(:,1:i,1);
    N2_First_Half = Frame2(:,1:i,2);
    N3_First_Half = Frame2(:,1:i,3);
 
    N1_First_Half = maximum(N1_First_Half);
    N2_First_Half = maximum(N2_First_Half);
    N3_First_Half = maximum(N3_First_Half);
%-----
Frame3(:,1:i,1) = Frame2(:,1:i,1)./ N1_First_Half;
Frame3(:,1:i,2) = Frame2(:,1:i,2)./ N2_First_Half;
Frame3(:,1:i,3) = Frame2(:,1:i,3)./ N3_First_Half;


% remaining pencil sketch

    %to normalize
    N1_Second_Half = Frame1(:,(i+1):256,1);
    N2_Second_Half = Frame1(:,(i+1):256,2);
    N3_Second_Half = Frame1(:,(i+1):256,3);
 
    N1_Second_Half = maximum(N1_Second_Half);
    N2_Second_Half = maximum(N2_Second_Half);
    N3_Second_Half = maximum(N3_Second_Half);

Frame3(:,(i+1):256,1) = Frame1(:,(i+1):256,1) ./ N1_Second_Half;
Frame3(:,(i+1):256,2) = Frame1(:,(i+1):256,2) ./ N2_Second_Half;
Frame3(:,(i+1):256,3) = Frame1(:,(i+1):256,3) ./ N3_Second_Half;


    A(i).cdata=Frame3;
   writeVideo(vidObj,A(i));
 
%rescaling
Frame3(:,1:i,1) = Frame2(:,1:i,1).* N1_First_Half;
Frame3(:,1:i,2) = Frame2(:,1:i,2).* N2_First_Half;
Frame3(:,1:i,3) = Frame2(:,1:i,3).* N3_First_Half;
%rescaling
Frame3(:,(i+1):256,1) = Frame1(:,(i+1):256,1) .*N1_Second_Half;
Frame3(:,(i+1):256,2) = Frame1(:,(i+1):256,2) .* N2_Second_Half;
Frame3(:,(i+1):256,3) = Frame1(:,(i+1):256,3) .* N3_Second_Half;


 
end

close(vidObj);
winopen('transition1.avi');


% % % % % % %----------------TRANSITION NO.2-------------------% % % % %
for i = 1 : Size_Frame(1)
    for j = 1 : Size_Frame(2)/2
        Frame2(i,j,1) = Read_The_Image(i,j,1);
        Frame2(i,j,2) = Read_The_Image(i,j,2);
        Frame2(i,j,3) = Read_The_Image(i,j,3);
    end
end
% %%%Normalization for displaying the Image
 N2 = maximum(Read_The_Image(:,:,1));
 N3 = maximum(Read_The_Image(:,:,2));
 N4 = maximum(Read_The_Image(:,:,3));
 
 Frame2(:,:,1) = Read_The_Image(:,:,1) ./ N2;
 Frame2(:,:,2) = Read_The_Image(:,:,2) ./ N3;
 Frame2(:,:,3) = Read_The_Image(:,:,3) ./ N4;


 %%Restoring back the Frame1 pixel values
 Frame2(:,:,1) = Read_The_Image(:,:,1) .* N2;
 Frame2(:,:,2) = Read_The_Image(:,:,2) .* N3;
 Frame2(:,:,3) = Read_The_Image(:,:,3) .* N4;


%# create AVI object
nFrames = 256;
vidObj = VideoWriter('transition2.avi');
vidObj.Quality = 100;
open(vidObj);

A=struct('cdata',[],'colormap',[]);


for i=1:nFrames
   

 %putting colour image on pencil sketch  
 
    %to normalize
    N1_First_Half = Frame2(1:i,:,1);
    N2_First_Half = Frame2(1:i,:,2);
    N3_First_Half = Frame2(1:i,:,3);
 
    N1_First_Half = maximum(N1_First_Half);
    N2_First_Half = maximum(N2_First_Half);
    N3_First_Half = maximum(N3_First_Half);
%-----
Frame3(1:i,:,1) = Frame2(1:i,:,1)./ N1_First_Half;
Frame3(1:i,:,2) = Frame2(1:i,:,2)./ N2_First_Half;
Frame3(1:i,:,3) = Frame2(1:i,:,3)./ N3_First_Half;


% remaining pencil sketch

    %to normalize
    N1_Second_Half = Frame1((i+1):256,:,1);
    N2_Second_Half = Frame1((i+1):256,:,2);
    N3_Second_Half = Frame1((i+1):256,:,3);
 
    N1_Second_Half = maximum(N1_Second_Half);
    N2_Second_Half = maximum(N2_Second_Half);
    N3_Second_Half = maximum(N3_Second_Half);

Frame3((i+1):256,:,1) = Frame1((i+1):256,:,1) ./ N1_Second_Half;
Frame3((i+1):256,:,2) = Frame1((i+1):256,:,2) ./ N2_Second_Half;
Frame3((i+1):256,:,3) = Frame1((i+1):256,:,3) ./ N3_Second_Half;


    A(i).cdata=Frame3;
   writeVideo(vidObj,A(i));
 
%rescaling
Frame3(1:i,:,1) = Frame2(1:i,:,1).* N1_First_Half;
Frame3(1:i,:,2) = Frame2(1:i,:,2).* N2_First_Half;
Frame3(1:i,:,3) = Frame2(1:i,:,3).* N3_First_Half;
%rescaling
Frame3((i+1):256,:,1) = Frame1((i+1):256,:,1) .*N1_Second_Half;
Frame3((i+1):256,:,2) = Frame1((i+1):256,:,2) .* N2_Second_Half;
Frame3((i+1):256,:,3) = Frame1((i+1):256,:,3) .* N3_Second_Half;


 
end
close(vidObj);
winopen('transition2.avi');


