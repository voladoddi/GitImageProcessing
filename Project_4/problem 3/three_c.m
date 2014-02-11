clc;
clear all;

inp_img=read_raw('seg1.raw',321,481,3);

figure(1)
imshow(uint8(inp_img));


Size_In_Image = size(inp_img);
Label_Image = zeros(Size_In_Image(1),Size_In_Image(2));

out_img=size(inp_img);




i=1; 
Label_List(1,:)= [1 inp_img(1,1,1) inp_img(1,1,2) inp_img(1,1,3)];
   
    Label_Image(1,1)=1;
    count=1;
    
for l=1:321
    for m=1:481
        
        for loop=1:i
         RGB_val(loop) = sqrt(power(inp_img(l,m,1) - Label_List(loop,2),2)...
                      +power(inp_img(l,m,2) - Label_List(loop,3),2)...
                      +power(inp_img(l,m,3) - Label_List(loop,4),2));
        end
        
        min_RGB=min(RGB_val);
        for loop=1:i
            if RGB_val(loop)==min_RGB
                min_index=loop;
            end
        end
        
                
        if RGB_val(min_index)<=170               
            Label_Image(l,m)= min_index;
                     
            Avg_R = (inp_img(l,m,1)+(Label_List(min_index,1)*Label_List(min_index,2)))/(Label_List(min_index,1)+1);
            Avg_G = (inp_img(l,m,2)+(Label_List(min_index,1)*Label_List(min_index,3)))/(Label_List(min_index,1)+1);
            Avg_B = (inp_img(l,m,3)+(Label_List(min_index,1)*Label_List(min_index,4)))/(Label_List(min_index,1)+1);
          
            Label_List(min_index,1)=Label_List(min_index,1)+1;
           
            Label_List(min_index,:)=[Label_List(min_index,1) Avg_R Avg_G Avg_B];
 
        else
             i=i+1;    
             Label_Image(l,m)=i;
             Label_List(i,:)=[1 inp_img(l,m,1) inp_img(l,m,2) inp_img(l,m,3)];
             
           
        end
    end
end

lb=1;
for l=1:321
    for m=1:481
     
        out_img(l,m,1)=Label_List(Label_Image(l,m),2);
        out_img(l,m,2)=Label_List(Label_Image(l,m),3);
        out_img(l,m,3)=Label_List(Label_Image(l,m),4);
        
        
    end
end

figure(2)
imshow(uint8(out_img));

