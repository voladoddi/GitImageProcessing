%%%%%%%%% Cascaded Inverse half toning





function Ima = three_c(Image)
global MAXVAR
%%%%%%% Adaptive Run Length Implementation


%%%%%%Along Row
Size_Image = size(Image);
G_R = zeros(size(Image));

for i = 1 : Size_Image(1)
    First_Pixel = Image(i,1);
    count = 1;
    for j = 2 : Size_Image(2)
        
                if(First_Pixel == Image(i,j))
                    count = count + 1;
                else
          
                    for k = j - count : 1 : j-1
                        if(First_Pixel == 255)
                            G_R(i,k) = 255* (count / (count + 1));
                   
                        else
                            G_R(i,k) = 255* (1 / (count + 1));
                        end
                
                    end
            
                First_Pixel = Image(i,j);
                count = 1; 
                end
                
                if( j == Size_Image(2) && count >= 2 )
    
                    for k = j - count + 1 : 1 : j
                            if(First_Pixel == 255)
                                G_R(i,k) = 255* (count / (count + 1));
                   
                            else
                                G_R(i,k) = 255* (1 / (count + 1));
                            end
                
                    end
                else if( j == Size_Image(2) && count == 1)
                        if(First_Pixel == 255)
                                G_R(i,j) = 255* (count / (count + 1));
                   
                            else
                                G_R(i,j) = 255* (1 / (count + 1));
                        end
                    end
                end
        
        
        
    end
end
%imtool(G_R,[])

%%%% Column Image 
Image_Col = Image';
G_C = zeros(size(Image));
Size_Image = size(Image_Col);
for i = 1 : Size_Image(1)
    First_Pixel = Image_Col(i,1);
    count = 1;
    for j = 2 : Size_Image(2)
        
                if(First_Pixel == Image_Col(i,j))
                    count = count + 1;
                else
          
                    for k = j - count : 1 : j-1
                        if(First_Pixel == 255)
                            G_C(i,k) = 255* (count / (count + 1));
                   
                        else
                            G_C(i,k) = 255* (1 / (count + 1));
                        end
                
                    end
            
                First_Pixel = Image_Col(i,j);
                count = 1; 
                end
                
                if( j == Size_Image(2) && count >= 2 )
    
                    for k = j - count + 1 : 1 : j
                            if(First_Pixel == 255)
                                G_C(i,k) = 255* (count / (count + 1));
                   
                            else
                                G_C(i,k) = 255* (1 / (count + 1));
                            end
                
                    end
                else if( j == Size_Image(2) && count == 1)
                        if(First_Pixel == 255)
                                G_C(i,j) = 255* (count / (count + 1));
                   
                            else
                                G_C(i,j) = 255* (1 / (count + 1));
                        end
                    end
                end
        
        
        
    end
end

%imtool(G_C',[])

Adaptive_Run_Length_Image =  ( G_R + G_C' ) ./ 2;


%imtool(Adaptive_Run_Length_Image,[])

%%%%%% Lee's Additive noise filtering of the Adaptive_Run_Length_Image; Its
%%%%%% based on finding the local mean and variance of the neighbourhood

K = 800; %%% Parameter for Lee's ( 5 x 5 ) Adaptive Noise(additive) Filter

Filtered_Image = Adaptive_Run_Length_Image;
Size_Image = size(Adaptive_Run_Length_Image);
for i = 3 : Size_Image(1) - 2
    for j = 3 : Size_Image(2) - 2
        
        
              Neighbour = Adaptive_Run_Length_Image(i - 2 : i + 2,j - 2: j + 2);
              m = mean_(Neighbour(:));
              sigma = var(Neighbour(:));
              
              
               Filtered_Image(i,j) = m + (sigma/(sigma + K))*(Filtered_Image(i,j) - m);
        
    end
end

%imtool(Filtered_Image, [])
%%%%%%%%%%% Impulse Removal from the Filtered_Image using local variance
 Beta = 30; %%% Impulse Removal Parameter
MAXVAR = var(Filtered_Image(:)); 

Impulse_Removed_Image = Filtered_Image;

for i = 3 : Size_Image(1) - 2
    for j = 3 : Size_Image(2) - 2
        
        
              Neighbour = Adaptive_Run_Length_Image(i - 2 : i + 2,j - 2: j + 2);
              m = mean(Neighbour(:));
              sigma = var(Neighbour(:));
              
               if((sigma <= MAXVAR) && (Impulse_Removed_Image(i,j) + Beta < m))
               Impulse_Removed_Image(i,j) = Impulse_Removed_Image(i,j) + Beta;
               end
               
               if((sigma <= MAXVAR) && (Impulse_Removed_Image(i,j) - Beta > m))
                   Impulse_Removed_Image(i,j) = Impulse_Removed_Image(i,j) - Beta;
               end
               
        
    end
end


%%%%%%%%%% Dynamic Range Mapping (The Final Step) %%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%% Making an assumption that a max of 40 consecutive pixels are
%%%%%%%%%%%%% either white or black 

Final_Image = Impulse_Removed_Image;

T_Min = 255 * (1/41);
T_Max = 255 *(10/11);

for i = 1 : Size_Image(1) 
    for j = 1 : Size_Image(2)
        
        
              if(T_Min > Impulse_Removed_Image(i,j))
                Final_Image(i,j) = 0;
              end

              if(T_Max < Impulse_Removed_Image(i,j))
                Final_Image(i,j) = 255;
              end

    end
end




Ima = Final_Image;
imtool((Final_Image), [])
end