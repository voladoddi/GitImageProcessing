function Image = Circular_Warp(In_Image)

Size = size(In_Image);
Image_Transformmer = In_Image;
 %%%%%%Finding the new origin
 
if(mod(Size(1),2) == 0)
    mid_x = Size(1) / 2;
else
    mid_x = floor(Size(1) / 2 ) + 1;
end


if(mod(Size(2),2) == 0)
    mid_y = Size(2) / 2;
else
    mid_y = floor(Size(2) / 2 ) + 1;
end

  Circular_Image_Red_Plane = zeros(Size(1),Size(2));

%%%%%%%%%%%%%%%% 1st Section %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U = [1 ;...
     
     250 ;...
    
    
     250;...
     125 ;...
     2  ;...
      250] - mid_x ;
V = [
     1;...
     1 ;...
    
     250
     1;...
     2;...
     125]- mid_y;
 
 
Theta1 = atan(125/250);
 
R1 = 250 *sqrt(2) - sqrt(74^2 + 74^2);

x = [ -250*cos(pi/4)  0   0  -250*sin(Theta1) -R1*sin(pi/4)  0  ] ;
y = [ -250*cos(pi/4) -249 0  -250*cos(Theta1) -R1*cos(pi/4) -125] ;



A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 


epsilon = 1e-7;
 for i = -249 : 0 
     for j = -249 : i
         
          
          
         
              x_ = (i);
              y_ = (j);
             
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  
              x1 = (floor(x_dash + mid_x ))  ;
              
              y1 = floor(y_dash + mid_y) ;
             
              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                      
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[(x_dash) + mid_x   y_dash + mid_y ]);
                
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                  
              end
         
     end
 end
 
 

% %   %%%%%%%%%%%%%%%%%%%%%%%%%%  2nd Section %%%%%%%%%%%%%%%%%
U = [1 ;...
     1 ;...
     250;...
     1 ;...
     2 ;...
     125] - mid_x ;
V = [1;...
     250 ;...
     250;...
     125;...
     2;...
     250]- mid_y;
 
 
 Theta1 = atan(125/250);
 
x = [ -250*cos(pi/4)  -249   0  -250*cos(Theta1) -R1*cos(pi/4)  -125] ;
y = [ -250*cos(pi/4)   0     0  -250*sin(Theta1) -R1*cos(pi/4)  0] ;



A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

 for i = -249 : 0 
     for j = 0 : - 1 : i
         
          
          

              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  


                  
              x1 = floor(x_dash + mid_x )  ;
              
              y1 = floor(y_dash + mid_y) ;
               
              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                 
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[x_dash + mid_x  y_dash + mid_y ]);
               
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                 
              end
              
     end
 end

% % % % 
% % % %   %%%%%%%%%%%%%%%%  3rd Section %%%%%%%%%%%%%%%%%
% % % %   
%   
% 
% 
  U = [250 ;...
     
      500 ;...
      250;...
      250;...
      375;...
      499] - mid_x ;
V = [1;...
     1 ;...
     250;...
     125;...
     1;...
     2]- mid_y;

 
x = [  0    250*cos(pi/4)  0  0    250*sin(Theta1)    R1*cos(pi/4)  ] ;
y = [ -249 -250*sin(pi/4)  0 -125 -250*cos(Theta1)   -R1*sin(pi/4)  ] ;



A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 


 for i = 250 : -1 :0 
     for j = -249 :ceil(-249*i/250)
         
              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  
              x1 = floor(x_dash + mid_x )  ;
              
              y1 = floor(y_dash + mid_y) ;
             
              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                 
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[x_dash + mid_x   y_dash + mid_y ]);
               
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                
                  
                  
              end
         
     end
 end
 
% %  
% %   %%%%%%%%%%%%%%%%% 4th Section %%%%%%%%%%%%%%%%%%%%%
  
  U = [500 ;...
     
      500 ;...
      250;...
      500;...
      375;...
      499] - mid_x ;
V = [1;...
     250 ;...
     250;...
     125;...
     250;...
     2]- mid_y;


 
x = [ 250*cos(pi/4)  250   0    250*cos(Theta1) 125  R1*cos(pi/4)  ] ;
y = [-250*sin(pi/4)  0     0   -250*sin(Theta1) 0   -R1*sin(pi/4)  ] ;



A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];
 

 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 for i = 0 : 250 
     for j = 0  :-1: ceil(-249*i/250)
         
          
          
          
             
              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  
              x1 = floor(x_dash + mid_x )  ;
              
              y1 = floor(y_dash + mid_y) ;
              
              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                 
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[x_dash + mid_x   y_dash + mid_y ]);
               
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                
                  
                  
              end
              
              
             %end
         
         
     end
 end
 

 
% %   %%%%%%%%%%%%%%%%%%%%%%% 5th Section %%%%%%%%%%%%%%%%%
  

  U = [1 ;...
     
      1 ;...
      250;...
      1;...
      125;...
      2] - mid_x ;
V = [500;...
     250 ;...
     250;...
     375;...
     250;...
     499]- mid_y;
 
 

 
x = [-250*cos(pi/4) -249   0   -250*cos(Theta1) -125 -R1*cos(pi/4)  ] ;
y = [ 250*sin(pi/4)  0     0    250*sin(Theta1)  0    R1*sin(pi/4)  ] ;


A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];
 

 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;

 for i = -249 : 0 
     for j = 0 : ceil(-250*i/249)
          
              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  
              x1 = floor(x_dash + mid_x )  ;
              
              y1 = floor(y_dash + mid_y) ;
              
              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                 
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[x_dash + mid_x   y_dash + mid_y ]);
                
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                  
                  
              end
              
         
     end
 end
 
   
% %   
% %   %%%%%%%%%%%% 6th Section %%%%%%%%%%%%%%%%%

U = [1 ;...
     
      250 ;...
      250;...
      250;...
      125;...
      2] - mid_x ;
V = [500;...
     500 ;...
     250;...
     375;...
     500;...
     499]- mid_y;
 

 
x = [-250*cos(pi/4)  0     0    0      -250*sin(Theta1)     -R1*cos(pi/4)  ] ;
y = [ 250*sin(pi/4)  250   0    125     250*cos(Theta1)      R1*sin(pi/4)  ] ;

A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];
 

 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 for i = -249 : 0 
     for j = 250 : -1 :ceil(- 250*i/249)
         

              x_ = (i);
              y_ = (j);
              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  
              x1 = floor(x_dash + mid_x )  ;
              
              y1 = floor(y_dash + mid_y) ;

              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                 
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[x_dash + mid_x   y_dash + mid_y ]);
                
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                  
                  
              end
             
     end
 end


% %%%%%%%%%%%%%%%%%%%%%%  7th Section %%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
 U = [500 ;...
      250 ;...
      250 ;...
      250 ;...
      375 ;...
      499] - mid_x ;

V = [500;...
     500 ;...
     250 ;...
     375 ;...
     500 ;...
     499]- mid_y;
 
 Theta1 = atan(125/250);
 
x = [  250*cos(pi/4) 0    0 0    250*sin(Theta1) R1*cos(pi/4)] ;
y = [  250*sin(pi/4) 250  0 125  250*cos(Theta1) R1*sin(pi/4)] ;






A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];
 

 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

 for i =  250 : - 1: 0
      for j = 250 : -1 :i
         
          
          
              x_ = (i);
              y_ = (j);
              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  
              x1 = floor(x_dash + mid_x )  ;
              
              y1 = floor(y_dash + mid_y) ;
 
              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                 
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[x_dash + mid_x  y_dash + mid_y ]);
                
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                  
                  
              end
            
     end
 end
 
%  
%  
%  
%  %%%%%%%%%%%%%%%%%%%%%%%%%%% 8th Section %%%%%%%%%%%%%%%%%%%%%%%
%  
%  
 U = [500 ;...
      500 ;...
      250 ;...
      375 ;...
      500 ;...
      499] - mid_x ;

V = [500;...
     250 ;...
     250 ;...
     250 ;...
     375 ;...
     499]- mid_y;
 
 Theta1 = atan(125/250);
 
x = [  250*cos(pi/4) 250    0 125    250*cos(Theta1) R1*cos(pi/4)] ;
y = [  250*sin(pi/4) 0      0 0      250*sin(Theta1) R1*sin(pi/4)] ;




A = [1 x(1) y(1) x(1)*x(1) x(1) * y(1) y(1)*y(1) ;...
     1 x(2) y(2) x(2)*x(2) x(2) * y(2) y(2)*y(2) ;...
     1 x(3) y(3) x(3)*x(3) x(3) * y(3) y(3)*y(3) ;...
     1 x(4) y(4) x(4)*x(4) x(4) * y(4) y(4)*y(4) ;...
     1 x(5) y(5) x(5)*x(5) x(5) * y(5) y(5)*y(5) ;...
     1 x(6) y(6) x(6)*x(6) x(6) * y(6) y(6)*y(6) ];
 

 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;

 for i =  0 : 250 
     for j = 0 :i
         
          
          
              x_ = (i);
              y_ = (j);
              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ + a(4) * x_ * x_ + a(5) *x_*y_ + a(6) * y_ * y_;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ + b(4) * x_ * x_ + b(5) *x_*y_ + b(6) * y_ * y_;
              
              
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
                  
              x1 = floor(x_dash + mid_x )  ;
              
              y1 = floor(y_dash + mid_y) ;

              if( x1 > 0 && x1 < 500 && y1 > 0 && y1 < 500)
                 
                Pixel =  Bilinear_Interpolation(x1 ,y1 ,Image_Transformmer(x1,y1,1),Image_Transformmer(x1 + 1, y1 ,1), Image_Transformmer(x1, y1 + 1 ,1), Image_Transformmer(x1 + 1 , y1 + 1,1),[x_dash + mid_x   y_dash + mid_y ]);
                
                Circular_Image_Red_Plane(j + mid_x ,i + mid_y) = abs(floor(Pixel));
                  
                  
              end
         
     end
 end

Image = Circular_Image_Red_Plane;


end