

%%%%%%%%%%%%%%%%%%%%%%%%%% Counting the Digits %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Threshold the Digit Image ( OutPut = Thresholded_Digit_Image)       %
%                                                                        %
% 2) After that remove some spurious dots in the threholed image using   % 
%    dot removing filter (OutPut = Dot_Filtered_Image)                   %
%                                                                        %
% 3) Thinning (OutPut = Digit_New_Image_Uncontd )                        %
%                                                                        %
% 4) Rectifying the thinned Image so as to connect the single pixels     %
%    missing in the thinned image (OutPut = Corrected_Digit_Image)       % 
%                                                                        %
% 5) Shrinking the Corrected Image (OutPut = Digit_Image_For_Shrinking)  %
%                                                                        %
% 6) Performing Connected Component Analysis to count the digits        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
% 
Digit_Image = Read_Raw_('digits.raw',959,1231);

Digits_Gray = .299 * Digit_Image(:,:,1) + .587 * Digit_Image(:,:,2) + .114 * Digit_Image(:,:,3);

Size = size(Digits_Gray)
% %imtool(Digits_Gray, [])
% 
% %hist(Digits_Gray)
T =  mean(Digits_Gray(:)) - 1.5*sqrt(var(Digits_Gray(:)))
Thresholded_Digit_Image = zeros(Size);
for i=1:Size(1)
    for j=1:Size(2)
    
    if Digits_Gray(i,j) < T
       Thresholded_Digit_Image(i,j) = 1; 
    end

    end
end

 


imtool(Thresholded_Digit_Image, [])
% 
% 
% %%%%%Removing isolated dots
% 
Dot_Filtered_Image = Thresholded_Digit_Image;

for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
    
    if (Thresholded_Digit_Image(i,j) == 1) 
         Pixel_Neighbour = [Thresholded_Digit_Image(i-1,j-1) Thresholded_Digit_Image(i-1,j) Thresholded_Digit_Image(i-1,j+1)...
                           Thresholded_Digit_Image(i,j-1) Thresholded_Digit_Image(i,j) Thresholded_Digit_Image(i,j+1)...
                           Thresholded_Digit_Image(i+1,j-1) Thresholded_Digit_Image(i+1,j) Thresholded_Digit_Image(i+1,j+1)];
                       C = ~Pixel_Neighbour(1) && ~Pixel_Neighbour(2) && ~Pixel_Neighbour(3) && ~Pixel_Neighbour(4) && ~Pixel_Neighbour(6) && ~Pixel_Neighbour(7) && ~Pixel_Neighbour(8) && ~Pixel_Neighbour(9);
                       if(C)
                        Dot_Filtered_Image(i,j) = 0;
                       end
    end

    end
end

%imtool(Dot_Filtered_Image, [])


%%%%%%Thinning Operation 


%%%%Conditional Marking 


Digits_New_Image = zeros(Size);
for k = 1 : 100
for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        Pixel_Neighbour = [Dot_Filtered_Image(i-1,j-1) Dot_Filtered_Image(i-1,j) Dot_Filtered_Image(i-1,j+1)...
                           Dot_Filtered_Image(i,j-1) Dot_Filtered_Image(i,j) Dot_Filtered_Image(i,j+1)...
                           Dot_Filtered_Image(i+1,j-1) Dot_Filtered_Image(i+1,j) Dot_Filtered_Image(i+1,j+1)];
        
           Digits_New_Image(i,j) = Cond_Mark_Thinning(Pixel_Neighbour);
       
    end
end

%imtool(Digits_New_Image,[])
Digit_New_Image_Uncontd = zeros(size(Digits_New_Image));


for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
       
                        if(Digits_New_Image(i,j) == 2)
                           %%%%%Removing
                           
                           Pixel_Neighbour = [Digits_New_Image(i-1,j-1) Digits_New_Image(i-1,j) Digits_New_Image(i-1,j+1)...
                                              Digits_New_Image(i,j-1) Digits_New_Image(i,j) Digits_New_Image(i,j+1)...
                                              Digits_New_Image(i+1,j-1) Digits_New_Image(i+1,j) Digits_New_Image(i+1,j+1)];
                            C1 = spur(Pixel_Neighbour);
                            C2 = Single_4_Connection(Pixel_Neighbour);
                            C3 = L_Cluster(Pixel_Neighbour);
                            C4 = Connected_4_Set(Pixel_Neighbour);
                            C5 = Spur_Corner_Cluster(Pixel_Neighbour);
                            C6 = Cornet_Cluster(Pixel_Neighbour);
                            C7 = Tee_Brach(Pixel_Neighbour);
                            C8 = Vee_Branch(Pixel_Neighbour);
                            C9 = Diagonal_Branch(Pixel_Neighbour);
                            Digit_New_Image_Uncontd(i,j) = C1 || C2 || C3 || C4 || C5 || C6 || C7 || C8 || C9;
                      
                            
                           
                       else
                           Digit_New_Image_Uncontd(i,j) =  Digits_New_Image(i,j);
                       end
        
                       
    end
end

P = abs(Digit_New_Image_Uncontd - Dot_Filtered_Image);

if(~max(P(:)))
    break;
end
Dot_Filtered_Image = Digit_New_Image_Uncontd;


end
Thinned_Image = Digit_New_Image_Uncontd;
imtool(Thinned_Image , [])









Dot_Filtered_Image =Digit_New_Image_Uncontd;
 Corrected_Digit_Image = Dot_Filtered_Image;
%%%%%Connecting the dots in the Filtered Image
for k = 1 : 1
for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        if(~Dot_Filtered_Image(i,j))
                          P = [Dot_Filtered_Image(i-1,j-1) Dot_Filtered_Image(i-1,j) Dot_Filtered_Image(i-1,j+1)...
                               Dot_Filtered_Image(i,j-1) Dot_Filtered_Image(i,j) Dot_Filtered_Image(i,j+1)...
                               Dot_Filtered_Image(i+1,j-1) Dot_Filtered_Image(i+1,j) Dot_Filtered_Image(i+1,j+1)];
            c1 =  P(1) && ~P(2) && ~P(3) && ~P(4) && ~P(6) && ~P(7) &&  P(8) && ~P(9);               
            c2 = ~P(1) && ~P(2) &&  P(3) && ~P(4) && ~P(6) && ~P(7) &&  P(8) && ~P(9);               
            c3 = ~P(1) &&  P(2) && ~P(3) && ~P(4) && ~P(6) &&  P(7) && ~P(8) && ~P(9);               
            c4 = ~P(1) &&  P(2) && ~P(3) && ~P(4) && ~P(6) && ~P(7) && ~P(8) &&  P(9);               
            c5 = ~P(1) &&  P(2) && ~P(3) && ~P(4) && ~P(6) && ~P(7) &&  P(8) && ~P(9);               
            c6 = ~P(1) && ~P(2) && ~P(3) &&  P(4) &&  P(6) && ~P(7) && ~P(8) && ~P(9);
            c7 = ~P(1) && ~P(2) && ~P(3) &&  P(4) && ~P(6) && ~P(7) && ~P(8) &&  P(9);
            c8 = ~P(1) && ~P(2) && ~P(3) && ~P(4) &&  P(6) &&  P(7) && ~P(8) && ~P(9);
           
            c9 = ~P(1) &&  P(2) && ~P(3) && ~P(4) && ~P(6) && ~P(7) &&  P(8) &&  P(9);
            c10= ~P(1) &&  P(2) && ~P(3) && ~P(4) && ~P(6) &&  P(7) &&  P(8) && ~P(9);
            c11= ~P(1) &&  P(2) &&  P(3) && ~P(4) && ~P(6) && ~P(7) &&  P(8) && ~P(9);
            c12=  P(1) &&  P(2) && ~P(3) && ~P(4) && ~P(6) && ~P(7) &&  P(8) && ~P(9);
            
            c13= ~P(1) && ~P(2) &&  P(3) &&  P(4) &&  P(6) && ~P(7) && ~P(8) && ~P(9);
            c14= ~P(1) && ~P(2) && ~P(3) &&  P(4) &&  P(6) && ~P(7) && ~P(8) &&  P(9);
            c15=  P(1) && ~P(2) && ~P(3) &&  P(4) &&  P(6) && ~P(7) && ~P(8) && ~P(9);
            c16= ~P(1) && ~P(2) && ~P(3) &&  P(4) &&  P(6) &&  P(7) && ~P(8) && ~P(9);

             




            if(c1 || c2 || c3 || c4 || c5 || c6 || c7 || c8 || c9 || c10 || c11 || c12 || c13 || c14 || c15 || c16 )
           Corrected_Digit_Image(i,j) = 1;
            end
        end
       
    end
end
Dot_Filtered_Image = Corrected_Digit_Image;

end
imtool(Corrected_Digit_Image , []) %%%This corrected digit image is the image in which unconnected objects are connected to some extent 


% 
% % 
Digit_New_Image_Uncontd = Corrected_Digit_Image;


% 
% %%%%%%%%%%Conditional Marking for shrinking first time
Digit_Image_For_Shrinking = Digit_New_Image_Uncontd;

Digit_New_Image = zeros(Size);
 
 for k = 1 : 100
for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        Pixel_Neighbour = [Digit_Image_For_Shrinking(i-1,j-1) Digit_Image_For_Shrinking(i-1,j) Digit_Image_For_Shrinking(i-1,j+1)...
                           Digit_Image_For_Shrinking(i,j-1) Digit_Image_For_Shrinking(i,j) Digit_Image_For_Shrinking(i,j+1)...
                           Digit_Image_For_Shrinking(i+1,j-1) Digit_Image_For_Shrinking(i+1,j) Digit_Image_For_Shrinking(i+1,j+1)];
        
           Digit_New_Image(i,j) = Check_Pixels(Pixel_Neighbour);
       
    end
end

%imtool(Edge_Stars , [])
Digit_New_Image_Uncontd = zeros(size(Digit_New_Image));
%%%%%%%%%%Unconditional Removing
for i = 2 : Size(1) - 1
    for j = 2 : Size(2) - 1
        
     
        
                       if(Digit_New_Image(i,j) == 2)
                           %%%%%Removing
                           
                           Pixel_Neighbour = [Digit_New_Image(i-1,j-1) Digit_New_Image(i-1,j) Digit_New_Image(i-1,j+1)...
                           Digit_New_Image(i,j-1) Digit_New_Image(i,j) Digit_New_Image(i,j+1)...
                           Digit_New_Image(i+1,j-1) Digit_New_Image(i+1,j) Digit_New_Image(i+1,j+1)];
                            C1 = spur(Pixel_Neighbour);
                            C2 = Single_4_Connection(Pixel_Neighbour);
                            C3 = Connected_4_Set(Pixel_Neighbour);
                            C4 = Spur_Corner_Cluster(Pixel_Neighbour);
                            C5 = Cornet_Cluster(Pixel_Neighbour);
                            C6 = Tee_Brach(Pixel_Neighbour);
                            C7 = Vee_Branch(Pixel_Neighbour);
                            C8 = Diagonal_Branch(Pixel_Neighbour);
                            Digit_New_Image_Uncontd(i,j) = C1 || C2 || C3 || C4 || C5 || C6 || C7 || C8;
                      
                            
                           
                       else
                           Digit_New_Image_Uncontd(i,j) =  Digit_New_Image(i,j);
                       end
        
                       
    end
end
k
P = abs(Digit_New_Image_Uncontd - Digit_Image_For_Shrinking);
if(~max(P(:)))
    break;
end
Digit_Image_For_Shrinking = Digit_New_Image_Uncontd;


end
 Digit_Image_After_Shrinking = Digit_Image_For_Shrinking;
imtool(Digit_Image_After_Shrinking,[]);


%%%%%Counting the digits
[Image , L ,List , Count_List]= Connected_Components_8_Connectivity(Digit_Image_For_Shrinking);





%%%%%%Removing Duplicate points from the List 

%%%%Sorting the List based on 1st co-ordinate and then if there is a tie it
%%%%will be resolved by using 2nd co-ordinate



Temp_Diff = abs(List(1 : Count_List -1, 1) - List(1 : Count_List -1, 2));
Temp_Sum = List(1 : Count_List -1, 1) - List(1 : Count_List -1, 2);

D = Duplicate(Temp_Sum, Temp_Diff, Count_List);  






 Number_Of_Digits = L + D