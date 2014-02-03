clc;
clear all;


texture_input=read_raw('comb.raw',450,600,1);
imtool(texture_input,[]);

%%%%%%%%%%%%%%%%% extend input texture input image boundary%%%%%%%%%%%%%%%
texture_input=extend_bound1(texture_input);




% % % %%%%%%%%%%%%%%%%%%%%%%%%   construction of Laws Filters  %%%%%%%%%%%%%%%%%
L5=(1/16).*[1  4 6 4 1];
E5=(1/6).*[-1 -2 0 2 1];
S5=(1/4).*[-1 0 2 0 -1];
W5=(1/6).*[-1 2 0 -2 1];
R5=(1/16).*[1 -4 6 -4 1];

L5L5= (L5')*(L5);
L5E5= (L5')*(E5);
L5S5= (L5')*(S5);
L5W5= (L5')*(W5);
L5R5= (L5')*(R5);

E5L5= (E5')*(L5);
E5E5= (E5')*(E5);
E5S5= (E5')*(S5);
E5W5= (E5')*(W5);
E5R5= (E5')*(R5);

S5L5= (S5')*(L5);
S5E5= (S5')*(E5);
S5S5= (S5')*(S5);
S5W5= (S5')*(W5);
S5R5= (S5')*(R5);

W5L5= (W5')*(L5);
W5E5= (W5')*(E5);
W5S5= (W5')*(S5);
W5W5= (W5')*(W5);
W5R5= (W5')*(R5);

R5L5= (R5')*(L5);
R5E5= (R5')*(E5);
R5S5= (R5')*(S5);
R5W5= (R5')*(W5);
R5R5= (R5')*(R5);

mask(:,:,1)=L5L5;
mask(:,:,2)=L5E5;
mask(:,:,3)=L5S5;
mask(:,:,4)=L5W5;
mask(:,:,5)=L5R5;

mask(:,:,6)=E5S5;
mask(:,:,7)=E5L5;
mask(:,:,8)=E5W5;
mask(:,:,9)=E5E5;
mask(:,:,10)=E5R5;

mask(:,:,11)=S5L5;
mask(:,:,12)=S5S5;
mask(:,:,13)=S5E5;
mask(:,:,14)=S5W5;
mask(:,:,15)=S5R5;

mask(:,:,16)=W5L5;
mask(:,:,17)=W5E5;
mask(:,:,18)=W5S5;
mask(:,:,19)=W5W5;
mask(:,:,20)=W5R5;

mask(:,:,21)=R5L5;
mask(:,:,22)=R5E5;
mask(:,:,23)=R5S5;
mask(:,:,24)=R5W5;
mask(:,:,25)=R5R5;

%%%%%%%%%%%%%%%%%%9-D feature vector for each layer%%%%%%%%%%%%%%%
%%%%%%%%%% for image "comb.raw" %%%%%%%%%%%%%%%
for i=1:25
    texfeat(:,:,i)=feature_image1(mask(:,:,i),texture_input);
    figure(1)
    subplot(5,5,i);
    imshow(uint8(texfeat(:,:,i)));
    
end

%%%%%%%%%%%%%%%%%%%Energy Computation and normalisation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:25
feat_im(:,:,i)=extend(texfeat(:,:,i),34);
end
disp('extended');
disp('energy computation next...');

for i=1:25
energy_computed(:,:,i)=en_compute(feat_im(:,:,i),34);
end
disp('computed energy');
disp('normalising...');
% 
% ener(:,:,1)=energy_computed(:,:,1);

%%%%normalising the energy computed vectors with L3'L3 masked image
for i=1:25
energy_computed(:,:,i)=energy_computed(:,:,i)./energy_computed(:,:,1);
end

size(energy_computed,1)
size(energy_computed,2)

%%%%% reducing each matrix of 450x600x25 to (450x600)x25
for k=1:25
    var=1;
    for i=1:450
        for j=1:600
            mat(var,k)=energy_computed(i,j,k);
            var=var+1;
            
        end
    end
end

[coeff,score]=princomp(mat); %PCA

cluster=kmeans(score,7,'replicates',25);      %Kmeans


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
             output_m(i,j)=20;
        elseif output_m(i,j)==3
            output_m(i,j)=60;
        elseif output_m(i,j)==4
            output_m(i,j)=110;
        elseif output_m(i,j)==5
            output_m(i,j)=165; 
        elseif output_m(i,j)==6
           output_m(i,j)=205;
        elseif output_m(i,j)==7
            output_m(i,j)=255;
            
        end
    end
end

imtool(output_m,[]);




