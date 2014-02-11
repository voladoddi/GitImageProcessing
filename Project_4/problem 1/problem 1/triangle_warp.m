function tp = triangle_warp(image,matrix_A, matrix_U,matrix_V)



input_image= image;
output_image=zeros(400,400,3);


A = matrix_A;
U = matrix_U;
V = matrix_V;


y1= A(1,2);
y2= A(2,2);
y3= A(3,2);

y_a= [y1 y2 y3];

y_min=min(y_a);
y_max=max(y_a);


x1= A(1,3);
x2= A(2,3);
x3= A(3,3);

B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i= y_min:y_max
    
    
    if i<=y2

    %--------------------triangle 1-----------------------
        for j= 1: ceil(((i-1)/((1-147)/(1-39)))+1)
              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
           
              
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                 
                for m=1:3
                   output_image(i,j,m)=input_image(x1,y1,m);
                end
              end
        end
        
        
    else
            for j= 1: ceil(((i-147)/((147-400)/(39-1))+39))
              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
           
              
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                 
                for m=1:3
                   output_image(i,j,m)=input_image(x1,y1,m);
                end
              end
            end
    end


end

tp=output_image;
end
