clc;
clear all;


tex1=read_raw('texture1.raw',128,128,1);
tex2=read_raw('texture2.raw',128,128,1);
tex3=read_raw('texture3.raw',128,128,1);
tex4=read_raw('texture4.raw',128,128,1);

tex5=read_raw('texture5.raw',128,128,1);
tex6=read_raw('texture6.raw',128,128,1);
tex7=read_raw('texture7.raw',128,128,1);
tex8=read_raw('texture8.raw',128,128,1);

tex9=read_raw('texture9.raw',128,128,1);
tex10=read_raw('texture10.raw',128,128,1);
tex11=read_raw('texture11.raw',128,128,1);
tex12=read_raw('texture12.raw',128,128,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%% 12 input textures %%%%%%%%%%%%%%%%%%%%%%%%%%
texture1=extend_bound(tex1);


texture2=extend_bound(tex2);


texture3=extend_bound(tex3);


texture4=extend_bound(tex4);


texture5=extend_bound(tex5);


texture6=extend_bound(tex6);


texture7=extend_bound(tex7);


texture8=extend_bound(tex8);


texture9=extend_bound(tex9);


texture10=extend_bound(tex10);


texture11=extend_bound(tex11);


texture12=extend_bound(tex12);


%%%%%%%%%%%%%%%%%%%%%%%%   construction of Laws Filters  %%%%%%%%%%%%%%%%%
E5=(1/6).*[-1 -2 0 2 1];
S5=(1/4).*[-1 0 2 0 -1];
W5=(1/6).*[-1 2 0 -2 1];

E5E5= (E5')*(E5);
E5S5= (E5')*(S5);
E5W5= (E5')*(W5);

S5E5= (S5')*(E5);
S5S5= (S5')*(S5);
S5W5= (S5')*(W5);

W5S5= (W5')*(S5);
W5E5= (W5')*(E5);
W5W5= (W5')*(W5);

mask(:,:,1)=E5E5;
mask(:,:,2)=E5S5;
mask(:,:,3)=E5W5;
mask(:,:,4)=W5E5;
mask(:,:,5)=W5W5;
mask(:,:,6)=W5S5;
mask(:,:,7)=S5E5;
mask(:,:,8)=S5S5;
mask(:,:,9)=S5W5;

%%%%%%%%%%%%%%%%%%9-D feature vector for each layer%%%%%%%%%%%%%%%
%%%%%%%%%% take  picture 1, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex1feat(:,:,i)=feature_image(mask(:,:,i),texture1);
end

%%%%%%%%%% take picture 2, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex2feat(:,:,i)=feature_image(mask(:,:,i),texture2);
end

%%%%%%%%%% take picture 3, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex3feat(:,:,i)=feature_image(mask(:,:,i),texture3);
end

%%%%%%%%%% take picture 4, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex4feat(:,:,i)=feature_image(mask(:,:,i),texture4);
end

%%%%%%%%%% take  picture 5, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex5feat(:,:,i)=feature_image(mask(:,:,i),texture5);
end

%%%%%%%%%% take  picture 6, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex6feat(:,:,i)=feature_image(mask(:,:,i),texture6);
end

%%%%%%%%%% take picture 7, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex7feat(:,:,i)=feature_image(mask(:,:,i),texture7);
end

%%%%%%%%%% take  picture 8, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex8feat(:,:,i)=feature_image(mask(:,:,i),texture8);
end

%%%%%%%%%% take  picture 9, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex9feat(:,:,i)=feature_image(mask(:,:,i),texture9);
end

%%%%%%%%%% take  picture 10, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex10feat(:,:,i)=feature_image(mask(:,:,i),texture10);
end

%%%%%%%%%% take  picture 11, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex11feat(:,:,i)=feature_image(mask(:,:,i),texture11);
end

%%%%%%%%%% take picture 12, get 9-D feature vector %%%%%%%%%%%%%%%
for i=1:9
    tex12feat(:,:,i)=feature_image(mask(:,:,i),texture12);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%FeatureAveraging%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    text1avg=average(tex1feat)
    text2avg=average(tex2feat)
    text3avg=average(tex3feat)
    text4avg=average(tex4feat)
    text5avg=average(tex5feat)
    text6avg=average(tex6feat)
    text7avg=average(tex7feat)
    text8avg=average(tex8feat)
    text9avg=average(tex9feat)
    text10avg=average(tex10feat)
    text11avg=average(tex11feat)
    text12avg=average(tex12feat)
    
   
X=[text1avg'; text2avg'; text3avg'; text4avg'; text5avg'; text6avg'; text7avg';...
    text8avg'; text9avg'; text10avg'; text11avg'; text12avg'];

cluster=kmeans(X,4)




