function tp = triangle_warp1(image,matrix_A, matrix_U,matrix_V,output_img)



input_image= image;
output_image=output_img;


A = matrix_A;
U = matrix_U;
V = matrix_V;


y1= A(1,2);
y2= A(2,2);
y3= A(3,2);
y4=y2;

y_a= [y1 y2 y3];

y_min=min(y_a);
y_max=max(y_a);


x1= A(1,3);
x2= A(2,3);
x3= A(3,3);

B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 Slope1=(y1-y2)/(x1-x2);
 Slope2=(y1-y3)/(x1-x3);
 Slope3=(y2-y3)/(x2-x3);
 
x4= x1-((y1-y2)/Slope2); 
 
    
for i= y_min:y_max
 
    %----slope conditions----------
 if Slope1==Inf || Slope1==-Inf
     if x1==x2 || x1==x3 || x2==x1 || x3==x1
     Line1=x1;
     elseif x2==x3 || x3==x2
     Line1=x2;
     end
 else
     Line1= ceil(((i-y1)/Slope1)+x1);
 end
 
 if Slope2==Inf || Slope2==-Inf
     if x1==x2 || x1==x3 || x2==x1 || x3==x1
     Line2=x1;
     elseif x2==x3 || x3==x2
     Line2=x2;
     end
 else
     Line2= ceil(((i-y1)/Slope2)+x1);
 end
 
 if Slope3==Inf || Slope3==-Inf
     if x1==x2 || x1==x3 || x2==x1 || x3==x1
     Line3=x1;
     elseif x2==x3 || x3==x2
     Line3=x2;
     end
 else
     Line3=ceil(((i-y2)/Slope3)+x2);
 end
 %-------------end slope conditions
 
 %%%%
 %%%%%
 %%%%%%%%% REST OF THE TRIANGLES%%%%%%%%%%%%%%%%%%%%%%%%
 
             %*************TOP HALF OF TRIANGLE
 
             if i<=y2 
             %-----------------------------
             if x2>x3  %check x_condition
                    
              if x4>x2
                     for j= Line1: Line2
                 
%deleted x_ and y_ 


              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              xdash = floor(x_dash) ;
              ydash = floor(y_dash) ;
              
                        
                if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                for m=1:3
                   output_image(i,j,m)=input_image(xdash,ydash,m);
                end
                end
                       end
                             
              else
                  for j= Line2: Line1
                 
%deleted x_ and y_ 


              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              xdash = floor(x_dash) ;
              ydash = floor(y_dash) ;
              
                        
              if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                for m=1:3
                   output_image(i,j,m)=input_image(xdash,ydash,m);
                end
              end
                  end
              end
             %----------------
             elseif x2<x3 %check x_condition
                    
                     if x4<x2
                     for j= Line2: Line1
                 
%deleted x_ and y_ 


              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              xdash = floor(x_dash) ;
              ydash = floor(y_dash) ;
              
                        
                if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                for m=1:3
                   output_image(i,j,m)=input_image(xdash,ydash,m);
                end
                end
                       end
                       
                     
             else
                 for j= Line1 : Line2
%
                            x_dash = a(1) + a(2) * i + a(3) * j ;
                            y_dash = b(1) + b(2) * i + b(3) * j ;
              
                        xdash = floor(x_dash) ;
                        ydash = floor(y_dash) ;
              
                        
                    if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                             for m=1:3
                             output_image(i,j,m)=input_image(xdash,ydash,m);
                             end
                    end
              
              
                    end
                    
              
              
                    end
                    
             end
         %********************BOTTOM HALF OF TRIANGLE*****************
         elseif i>y2
                 %-------x condition---------
                 if x2>x3
                     
                     if x4>x2
                       
                     for j= Line3: Line2
                 
%deleted x_ and y_ 


              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              xdash = floor(x_dash) ;
              ydash = floor(y_dash) ;
              
                        
                if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                for m=1:3
                   output_image(i,j,m)=input_image(xdash,ydash,m);
                end
                end
                     end
                         else 
                     for j= Line2:Line3
                     
                            x_dash = a(1) + a(2) * i + a(3) * j ;
                            y_dash = b(1) + b(2) * i + b(3) * j ;
              
                        xdash = floor(x_dash) ;
                        ydash = floor(y_dash) ;
              
                        
                       if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                             for m=1:3
                             output_image(i,j,m)=input_image(xdash,ydash,m);
                             end
                       end
             
              
                     end
                         end
                 %-------x condition------------    
                 elseif x2<x3
                     
                     if x4<x2
                     for j= Line2: Line3
                 
%deleted x_ and y_ 


              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              xdash = floor(x_dash) ;
              ydash = floor(y_dash) ;
              
                        
                if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                for m=1:3
                   output_image(i,j,m)=input_image(xdash,ydash,m);
                end
                end
                     end
                   
                       
                     
                     
                     else
                         for j= Line3:Line2
                     
                            x_dash = a(1) + a(2) * i + a(3) * j ;
                            y_dash = b(1) + b(2) * i + b(3) * j ;
              
                        xdash = floor(x_dash) ;
                        ydash = floor(y_dash) ;
              
                        
                       if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                             for m=1:3
                             output_image(i,j,m)=input_image(xdash,ydash,m);
                             end
                      end
                    
                       end

                           
                 end
             
             else 
                 for j= Line2:Line3
                     
                            x_dash = a(1) + a(2) * i + a(3) * j ;
                            y_dash = b(1) + b(2) * i + b(3) * j ;
              
                        xdash = floor(x_dash) ;
                        ydash = floor(y_dash) ;
              
                        
                       if( xdash > 0 && xdash < 350 && ydash > 0 && ydash < 300)
                 
                             for m=1:3
                             output_image(i,j,m)=input_image(xdash,ydash,m);
                             end
                       end
             
                 end
             end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CHECK for REMAINING TYPES

 
tp=output_image;
end