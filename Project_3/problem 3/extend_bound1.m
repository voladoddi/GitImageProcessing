function extend = extend_bound1(image)


output_2d=image;
%convert into 2-D form (450x600) form

 
[R,C]=size(output_2d)

%Pad the 450x600 matrix with duplicate rows and columns--258x258 matrix
Mod_o2d=zeros(size(output_2d)+2);


for i=2:R+1             %paste original matrix onto the mod_o2d
    for j=2:C+1
        Mod_o2d(i,j)=output_2d(i-1,j-1);
    end
end

for i=2:R+1             %column1 of given input to column of modified input
    for j=1
        Mod_o2d(i,j)=output_2d(i-1,j);
    end
end
   
for i=2:R+1             %column255 of given input to column of modified input
    for j=C+2
        Mod_o2d(i,j)=output_2d(i-1,j-2);
    end
end

for i=1             %row1 of given input to column of modified input
    for j=2:C+1
        Mod_o2d(i,j)=output_2d(i+1,j-1);
    end
end
        
for i=R+2             %row255 of given input to column of modified input
    for j=2:C+1
        Mod_o2d(i,j)=output_2d(i-2,j-1);
    end
end

Mod_o2d(1,1)=output_2d(1,1);
Mod_o2d(R+2,1)=output_2d(R,1);
Mod_o2d(1,C+2)=output_2d(1,C);
Mod_o2d(R+2,C+2)=output_2d(R,C);

extend=Mod_o2d;
end
