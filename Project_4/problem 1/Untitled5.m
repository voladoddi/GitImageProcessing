clc;
clear all;

img11=read_raw('bruce_banner.raw',400,400,3);
img21=read_raw('hulk.raw',400,400,3);

figure(3)
imshow(uint8(img21));

img1=bruce_t(img11);
img2=hulk_t(img21);

figure(1)
imshow(uint8(img1));

figure(2)
imshow(uint8(img2));


%%%%%video 
nFrames =1;
vidObj = VideoWriter('transition_hulk1a.avi');
vidObj.Quality = 100;
open(vidObj);

A=struct('cdata',[],'colormap',[]);
for alpha=0:0.01:1

Frame3(:,:,1) = (1-alpha)*img1(:,:,1)+ alpha*img2(:,:,1);
Frame3(:,:,2) = (1-alpha)*img1(:,:,2)+ alpha*img2(:,:,2);
Frame3(:,:,3) = (1-alpha)*img1(:,:,3)+ alpha*img2(:,:,3);


 

   A(nFrames).cdata=uint8(Frame3);
   writeVideo(vidObj,A(nFrames));
   nFrames=nFrames+1;
 
 
end
close(vidObj);
winopen('transition_hulk1a.avi');