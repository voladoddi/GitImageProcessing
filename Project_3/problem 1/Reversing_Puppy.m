%%%%%%% Reversing the Diamond Puppy %%%%%%%%%%%%%%%

function Image = Reversing_Puppy(Image_In)
puppy_raw=Image_In;

puppy_red=Image_In(:,:,1);
puppy_green=Image_In(:,:,2);
puppy_blue=Image_In(:,:,3);

N1  = max(puppy_red(:));
N2  = max(puppy_green(:));
N3  = max(puppy_blue(:));
 Normalized(:,:,1) = puppy_red ./ N1;
 Normalized(:,:,2) = puppy_green ./ N2;
 Normalized(:,:,3) = puppy_blue ./ N3;
 
%  figure(1)
 %imshow(Normalized)

puppy_new_red=zeros(size(puppy_red));
puppy_new_green=zeros(size(puppy_green));
puppy_new_blue=zeros(size(puppy_blue));


size_puppy=size(puppy_raw);
fid = fopen('Points.txt','w');
%%%%%first triangle
for i_new=1 : 250
    for j_new=250 : -1 : 251 - i_new
     

        if(i_new == 250 || j_new == 250)
     puppy_new_red(i_new,j_new)=puppy_red(i_new,j_new);
     puppy_new_green(i_new,j_new)=puppy_green(i_new,j_new);
     puppy_new_blue(i_new,j_new)=puppy_blue(i_new,j_new);
        elseif(j_new == 1)
            
     puppy_new_red(i_new,j_new)  =puppy_red(250,j_new);
     puppy_new_green(i_new,j_new)=puppy_green(250,j_new);
     puppy_new_blue(i_new,j_new) =puppy_blue(250,j_new);
            
        else
            
            
             x_temp = 251 - j_new;
            S =250*(i_new-x_temp)/(250 - x_temp )  ;
           
            fprintf(fid,'(%f,%f)\t(%f,%f)\n',i_new,j_new,S,j_new);
            x1 = floor(S);
            y1 = j_new;
     if(x1 >= 1 && x1 <= 250 && y1 >= 1 && y1 <= 250)       
     puppy_new_red(x1,y1)= puppy_red(i_new,j_new);
     puppy_new_green(x1,y1)=puppy_green(i_new,j_new);
     puppy_new_blue(x1,y1)=puppy_blue(i_new,j_new);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end

%%%%%%%%%%%%%%%%%2nd%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i_new = 250 : 500
    for j_new =  ceil((249*i_new/250) - 249*2 + 250) : 250 
     
%         if(floor((j_new - 250)-((249/250)*(i_new- 500))) < epsilon)
%            x = 500 ;
%            y = j_new;
% %            fprintf(fid,'(%f,%f)\t(%f,%f)\n',i_new,j_new,x,j_new);
%      puppy_new_red(i_new,j_new)  =puppy_red(x,j_new);
%      puppy_new_green(i_new,j_new)=puppy_green(x,j_new);
%      puppy_new_blue(i_new,j_new) =puppy_blue(x,j_new);
        if(i_new == 250 || j_new == 250)
     puppy_new_red(i_new,j_new)=puppy_red(i_new,j_new);
     puppy_new_green(i_new,j_new)=puppy_green(i_new,j_new);
     puppy_new_blue(i_new,j_new)=puppy_blue(i_new,j_new);
        else
            
            
            x_temp = floor(((j_new - 250)*250/249) + 500) ;
            S = 500 - 250*(x_temp - i_new )/( x_temp - 250 )  ;

            
           
           
            x1 = floor(S);
            y1 = j_new;
%             fprintf(fid,'(%f,%f)\t(%f,%f)\n',i_new,j_new,S,j_new);
     if(x1 >= 250 && x1 < 500 && y1 >= 1 && y1 <= 250)       
     puppy_new_red(x1,y1)= puppy_red(i_new,j_new);
     puppy_new_green(x1,y1)=puppy_green(i_new,j_new);
     puppy_new_blue(x1,y1)=puppy_blue(i_new,j_new);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end


%%%%%%%%%%%%%%%%%3rd%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i_new=1 : 250
    for j_new=250 : ceil((250/249)*(i_new - 250)+500)
    
        if(i_new == 250 || j_new == 250)
     puppy_new_red(i_new,j_new)=puppy_red(i_new,j_new);
     puppy_new_green(i_new,j_new)=puppy_green(i_new,j_new);
     puppy_new_blue(i_new,j_new)=puppy_blue(i_new,j_new);
        else
            
            
            x_temp = floor(((j_new - 500)*249/250)+ 250) ;
            S =250*(i_new-x_temp)/(250 - x_temp )  ;
            
            
%             fprintf(fid,'(%f,%f)\t(%f,%f)\n',i_new,j_new,x_temp,j_new);
            x1 = floor(S);
            y1 = j_new;
     if(x1 >= 1 && x1 <= 250 && y1 >= 250 && y1 < 500)       
     puppy_new_red(x1,y1)= puppy_red(i_new,j_new);
     puppy_new_green(x1,y1)=puppy_green(i_new,j_new);
     puppy_new_blue(x1,y1)=puppy_blue(i_new,j_new);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end



%%%%%%%%%%%%%%%%% 4th Triangle %%%%%%%%%%%%%%%%%%%%%%%



epsilon = 1e-7;
for i_new = 250 : 500
    for j_new =  250  : 750 - i_new
     

        if(i_new == 250 || j_new == 250)
     puppy_new_red(i_new,j_new)=puppy_red(i_new,j_new);
     puppy_new_green(i_new,j_new)=puppy_green(i_new,j_new);
     puppy_new_blue(i_new,j_new)=puppy_blue(i_new,j_new);
        else
            
            
            x_temp = 750 - j_new ;
            S = 500 - 250*(x_temp - i_new )/( x_temp - 250 )  ;

            
           
           
            x1 = floor(S);
            y1 = j_new;
            fprintf(fid,'(%f,%f)\t(%f,%f)\n',i_new,j_new,S,j_new);
     if(x1 >= 250 && x1 < 500 && y1 >= 250 && y1 <= 500)       
     puppy_new_red(x1,y1)= puppy_red(i_new,j_new);
     puppy_new_green(x1,y1)=puppy_green(i_new,j_new);
     puppy_new_blue(x1,y1)=puppy_blue(i_new,j_new);
     end
            
            
        
     %%%%%%%%%%%%%%%%%% mixing RGB
    
        end
    end
end

fclose(fid);
puppy_new(:,:,1)=puppy_new_red;
puppy_new(:,:,2)=puppy_new_green;
puppy_new(:,:,3)=puppy_new_blue;



Image = puppy_new;
end
