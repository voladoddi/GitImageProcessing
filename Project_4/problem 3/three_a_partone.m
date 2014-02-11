%%%%% three_a part one

clc;
clear all;


seg1=read_raw('seg1.raw',321,481,3);
seg2=read_raw('seg2.raw',321,481,3);
seg3=read_raw('seg3.raw',321,481,3);

figure(1)
imshow(uint8(seg1));

figure(2)
imshow(uint8(seg2));
 
figure(3)
imshow(uint8(seg3));


%%%%%%%%%%%%%%%%%%%Additional feature==Luminance

seg1(:,:,4)= 0.299*seg1(:,:,1)+0.587*seg1(:,:,2)+0.114*seg1(:,:,3);
seg2(:,:,4)= 0.299*seg2(:,:,1)+0.587*seg2(:,:,2)+0.114*seg2(:,:,3);
seg3(:,:,4)= 0.299*seg3(:,:,1)+0.587*seg3(:,:,2)+0.114*seg3(:,:,3);


%%%%%%%%%%%%%%%%%%get 3-D feature vector for picture 1%%%%%%%%%%%%%%%
for i=1:3
    seg1_feature_vector(:,:,i)=seg1(:,:,i);
    seg2_feature_vector(:,:,i)=seg2(:,:,i);
    seg3_feature_vector(:,:,i)=seg3(:,:,i);
    
end


%%%%% reducing each matrix of 321x481x3 to (321x481)x3

%  (%%%After additional feature added, reduce each matrix of 321x481x4 to
   %%%(321x481)x4 )

for k=1:3
    var=1;
    for i=1:321
        for j=1:481
            
             mat1(var,k)=seg1_feature_vector(i,j,k);
             mat2(var,k)=seg2_feature_vector(i,j,k);
             mat3(var,k)=seg3_feature_vector(i,j,k);
             
            var=var+1;
            
        end
    end
end


 
 [cluster1 Centroids1]=kmeans(mat1,4);      %Kmeans
 [cluster2 Centroids2]=kmeans(mat2,6);
 [cluster3 Centroids3]=kmeans(mat3,11);

%  Centroids1=ceil(Centroids1)
%  Centroids2=ceil(Centroids2)
%  Centroids3=ceil(Centroids3)
 

var=1;

for i=1:321
    for j=1:481
         output_m1(i,j)=cluster1(var,1);
         output_m2(i,j)=cluster2(var,1);
         output_m3(i,j)=cluster3(var,1);
var=var+1;
    end
end



%%%%%%%%%%%%%%%%%%%%% assigning colour to clustered regions %%%%%%%%%%%%%%%%%%%
for k=1:3
for i=1:321
   for j=1:481
 
       %Image 1
        if output_m1(i,j)==1
            output_m1new(i,j,k)=Centroids1(1,k);

        elseif output_m1(i,j)==2
             output_m1new(i,j,k)=Centroids1(2,k);
        
        elseif output_m1(i,j)==3
            output_m1new(i,j,k)=Centroids1(3,k);
        
        elseif output_m1(i,j)==4
            output_m1new(i,j,k)=Centroids1(4,k);
                    
        end
        
        
        
       %Image 2 
         if output_m2(i,j)==1
             output_m2new(i,j,k)=Centroids2(1,k);

        elseif output_m2(i,j)==2
             output_m2new(i,j,k)=Centroids2(2,k);
        
        elseif output_m2(i,j)==3
             output_m2new(i,j,k)=Centroids2(3,k);
        
        elseif output_m2(i,j)==4
             output_m2new(i,j,k)=Centroids2(4,k);
                    
         elseif output_m2(i,j)==5
             output_m3new(i,j,k)=Centroids2(5,k);
        
        elseif output_m3(i,j)==6
            output_m3new(i,j,k)=Centroids2(6,k);
        
        
        end
        
       %Image 3 
         if output_m3(i,j)==1
            output_m3new(i,j,k)=Centroids3(1,k);

        elseif output_m3(i,j)==2
             output_m3new(i,j,k)=Centroids3(2,k);
        
        elseif output_m3(i,j)==3
            output_m3new(i,j,k)=Centroids3(3,k);
        
        elseif output_m3(i,j)==4
            output_m3new(i,j,k)=Centroids3(4,k);
            
        elseif output_m3(i,j)==5
             output_m3new(i,j,k)=Centroids3(5,k);
        
        elseif output_m3(i,j)==6
            output_m3new(i,j,k)=Centroids3(6,k);
        
        elseif output_m3(i,j)==7
            output_m3new(i,j,k)=Centroids3(7,k);
     
         elseif output_m3(i,j)==8
            output_m3new(i,j,k)=Centroids3(8,k);
            
        elseif output_m3(i,j)==9
             output_m3new(i,j,k)=Centroids3(9,k);
        
        elseif output_m3(i,j)==10
            output_m3new(i,j,k)=Centroids3(10,k);
        
        elseif output_m3(i,j)==11
            output_m3new(i,j,k)=Centroids3(11,k);
        
                    
        end
        
        
         
        
    end
end
end

figure(4)
imshow(uint8(output_m1new));

figure(5)
imshow(uint8(output_m2new));

figure(6)
imshow(uint8(output_m3new));

