function MF = median_filter(colour_channel)
global check fil_output_2d

output_2d=colour_channel;
%convert into 2-D form (256x256) form

 
[R,C]=size(output_2d);

%Pad the 256x256 matrix with duplicate rows and columns--258x258 matrix
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
Mod_o2d(C+2,C+2)=output_2d(C,C);

check= Mod_o2d;

fil_output_2d=zeros(size(output_2d));

%------------------------FILTERING ACTION--------------------------

for i=1:256
    for j=1:256
        
        
        filter_window=zeros(9,1);
        var=1;
            for l=1:3
            for m=1:3
                filter_window(var)=Mod_o2d(i+l-1,j+m-1); %moving the window across the modified 2-d matrix of the image
                var=var+1;
            end
        end
        
        for r=1:size(filter_window)-1       %bubble sort to find out the median of the image window.
            for s=1:size(filter_window)-1
            if filter_window(s)>filter_window(s+1)
                temp=filter_window(s);
                filter_window(s)=filter_window(s+1);
                filter_window(s+1)=temp;
            end
        end
        
        median=filter_window(5); %extracting the median 
        fil_output_2d(i,j)=median;
    end
end

MF=fil_output_2d;


end 