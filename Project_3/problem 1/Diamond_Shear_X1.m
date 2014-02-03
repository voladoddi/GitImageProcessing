clc;
clear all;


puppy_raw=Read_Raw_('puppy.raw',500,500);

puppy_red=puppy_raw(:,:,1);
puppy_green=puppy_raw(:,:,2);
puppy_blue=puppy_raw(:,:,3);

N1  = max(puppy_red(:));
N2  = max(puppy_green(:));
N3  = max(puppy_blue(:));
 Normalized(:,:,1) = puppy_red ./ N1;
 Normalized(:,:,2) = puppy_green ./ N2;
 Normalized(:,:,3) = puppy_blue ./ N3;
 

imtool(Normalized,[])
 title('Original Puppy')

puppy_new_red=zeros(size(puppy_red));
puppy_new_green=zeros(size(puppy_green));
puppy_new_blue=zeros(size(puppy_blue));


size_puppy=size(puppy_raw);
fid = fopen('Points.txt','w');
%%%%%first triangle
for m=1 : 250
    for n=250 : -1 : 251 - m
     

        if(m == 250 || n == 250)
     puppy_new_red(m,n)=puppy_red(m,n);
     puppy_new_green(m,n)=puppy_green(m,n);
     puppy_new_blue(m,n)=puppy_blue(m,n);
        else
            
            
            x_temp = 251 - n;
            S =250*(m-x_temp)/(250 - x_temp )  ;
            
           
%             fprintf(fid,'(%f,%f)\t(%f,%f)\n',m,n,x_temp,n);
            x1 = floor(S);
            y1 = n;
     if(x1 >= 1 && x1 <= 250 && y1 >= 1 && y1 <= 250)       
     puppy_new_red(m,n)=puppy_red(x1,y1);
     puppy_new_green(m,n)=puppy_green(x1,y1);
     puppy_new_blue(m,n)=puppy_blue(x1,y1);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end

%%%%%%%%%%%%%%%%%2nd%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for m = 250 : 500
    for n =  ceil((249*m/250) - 249*2 + 250) : 250 
     
        if(m == 250 || n == 250)
     puppy_new_red(m,n)=puppy_red(m,n);
     puppy_new_green(m,n)=puppy_green(m,n);
     puppy_new_blue(m,n)=puppy_blue(m,n);
        else
            
            
            x_temp = floor(((n - 250)*250/249) + 500) ;
            S = 500 - 250*(x_temp - m )/( x_temp - 250 )  ;

            
           
           
            x1 = floor(S);
            y1 = n;
%             fprintf(fid,'(%f,%f)\t(%f,%f)\n',m,n,S,n);
     if(x1 >= 250 && x1 < 500 && y1 >= 1 && y1 <= 250)       
     puppy_new_red(m,n)=puppy_red(x1,y1);
     puppy_new_green(m,n)=puppy_green(x1,y1);
     puppy_new_blue(m,n)=puppy_blue(x1,y1);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end


%%%%%%%%%%%%%%%%%3rd%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for m=1 : 250
    for n=250 : ceil((250/249)*(m - 250)+500)
    
        if(m == 250 || n == 250)
     puppy_new_red(m,n)=puppy_red(m,n);
     puppy_new_green(m,n)=puppy_green(m,n);
     puppy_new_blue(m,n)=puppy_blue(m,n);
        else
            
            
            x_temp = floor(((n - 500)*249/250)+ 250) ;
            S =250*(m-x_temp)/(250 - x_temp )  ;
            
            
%             fprintf(fid,'(%f,%f)\t(%f,%f)\n',m,n,x_temp,n);
            x1 = floor(S);
            y1 = n;
     if(x1 >= 1 && x1 <= 250 && y1 >= 250 && y1 < 500)       
     puppy_new_red(m,n)=puppy_red(x1,y1);
     puppy_new_green(m,n)=puppy_green(x1,y1);
     puppy_new_blue(m,n)=puppy_blue(x1,y1);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end



%%%%%%%%%%%%%%%%% 4th Triangle %%%%%%%%%%%%%%%%%%%%%%%



epsilon = 1e-7;
for m = 250 : 500
    for n =  250  : 750 - m
     

        if(m == 250 || n == 250)
     puppy_new_red(m,n)=puppy_red(m,n);
     puppy_new_green(m,n)=puppy_green(m,n);
     puppy_new_blue(m,n)=puppy_blue(m,n);
        else
            
            
            x_temp = 750 - n ;
            S = 500 - 250*(x_temp - m )/( x_temp - 250 )  ;

            
           
           
            x1 = floor(S);
            y1 = n;
            fprintf(fid,'(%f,%f)\t(%f,%f)\n',m,n,S,n);
     if(x1 >= 250 && x1 < 500 && y1 >= 250 && y1 < 500)       
     puppy_new_red(m,n)=puppy_red(x1,y1);
     puppy_new_green(m,n)=puppy_green(x1,y1);
     puppy_new_blue(m,n)=puppy_blue(x1,y1);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end

fclose(fid);
puppy_new(:,:,1)=puppy_new_red;
puppy_new(:,:,2)=puppy_new_green;
puppy_new(:,:,3)=puppy_new_blue;

figure(2)
imshow(uint8(puppy_new));
title('Diamond Warped Puppy')

Inverse_Puppy = Reversing_Puppy(puppy_new);



figure(3)
imshow(uint8(Inverse_Puppy));
title('Recovered Image');
