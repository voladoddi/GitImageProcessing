function X=extract_shape(filename)
fid=fopen(filename,'rb');
        
        if(fid==-1)
            error('cannot open');
            pause
        end
        
        
        pixel=fread(fid,inf,'uchar');
              fclose(fid);
              
        [X Y]=size(pixel);
        Size=(X*Y);
          
        
        I(1:Size)=pixel(1:Size);
        I=I';
        
        global matrix_red matrix_green matrix_blue red2d green2d blue2d
%----------------------------------------------------------------
%EXTRACTION OF INDIVIDUAL CHANNELS
%------------------------------------------------------------------
%extract blue channel from image

matrix=I;  
j=1;
for i=1:3:198147
      blue2d(j,1)=matrix(i+2,1);
   j=j+1;
end

var=1; %arrange blue matrix in 257x257 form
for l=1:257
    for m=1:257
        matrix_blue(l,m)=blue2d(var,1);
var=var+1;
    end
end
%--------------------------------------------------------------------

%extract red channel from image

matrix=I;  
j=1;
for i=1:3:198147
      red2d(j,1)=matrix(i,1);
   j=j+1;
end

var=1; %arrange red matrix in 257x257 form
for l=1:257
    for m=1:257
        matrix_red(l,m)=red2d(var,1);
var=var+1;
    end
end


%--------------------------------------------------------------------

%extract green channel from image

matrix=I;  
j=1;
for i=1:3:198147
      green2d(j,1)=matrix(i+1,1);
   j=j+1;
end

var=1; %arrange green matrix in 257x257 form
for l=1:257
    for m=1:257
        matrix_green(l,m)=green2d(var,1);
var=var+1;
    end
end




%************************EXTRACT OBJECTS******************************


choice=input('Enter 1 to extract circle and 2 to extract square');


%-------------------------*****Extract Circle***-----------------------
if choice==1
    r=input('enter the radius of the circle to extract');
i=1;
j=1;

for i=1:257;
    for j=1:257;
       x=abs(i-129);
       y=abs(j-129);
      
         if (x^2+y^2<(r-2)^2 || x^2+y^2>(r+2)^2)
           matrix_red(i,j)=255;
           matrix_blue(i,j)=255;
           matrix_green(i,j)=255;
         end
           
       
       end
       end

x=1;
for i=1:257
    for j=1:257
    m_red(x)=matrix_red(i,j);
    m_green(x)=matrix_green(i,j);
    m_blue(x)=matrix_blue(i,j);
    x=x+1;
    end
end

index=1;
for final_index=1:3:198147          %convolve the bytes (interleave) into RGB format to create fianl output image
Output_Im(final_index,1)=m_red(1,index);
Output_Im(final_index+1,1)=m_green(1,index);
Output_Im(final_index+2,1)=m_blue(1,index);
index=index+1;
end


fid=fopen('output_cir.raw','wb'); %create file ID
fwrite(fid,Output_Im,'uchar')
end

%-------------------------*****Extract Square****-------------------------
if choice==2
  s=input('Enter the distance of the square you want to extract from the center');
i=1;
j=1;

mred=matrix_red;
mblue=matrix_blue;
mgreen=matrix_green;



for i=1:257
    for j=1:257
       matrix_red(i,j)=255;
       matrix_blue(i,j)=255;
       matrix_green(i,j)=255;
    end
end
         
row=129-s;                 % to store the first vertical line of the square (side1)
for j=(129-s):(129+s)
    matrix_red(row,j)=mred(row,j);
    matrix_blue(row,j)=mblue(row,j);
    matrix_green(row,j)=mgreen(row,j);
   
end

row=129+s;                     %to store the second vertical line (side3)     
for j=(129-s):(129+s)
    matrix_red(row,j)=mred(row,j);
    matrix_blue(row,j)=mblue(row,j);
    matrix_green(row,j)=mgreen(row,j);
end     

col=129-s;
for i=(129-s):(129+s)           %to store the first horizontal boundary (side2)
    matrix_red(i,col)=mred(i,col);
    matrix_blue(i,col)=mblue(i,col);
    matrix_green(i,col)=mgreen(i,col);
end   

col=129+s;
for i=(129-s):(129+s)             %to store the second horizontal boundary(side4)
    matrix_red(i,col)=mred(i,col);
    matrix_blue(i,col)=mblue(i,col);
    matrix_green(i,col)=mgreen(i,col);
end  

x=1;
for i=1:257
    for j=1:257
    m_red(x)=matrix_red(i,j);
    m_green(x)=matrix_green(i,j);
    m_blue(x)=matrix_blue(i,j);
    x=x+1;
    end
end

index=1;
for final_index=1:3:198147          %convolve the bytes (interleave) into RGB format to create final output image
Output_Im(final_index,1)=m_red(1,index);
Output_Im(final_index+1,1)=m_green(1,index);
Output_Im(final_index+2,1)=m_blue(1,index);
index=index+1;
end


fid=fopen('output_square.raw','wb'); %create file ID
fwrite(fid,Output_Im,'uchar')
end
end