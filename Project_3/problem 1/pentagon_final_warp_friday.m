% 
% clc;
% clear all;
% 
% input=read_raw_gray('cowboy.raw',500,500,3);
% imshow(uint8(input));
% 
% output=zeros(size(input));

function warp=pentagon_final_warp_friday(image)
input=image;
%region 1-------quadrant 1----triangle 1
scale_i=174/171;
yi=0;

for i=4:174
    %input -x 

    
    yi=yi + scale_i;
    i1=round(yi);
    
    scale_j = 233/171;
    ratio_j=249/((scale_j*(i-4+1)));
    
    
    xj=0;
    
    
  for j= 249-(scale_j*(i-4)):249
    
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

yi=0;

for i=4:174
    %input -x 

    
    yi=yi + scale_i;
    i1=round(yi);
    
    scale_j = 233/171;
    ratio_j=249/((scale_j*(i-4+1)));
    
    
    xj=499;
    
    
for j=(250+scale_j*(i-4)):-1:249
    
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
scale_i=(500-174)/(449-174);
yi= 175;

for i  = 175:449
    yi = yi + scale_i;
    
    i1=round(yi);
    
    scale_j= (106-17)/(449-174);
    ratio_j=249/(249-((i-123)*(scale_j)));
    
    xj=0;
    
    for j=(i-123)*scale_j : 249
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
scale_i=(500-174)/(449-174);
yi= 175;

for i  = 175:449
    yi = yi + scale_i;
    
    i1=round(yi);
    
    scale_j= (106-17)/(449-174);
    ratio_j=249/(249-((i-123)*(scale_j)));
    
    xj=499;
    
    for j= 499-(i-123)*scale_j : -1: 249
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
% 
% fid=fopen('cowboy_out.raw','wb');
% fwrite(fid,output');
% 
% figure(2)
% imshow(uint8(output));

warp=output;

end
