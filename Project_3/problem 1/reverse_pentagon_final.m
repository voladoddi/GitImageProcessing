
function reverse_warp=reverse_pentagon_final(image)
% clc;
% clear all;
% 
% input=read_raw('cowboy_out.raw',500,500,1);
% 
% figure(1)
% imshow(uint8(input));
input=image;
output=zeros(size(input));

%%%% region 1 
scale_i=171/174;
yi=4;

for i=1:175
    %input -x 

    
    yi=yi + scale_i;
    i1=round(yi);
    
    scale_j = 233/171;
    ratio_j=((scale_j*(i-4+1)))/249;
    
    
    xj=250-(scale_j*(yi-4));
    
    
  for j= 1:250
    
    xj= xj+ratio_j;
    j1=round(xj);

    %input - y
        if i1>0 && i1<500 && j1>0 && j1<500
       
            j=floor(j);
           output(i,j)= input(i1,j1);
       else
        
        output(i,j)=0;
       end
    
end
end

%region 2----------------QUADRANT 2--- triangle 2

yi=4;

for i=1:174
    %input -x 

    
    yi=yi + scale_i;
    i1=round(yi);
    
    scale_j = 233/171;
    ratio_j=((scale_j*(i-4+1)))/249;
    
    
    xj=(249+scale_j*(yi-4));
    
    
for j=500:-1:249
    
    xj= xj-ratio_j;
    j1=round(xj);

    %input - y
        if i1>0 && i1<500 && j1>0 && j1<500
       
            j=floor(j);
           output(i,j)= input(i1,j1);
       else
        
        output(i,j)=0;
       end
    
end
end

%region 3---------QUADRANT 3--------------QUADRILATERAL 3
scale_i=(449-174)/(500-174);
yi= 175;

for i  = 175:449
    yi = yi + scale_i;
    
    i1=round(yi);
    
    scale_j= (106-17)/(449-174);
    ratio_j=(249-((i-123)*(scale_j)))/249;
    
    xj=(i-123)*scale_j;
    
    for j= 1: 249
        xj=xj+ratio_j;
        j1=round(xj);
        
        if i1>0 && i1<500 && j1>0 && j1<500
            j=floor(j);
            output(i,j)=input(i1,j1);
%         else
%             output(i,j)=0;
        end
    end
end
%region 4--------------QUADRANT 4------------QUADRILATERAL 4
scale_i=(449-174)/(500-174);
yi= 175;

for i  = 175:449
    yi = yi + scale_i;
    
    i1=round(yi);
    
    scale_j= (106-17)/(449-174);
    ratio_j=(249-((i-123)*(scale_j)))/249;
    
    xj=499-(i-123)*scale_j ;
    
    for j=500 : -1: 249
        xj=xj-ratio_j;
        j1=round(xj);
        
        if i1>0 && i1<500 && j1>0 && j1<500
            j=floor(j);
            output(i,j)=input(i1,j1);
%         else
%             output(i,j)=0;
        end
    end
end
reverse_warp=output;
end
% figure(2)
% imshow(uint8(output));