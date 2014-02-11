clc;
clear all;

bruce=read_raw('bruce_banner.raw',400,400,3);
hulk=read_raw('hulk.raw',400,400,3);

 

X_Hulk=[1,1,1,1,1,128,140,174,168,174,170,176,144,124,202,228,208,264,290,286,266,378,400,400];
Y_Hulk=[1,120,192,274,400,30,78,122,154,198,244,280,324,374,30,200,366,40,126,276,366,206,1,400];

X_Bruce=[1,1,1,1,1,147,142,169,158,155,152,162,138,125,218,249,220,286,304,300,280,380,400,400];
Y_Bruce=[1,120,192,274,400,39,97,135,166,194,224,258,294,372,57,199,352,76,144,262,334,206,1,400];

X_intermediate= X_Bruce; Y_intermediate=Y_Bruce;

X_diff = X_Hulk - X_Bruce;
Y_diff = Y_Hulk - Y_Bruce;

X_diff=X_diff./10;
Y_diff=Y_diff./10;

hulk_warp=zeros(400,400,3);
bruce_warp=zeros(400,400,3);

%%% video 
nFrames =1;
vidObj = VideoWriter('transitionBR.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 2;
open(vidObj);

A=struct('cdata',[],'colormap',[]);


for alpha = 0.1:0.1:1
    hulk_warp  = image_warp(hulk,X_Hulk,Y_Hulk,X_intermediate,Y_intermediate);
    bruce_warp = image_warp(bruce,X_Bruce,Y_Bruce,X_intermediate,Y_intermediate);

alpha

%
Frame3(:,:,1) = (1-alpha)*bruce_warp(:,:,1)+ alpha*hulk_warp(:,:,1);
Frame3(:,:,2) = (1-alpha)*bruce_warp(:,:,2)+ alpha*hulk_warp(:,:,2);
Frame3(:,:,3) = (1-alpha)*bruce_warp(:,:,3)+ alpha*hulk_warp(:,:,3);
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
 winopen('transitionBR.avi');
 
 figure(3)
 imshow(uint8(pic1));
 
 figure(4)
 imshow(uint8(pic2));
 
 figure(5)
 imshow(uint8(pic3));
 
 