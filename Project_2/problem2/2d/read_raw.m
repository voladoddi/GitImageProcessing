function Im=read_raw(filename,wt,ht,ch)


fid=fopen(filename,'r');     
pixel=fread(fid,inf,'uint8');
fclose(fid);
              
[Y X]=size(pixel);
        Size=(Y*X);
          
        
I(1:Size)=pixel(1:Size);
I=I';

%convert into 3-channel color image if ch=3;
if ch==3
j=1;
for i=1:3:wt*ht*ch
Red(j,1)=I(i,1);
Green(j,1)=I(i+1,1);
Blue(j,1)=I(i+2,1);
  
j=j+1;
end

var=1;
for i=1:wt
    for j=1:ht
        Red256(i,j)=Red(var,1);
        Green256(i,j)=Green(var,1);
        Blue256(i,j)=Blue(var,1);
        var=var+1;
    end
end

A(:,:,1)=Red256;
A(:,:,2)=Green256;
A(:,:,3)=Blue256;

Im=A;

elseif ch==1;
%convert into 2D form if only 1 channel;
var=1;
for i=1:wt
    for j=1:ht
        gray2D(i,j)=I(var,1);
        var=var+1;
    end
end
Im=gray2D;
end

end
