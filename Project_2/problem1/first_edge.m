%-----------------------------------START FIRST ORDER DERIVATIVE EDGE DETECTION---------------
function f_order=first_edge(image)

x_img=image;
%use a mask for first order derivative - Sobel

%convolving image with ROW mask
SobelR=[1 0 -1; 2 0 -2; 1 0 -1];
[m n]=size(SobelR);


G_row=zeros(size(x_img));
[M N]=size(G_row);

for y=1:N-2
    for x=1:M-2
        sum=0;
        for k=0:n-1
            for j=0:m-1
                sum=sum+(SobelR(k+1,j+1)*x_img(x+k,y+j));
            end
        end
     G_row(x,y)=sum/4;
    end
end


%%convolving image with COLUMN mask
SobelC=[1 2 1; 0 0 0; -1 -2 -1];
[m n]=size(SobelC);
G_col=zeros(size(x_img));
[M N]=size(G_col);

for y=1:N-2
    for x=1:M-2
        sum=0;
        for k=0:n-1
            for j=0:m-1
                sum=sum+(SobelC(k+1,j+1)*x_img(x+k,y+j));
            end
        end
     G_col(x,y)=sum/4;
    end
end


for y=1:N
    for x=1:M
        mag_map(x,y)=sqrt((G_row(x,y)^2) + (G_col(x,y)^2));
    end
end
mmap=mag_map; 

%display pencil sketch
for y=1:N
    for x=1:M
      mmap(x,y)=255-mmap(x,y);
    end   
end

f_order=mmap;        %pencil sketch effect done
                     %further steps commented below not required



% %               %%to find out the range of magnitudes.
% % minm=min(mag_map(:,:)); %minimum value of magnitude for stored minimum values
% % maxm=max(mag_map(:,:)); %max of max val array
% % 
% % range=maxm-minm;
% % 
% %               %%normalising to select threshold
% % for y=1:N
% %     for x=1:M
% %         G(x,y)=((mag_map(x,y)-minm)*255)/range;
% %     end
% % end
% % Mean=mean_(mag_map);
% % 
% %                   %%Thresholding
% % thres=Mean;
% % for i=1:N
% %     for j=1:M
% %         if G(i,j)>thres
% %             G(i,j)=0;
% %         else
% %             G(i,j)=255;
% %         end
% %     end
% % end
% 
% % Image=G; 
% % 
% % figure(4)
% % imshow(Image);
% 
end