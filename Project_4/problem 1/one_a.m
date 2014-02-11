clc;
clear all;

img11=read_raw('young_drew.raw',350,300,3);
img21=read_raw('old_drew.raw',350,300,3);

img1=young_d(img11);
img2=old_d(img21);

figure(1)
imshow(uint8(img1));

figure(2)
imshow(uint8(img2));

nFrames =1;
vidObj = VideoWriter('transitiondrew_onea.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 2;
open(vidObj);

A=struct('cdata',[],'colormap',[]);
for alpha=0:0.1:1

Frame3(:,:,1) = (1-alpha)*img2(:,:,1)+ alpha*img1(:,:,1);
Frame3(:,:,2) = (1-alpha)*img2(:,:,2)+ alpha*img1(:,:,2);
Frame3(:,:,3) = (1-alpha)*img2(:,:,3)+ alpha*img1(:,:,3);

if alpha == 0.2
    pic1=Frame3;
elseif alpha == 0.5
    pic2=Frame3;
elseif alpha == 0.8
    pic3=Frame3;
end

   A(nFrames).cdata=uint8(Frame3);
   writeVideo(vidObj,A(nFrames));
   nFrames=nFrames+1;
 
 
end
close(vidObj);
winopen('transitiondrew_onea.avi');

figure(3)
imshow(uint8(pic1));
figure(4)
imshow(uint8(pic2));
figure(5)
imshow(uint8(pic3));