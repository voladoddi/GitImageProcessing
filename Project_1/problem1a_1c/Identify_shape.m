
function Shape=Identify_shape(filename)

global red2d matrix matrix_red green2d blue2d matrix_green matrix_blue radius;
global non_white_ycoordinate non_white_xcoordinate object_count non_white_x length rad distance_nonwhite;

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



%identify pixels that are non white from blue channel , get DISTANCE from
%centre (radius) and LOCATION of those pixels.


col=129; %column
i=1;

count_squares=0;
count_circles=0;

for row=129:257
   
             if matrix_blue(row,col)<255
                 distance_nonw=row-129;
                 if matrix_blue(row,col+distance_nonw)<255
                    disp('square. Side Length= ')
                    count_squares=count_squares+1;
                    distance_nw_sq=row-129;
                    disp(distance_nw_sq);
                    
                 end 
                    
                 if ((matrix_blue(row-1,col)>200 && matrix_blue(row,col)<255) && matrix_blue(row,col+distance_nonw)==255)
                    disp('circle. radius= ')
                    count_circles=count_circles+1;
                    distance_nw_cir=row-129;
                    disp(distance_nw_cir);
                 end
             end

end
disp('no.of circles= ');
disp(count_circles);


disp('no.of squares= ');
disp(count_squares);

disp('total objects= ');
disp(count_circles+count_squares);

end

             