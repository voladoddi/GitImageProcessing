clc;
clear all;


texture_input=read_raw('comb.raw',450,600,1);
imtool(texture_input,[]);

%%%%%%%%%%%%%%%%% extend input texture input image boundary%%%%%%%%%%%%%%%
texture_input=extend_bound1(texture_input);
imtool(texture_input,[]);



% % % %%%%%%%%%%%%%%%%%%%%%%%%   construction of Laws Filters  %%%%%%%%%%%%%%%%%
L3=(1/6).*[1  2  1];
E3=(1/2).*[-1 0  1];
S3=(1/2).*[-1 2 -1];

L3L3= (L3')*(L3);
L3E3= (L3')*(E3);
L3S3= (L3')*(S3);

E3L3= (E3')*(L3);
E3E3= (E3')*(L3);
E3S3= (E3')*(S3);

S3L3= (S3')*(L3);
S3E3= (S3')*(E3);
S3S3= (S3')*(S3);

mask(:,:,1)=L3L3;
mask(:,:,2)=L3E3;
mask(:,:,3)=L3S3;
mask(:,:,4)=E3L3;
mask(:,:,5)=E3E3;
mask(:,:,6)=E3S3;
mask(:,:,7)=S3L3;
mask(:,:,8)=S3E3;
mask(:,:,9)=S3S3;

%%%%%%%%%%%%%%%%%%9-D feature vector for each layer%%%%%%%%%%%%%%%
%%%%%%%%%% for image "comb.raw" %%%%%%%%%%%%%%%
for i=1:9
    texfeat(:,:,i)=feature_image1(mask(:,:,i),texture_input);
    figure(1)
    subplot(5,5,i);
    imshow(uint8(texfeat(:,:,i)));
    
end

%%%%%%%%%%%%%%%%%%%Energy Computation and normalisation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:9
feat_im(:,:,i)=extend(texfeat(:,:,i),26);
end
disp('extended');
disp('energy computation next...');

for i=1:9
energy_computed(:,:,i)=en_compute(feat_im(:,:,i),26);
end
disp('computed energy');
disp('normalising...');
% 
% ener(:,:,1)=energy_computed(:,:,1);

%%%%normalising the energy computed vectors with L3'L3 masked image

energy_computed(:,:,1)=energy_computed(:,:,1)./energy_computed(:,:,1);
energy_computed(:,:,2)=energy_computed(:,:,2)./energy_computed(:,:,1);
energy_computed(:,:,3)=energy_computed(:,:,3)./energy_computed(:,:,1);
energy_computed(:,:,4)=energy_computed(:,:,4)./energy_computed(:,:,1);
energy_computed(:,:,5)=energy_computed(:,:,5)./energy_computed(:,:,1);
energy_computed(:,:,6)=energy_computed(:,:,6)./energy_computed(:,:,1);
energy_computed(:,:,7)=energy_computed(:,:,7)./energy_computed(:,:,1);
energy_computed(:,:,8)=energy_computed(:,:,8)./energy_computed(:,:,1);
energy_computed(:,:,9)=energy_computed(:,:,9)./energy_computed(:,:,1);

size(energy_computed,1)
size(energy_computed,2)


var=1;
for i=1:size(energy_computed,1)
    for j=1:size(energy_computed,2)
        
        k_means_matrix(var,:)=energy_computed(i,j,:);
        var=var+1;
    end
end

disp('finished normalising');
disp('clustering');

cluster=kmeans(k_means_matrix,7,'replicates',20);

var=1;
for i=1:450
    for j=1:600
        output_m(i,j)=cluster(var,1);
        var=var+1;
    end
end

for i=1:450
    for j=1:600

        if output_m(i,j)==1
            output_m(i,j)=0;
        elseif output_m(i,j)==2
             output_m(i,j)=51;
        elseif output_m(i,j)==3
            output_m(i,j)=102;
        elseif output_m(i,j)==4
            output_m(i,j)=153;
        elseif output_m(i,j)==5
            output_m(i,j)=204; 
        elseif output_m(i,j)==6
           output_m(i,j)=255;
        elseif output_m(i,j)==7
            output_m(i,j)=230;
            
        end
    end
end


imtool(output_m,[]);


