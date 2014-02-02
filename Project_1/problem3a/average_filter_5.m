function MF = average_filter_5(colour_channel)
global check fil_output_2d

output_2d=colour_channel;
%convert into 2-D form (256x256) form

 
[R,C]=size(output_2d);

%Pad the 256x256 matrix with duplicate rows and columns--258x258 matrix
Mod_o2d=zeros(size(output_2d)+4);


for i=3:R+2             %paste original matrix onto the mod_o2d
    for j=3:C+2
        Mod_o2d(i,j)=output_2d(i-2,j-2);
    end
end

for i=3:R+2             %column1 of given input to column of modified input
    for j=1
        Mod_o2d(i,j)=output_2d(i-2,j);
    end
    for j=2
        Mod_o2d(i,j)=output_2d(i-2,j);
    end
    
end
   
for i=3:R+2             %column256 of given input to column of modified input
    for j=C+3
        Mod_o2d(i,j)=output_2d(i-2,j-4);
    end
    for j=C+4
        Mod_o2d(i,j)=output_2d(i-2,j-4);
    end
end

for i=1             %row1 of given input to row1 of modified input
    for j=3:C+2
        Mod_o2d(i,j)=output_2d(i+2,j-2);
    end
end
   
for i=2             %row1 of given input to row2 of modified input
    for j=3:C+2
        Mod_o2d(i,j)=output_2d(i+2,j-2);
    end
end


for i=R+3             %row256 of given input to column of modified input
    for j=3:C+2
        Mod_o2d(i,j)=output_2d(i-4,j-2);
    end
end
for i=R+4             %row256 of given input to column of modified input
    for j=3:C+2
        Mod_o2d(i,j)=output_2d(i-4,j-2);
    end
end

Mod_o2d(1,1)=output_2d(1,1);
Mod_o2d(1,2)=output_2d(1,1);
Mod_o2d(2,1)=output_2d(1,1);
Mod_o2d(2,2)=output_2d(1,1);


Mod_o2d(R+3,1)=output_2d(R,1);
Mod_o2d(R+4,1)=output_2d(R,1);
Mod_o2d(R+3,2)=output_2d(R,1);
Mod_o2d(R+4,2)=output_2d(R,1);

Mod_o2d(1,C+3)=output_2d(1,C);
Mod_o2d(1,C+4)=output_2d(1,C);
Mod_o2d(2,C+3)=output_2d(1,C);
Mod_o2d(2,C+4)=output_2d(1,C);

Mod_o2d(C+3,C+3)=output_2d(C,C);
Mod_o2d(C+3,C+4)=output_2d(C,C);
Mod_o2d(C+4,C+3)=output_2d(C,C);
Mod_o2d(C+4,C+4)=output_2d(C,C);

check= Mod_o2d;

fil_output_2d=zeros(size(output_2d));

%------------------------FILTERING ACTION--------------------------

filter_window=ones(5);%setting the weights of the window.
                                  

sum=0;
x=0;
y=0;


for i=1:256
    for j=1:256
       
            for l=1:3
            for m=1:3
              sum= sum + Mod_o2d(i+x,j+y)*filter_window(l,m); %calculation of sum for averaging
            
             y=y+1;
            end
            
            y=0;
           x=x+1;
            
            end
            x=0;
            
fil_output_2d(i,j)=sum/25; %replacing the pixels with the average of the neighbourhood pixels in window 
sum=0;
    end
end
MF=fil_output_2d;
end 