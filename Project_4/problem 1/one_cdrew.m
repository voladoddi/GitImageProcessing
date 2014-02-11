clc;
clear all;

young_drew_dis=imread('young_drew','jpg');
old_drew_dis=imread('old_drew','jpg');

figure(1)
imshow(young_drew_dis);

figure(2)
imshow(old_drew_dis);


young_drew=read_raw('young_drew.raw',350,300,3);
old_drew=read_raw('old_drew.raw',350,300,3);

X_old=[1,1,1,1,1,162,152,174,160,168,156,170,152,144,230,240,226,262,276,272,254,339,350,350];
Y_old=[1,116,158,200,300,31,74,98,124,152,176,202,238,278,52,153,259,64,114,192,244,152,1,300];

X_young=[1,1,1,1,1,168,154,176,160,175,160,178,152,170,228,230,238,256,266,270,256,334,350,350];
Y_young=[1,116,158,200,300,18,70,98,120,150,174,202,228,278,42,151,260,51,106,190,246,150,1,300];



X_intermediate= X_old; Y_intermediate=Y_old;

X_diff = X_young - X_old;
Y_diff = Y_young - Y_old;

X_diff=X_diff./10;
Y_diff=Y_diff./10;

hyoung_warp=zeros(350,300,3);
bold_warp=zeros(350,300,3);

%%% video 
nFrames =1;
vidObj = VideoWriter('transition_drewonec.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 2;
open(vidObj);

A=struct('cdata',[],'colormap',[]);


for alpha = 0.1:0.1:1
    
   hyoung_warp  = image_warp(young_drew,X_young,Y_young,X_intermediate,Y_intermediate);
   bold_warp = image_warp(old_drew,X_old,Y_old,X_intermediate,Y_intermediate);

   alpha
   
Frame3(:,:,1) = (1-alpha)*bold_warp(:,:,1)+ alpha*hyoung_warp(:,:,1);
Frame3(:,:,2) = (1-alpha)*bold_warp(:,:,2)+ alpha*hyoung_warp(:,:,2);
Frame3(:,:,3) = (1-alpha)*bold_warp(:,:,3)+ alpha*hyoung_warp(:,:,3);
% 

     if alpha == 0.2
         pic1 = Frame3;
     elseif alpha == 0.5
         pic2 = Frame3;
     elseif alpha ==0.8
         pic3 = Frame3;
     end
     
            X_intermediate=ceil(X_intermediate+X_diff);
            Y_intermediate=ceil(Y_intermediate+Y_diff);

 

   A(nFrames).cdata=uint8(Frame3);
   writeVideo(vidObj,A(nFrames));
   nFrames=nFrames+1;
%  
 
end
 close(vidObj);
 winopen('transition_drewonec.avi');
 
  figure(3)
 imshow(uint8(pic1));
 
 figure(4)
 imshow(uint8(pic2));
 
 figure(5)
 imshow(uint8(pic3));
 
 