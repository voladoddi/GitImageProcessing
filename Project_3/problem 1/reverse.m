function Diamond = reverse(Image)

Image_Transformmer = Image;
Size = size(Image);

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


U = [1 ;...
     
     250 ;...
    
    
     250] - mid_x ;
V = [
     1;...
     1 ;...
    
     250]- mid_y;
 
 
 
x = [ -125 0  0] ;
y = [ -125 -249 0] ;



% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];


 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');
 
 




epsilon = 1e-7;
 for i = -249 : 0 
     for j = -249 : i
         
          
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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
 
 
  
  
 
  %%%%%%%%%%%%%%%%%%%%%%%%%%
  
  U = [1 ;...
     
     1 ;...
    
    
     250] - mid_x ;
V = [
     1;...
     250 ;...
    
     250]- mid_y;
 
 
 
x = [ -125 -249  0] ;
y = [ -125 0 0] ;



% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];


 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');
 


epsilon = 1e-7;
 for i = -249 : 0 
     for j = 0 : - 1 : i
         
          
          

              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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


%   %%%%%%%%%%%%%%%%
%   
  
  U = [250 ;...
       500 ;...
       250] - mid_x ;
  
   V = [1;...
        1 ;...
        250]- mid_y;
 
 
 
x = [  0   125 0 ] ;
y = [ -249 -125 0] ;



% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];


 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');



epsilon = 1e-7;
 for i = 250 : -1 :0 
     for j = -249 :ceil(-249*i/250)
         
          
          
          
             
              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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
 

 
%   %%%%%%%%%%%%%%%%%
  
  U = [500 ;...
       500 ;...
       250] - mid_x ;

  V = [1;...
       250 ;...
       250]- mid_y;
 
 
 
x = [ 125 250 0 ] ;
y = [-125 0  0] ;




% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];


 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');
 
 




epsilon = 1e-7;
 for i = 0 : 250 
     for j = 0  :-1: ceil(-249*i/250)
         
          
          
              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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
%   %%%%%%%%%%%%%%%%%%%%%%%
  
   U = [1 ;...
        1 ;...
        250] - mid_x ;

   V = [500;...
        250 ;...
        250]- mid_y;
 
 
 
x = [ -125 -249 0 ] ;
y = [  125 0  0] ;




% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];


 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');
 
 epsilon = 1e-7;
 for i = -249 : 0 
     for j = 0 : ceil(-250*i/249)
         
          
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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

%  

  
%   
%   %%%%%%%%%%%%
   U = [1 ;...
        250 ;...
        250] - mid_x ;

   V = [500;...
        500 ;...
        250]- mid_y;
 
 
 
x = [ -125 0 0 ] ;
y = [  125 250  0] ;




% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];



 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');
 


epsilon = 1e-7;
 for i = -249 : 0 
     for j = 250 : -1 :ceil(- 250*i/249)
         
          
          

              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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
 
%  
  
  



%%%%%%%%%%%%%%%%%%%%%%


 U = [500 ;...
      250 ;...
      250] - mid_x ;
 
 V = [500;...
      500 ;...
      250]- mid_y;
 
 
 
x = [  125 0 0 ] ;
y = [  125 250  0] ;




% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];


 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');
 


epsilon = 1e-7;
 for i =  250 : - 1: 0
      for j = 250 : -1 :i
         
          
          

              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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

 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
  U = [500 ;...
       500 ;...
       250] - mid_x ;
   
   
  V = [500;...
       250 ;...
       250]- mid_y;
 
 
 
x = [  125 250 0 ] ;
y = [  125 0   0] ;




% figure,
% plot(U,V,'o')
% 
% hold on
% plot(x,y,'o')
% title('Control Points in Warped Image')


A = [1 U(1) V(1) ;...
     1 U(2) V(2) ;...
     1 U(3) V(3) ];



 B = pinv((A')*A)*A';
 
 a = B*(x');
 b = B*(y');
 

epsilon = 1e-7;
 for i =  0 : 250 
     for j = 0 :i
         
          
          

              x_ = (i);
              y_ = (j);

              
              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              
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
 Diamond = Circular_Image_Red_Plane;
end