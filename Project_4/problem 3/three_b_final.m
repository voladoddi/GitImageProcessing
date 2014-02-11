clc;

clear all;

tic;

seg1=read_raw('seg1.raw',321,481,3);

figure(1)
imshow(uint8(seg1));

seg1extended(:,:,1)=extend(seg1(:,:,1),24);
seg1extended(:,:,2)=extend(seg1(:,:,2),24);
seg1extended(:,:,3)=extend(seg1(:,:,3),24);

figure(2)
imshow(uint8(seg1extended));

image= seg1extended;

% 
% for i=100:200
%     for j=100:200
%         image(i,j,:)=seg1extended(i,j,:);
%     end
% end

% figure(3)
% imshow(uint8(image));

in=image;

out=zeros(size(in));


sigma_s=256;
sigma_r=1024;

iter=1;
MAXITER=4;
filter_window_dimension=24;


ES=filter_window_dimension/2;


R=size(in,1);
C=size(in,2);


while (iter<=MAXITER)
iter

  for l=1+ES:R-ES
  for m=1+ES:C-ES
l
m
                     sum_w=0;
                    sum_nr=0;
                    
            for win_w=-ES:ES
            for win_h=-ES:ES
                
                
                yi=in(l,m,:);
                
                    
                dist= sqrt((l-(l+win_w))^2 + (m-(m+win_h))^2);
                first_exp= -((dist^2)/sigma_s); %spatial exponent
                
                   
                feat= yi-in(l+win_w,m+win_h,:);
                feat= sqrt((feat(1)^2) + (feat(2)^2) + (feat(3)^2));
                
                second_exp= -((feat^2)/sigma_r); %range exponent
                
                w_term=exp(first_exp)*exp(second_exp)*feat;
              
                
                sum_w= sum_w + w_term; %denominator of yi_k
                sum_nr = sum_nr + (in(l+win_w,m+win_h,:).*w_term); %numerator of yi_k
                
                yi=ceil(sum_nr./sum_w);
                             
            end
            end
  out(l,m,:)=yi;          
  end
  end
  
 iter=iter+1;  
end
outp=out(1+ES:R-ES,1+ES:C-ES,:);


figure(4)
imshow(uint8(outp));


fid=fopen('seg1result_1632.raw','wb');
fwrite(fid,outp);



time_elapsed=toc