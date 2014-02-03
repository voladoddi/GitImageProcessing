clc;
clear all;

star_gray=read_raw_gray('stars.raw',768,1024,3);
size_star_gray=size(star_gray);



figure(1)
imshow(uint8(star_gray));

iteration =0; %to count number of iterations.
it=1; % index to store number of stars in each iteration

figure(2)
histogram(star_gray);


for i=1:size_star_gray(1)
    for j=1:size_star_gray(2)
    if star_gray(i,j)<30 %threshold =30 selected after observing histogram.
       star_gray(i,j)=0; 
    else 
        star_gray(i,j)=255;
    end
    end
end

imtool(star_gray,[]);
%  figure(3)
%  imshow(uint8(star_gray));

star_binary=zeros(size(star_gray)+2);
star_binary(2:size_star_gray(1)+1,2:size_star_gray(2)+1)=(star_gray(:,:))./255;

F=star_binary;

sp=xlsread('spattern_con.xls','B3:BG11');
s=size(sp);
flag=true;

while flag
    Fhat=zeros(size(F));
for l=2:769
for m=2:1025

    var=1;
        pattern=zeros(9,1);
        for win_w=(l-1):(l+1)
            for win_h=(m-1):(m+1)
                pattern(var)=F(win_w,win_h);
                var=var+1;
            end
        end
        
         for szc=1:s(2)
                if pattern==sp(:,szc)
                    Fhat(l,m)=1;
               end
          end
end
end

G=zeros(size(Fhat));

for j=2:769
for k=2:1025
    
    if Fhat(j,k)==0
        G(j,k)=F(j,k);
    elseif Fhat(j,k)==1
        var=1;
        pattern_window=zeros(9,1);
             
                for win_w=(j-1):(j+1)
                for win_h=(k-1):(k+1)
                
                pattern_window(var)=Fhat(win_w,win_h);
                var=var+1;
                end
                
                end
        M=uncon_mask(pattern_window);
                if M==1;
                    G(j,k)=F(j,k);
                end
    end
    
   
    
end
end

var=1;
count=0;

for x=2:769
    for y=2:1025
            if G(x,y)==1 
            if (G(x-1,y-1)==0 && G(x,y-1)==0 && G(x+1,y-1)==0 && G(x-1,y)==0 && G(x+1,y)==0 && G(x-1,y+1)==0 && G(x,y+1)==0 && G(x+1,y+1)==0)
                  count=count+1;

            end
            end
         
    end
end

       count_arr(it)=count;    
       count=0;   
       it=it+1;
       
        if F==G
            flag=false;
            break;
        
        else
          F=G;
          iteration=iteration+1;
%           it=it+1;
        end
end

number=sum(G(:));

figure(5)
imshow(uint8(G*255));
title('after unconditional masking');

it_plot=1:1:it-1;


count1(1)=count_arr(1);
count1(2)=count_arr(2)-count_arr(1);
count1(3)=count_arr(3)-count_arr(2);
count1(4)=count_arr(4)-count_arr(3);
count1(5)=count_arr(5)-count_arr(4);
count1(6)=count_arr(6)-count_arr(5);
count1(7)=count_arr(7)-count_arr(6);
count1(8)=count_arr(8)-count_arr(7);
count1(9)=count_arr(9)-count_arr(8);
count1(10)=count_arr(10)-count_arr(9);
count1(11)=count_arr(11)-count_arr(10);
count1(12)=count_arr(12)-count_arr(11);
count1(13)=count_arr(13)-count_arr(12);

figure(7)
stem(it_plot,count1);
title('histogram');

total_count=count1(1)+count1(2)+count1(3)+count1(4)+count1(5)+count1(6)+count1(7)+count1(8)+count1(9)+count1(10)+count1(11)+count1(12)+count1(13);
disp(total_count);