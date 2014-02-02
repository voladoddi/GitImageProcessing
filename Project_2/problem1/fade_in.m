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
%imtool(Edge_Naruto, [])



%%%%%%Now start making movie 
Size_Frame = size(Edge_Image);

Frame1(:,:,1) = Edge_Image;
Frame1(:,:,2) = Edge_Image;
Frame1(:,:,3) = Edge_Image;

 Frame2(:,:,1) = Read_The_Image(:,:,1);
 Frame2(:,:,2) = Read_The_Image(:,:,2);
 Frame2(:,:,3) = Read_The_Image(:,:,3);


%# create AVI object
nFrames =1;
vidObj = VideoWriter('transition3.avi');
vidObj.Quality = 100;
open(vidObj);

A=struct('cdata',[],'colormap',[]);


for i=-0.5:0.01:0.5

Frame3(:,:,1) = ((0.5+(i))*Frame1(:,:,1))+((0.5-(i))*Frame2(:,:,1));
Frame3(:,:,2) = ((0.5+(i))*Frame1(:,:,2))+((0.5-(i))*Frame2(:,:,2));
Frame3(:,:,3) = ((0.5+(i))*Frame1(:,:,3))+((0.5-(i))*Frame2(:,:,3));


 

   A(nFrames).cdata=uint8(Frame3);
   writeVideo(vidObj,A(nFrames));
   nFrames=nFrames+1;
 
 
end
close(vidObj);
winopen('transition3.avi');