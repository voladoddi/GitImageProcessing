clc;

clear all;

seg1=read_raw('seg1.raw',321,481,3);

figure(1)
imshow(uint8(seg1));

seg1extended(:,:,1)=extend(seg1(:,:,1),18);
seg1extended(:,:,2)=extend(seg1(:,:,2),18);
seg1extended(:,:,3)=extend(seg1(:,:,3),18);

figure(2)
imshow(uint8(seg1extended));

result=mean_shift(seg1extended,18);



figure(3)
imshow(uint8(result));