%pacman walls, turns and balls


clc;
clear all;

global count_arr ball_count kp t


pacman_original = read_raw('pacman.raw',441,441,3);
imtool(uint8(pacman_original),[]);

pacman_gray=read_raw_gray('pacman.raw',441,441,3);
imtool(pacman_gray,[]);

size_pacman_original=size(pacman_gray);

for i=1:size_pacman_original(1)
    for j=1:size_pacman_original(2)
        if pacman_gray(i,j)==255 && pacman_gray(i+1,j)==255
            pacman_balls(i,j)=pacman_gray(i,j);
            pacman_balls(i,j)=255;
        else
            pacman_balls(i,j)=0;
        end
       
       if pacman_gray(i,j)>88 && pacman_gray(i,j)<90 || pacman_gray(i,j)==141
           pacman_walls(i,j)=pacman_gray(i,j);
           pacman_walls(i,j)=255;
       else
           pacman_walls(i,j)=0;
       end
    end
end

imtool(pacman_balls,[]);

%removing unwanted dots

for i=2:size_pacman_original(1)-1
    for j=2:size_pacman_original(2)-1
        if pacman_walls(i,j)==255
           if ~pacman_walls(i-1,j-1) && ~pacman_walls(i,j-1) && ~pacman_walls(i+1,j-1)...
              && ~pacman_walls(i-1,j) && ~pacman_walls(i+1,j)...
              && ~pacman_walls(i-1,j+1) && ~pacman_walls(i,j+1) && ~pacman_walls(i+1,j+1)
                      pacman_walls(i,j)=0;
           end
        end
    end
end

imtool(pacman_walls,[]);



% %%%%%%%to count point balls - shrink the balls until the smaller point
% %%%%%%%balls shrink to a single pixel, excluding the bigger balls.
    pac_balls_binary=zeros(size(pacman_balls)+2);
    pac_balls_binary(2:size_pacman_original(1)+1,2:size_pacman_original(2)+1)=(pacman_balls(:,:))./255;
    F=pac_balls_binary;

    shrunken_image=shrink_balls(F);
   figure(5)  
       imshow(uint8(shrunken_image*255));
    title('point balls after shrinking');
    disp('number of point balls= ');
    disp(ball_count);


%%%%%%%%%to count walls - apply 8-connectivity connected_components

    pac_walls_binary=zeros(size(pacman_walls)+2);
    pac_walls_binary(2:size_pacman_original(1)+1,2:size_pacman_original(2)+1)=(pacman_walls(:,:))./255;
    F2=pac_walls_binary;

    Connected_Components_8_Connectivity(F2);



%%%%%%%%%%%%to skeletonise and count turns
%%%%%%%%%%%%perform skeletonising and then apply 8-connectivity corner mask

sk=pac_walls_binary;
Skeleton_Image =Skeletonizing(sk);



Size = size(Skeleton_Image);
turns_count = 0;

for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
        if(Skeleton_Image(i,j))
        
        Pixel_Neighbour = [Skeleton_Image(i-1,j-1) Skeleton_Image(i-1,j) Skeleton_Image(i-1,j+1)...
                           Skeleton_Image(i,j-1) Skeleton_Image(i,j) Skeleton_Image(i,j+1)...
                           Skeleton_Image(i+1,j-1) Skeleton_Image(i+1,j) Skeleton_Image(i+1,j+1)];
                       
                       [Cor1 Cor2 Cor3] = Corner_Masking(Pixel_Neighbour);
                       
                       
                       if(Cor3 )
                           turns_count = turns_count + 2;
                           
                           
                       else if(Cor1)
                              turns_count = turns_count + 1;
                            end
                       end
                       
                       if(Cor2)
                          turns_count = turns_count + 2;
                       end
        end                 
        
        
        
   
    
    end
end
imtool(Skeleton_Image,[])

disp('number of turns');
turns_count = turns_count - 8
