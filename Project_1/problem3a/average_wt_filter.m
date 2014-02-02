function AF = average_wt_filter(colour_channel)
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
filter_window=[1 2 1;2 4 2;1 2 1]; %setting the weights of the window.5th element gets the maximum weight
                                   %neighbourhood pixels get less weight on
                                   %moving away from pixel of interest.
sum=0;
x=0;
y=0;


for i=1:256
    for j=1:256
       
            for l=1:3
            for m=1:3
              sum= sum + Mod_o2d(i+x,j+y)*filter_window(l,m);
            
             y=y+1;
            end
            
            y=0;
           x=x+1;
            
            end
            x=0;
            
fil_output_2d(i,j)=sum/16;
sum=0;
    end
end

AF=fil_output_2d;


end 