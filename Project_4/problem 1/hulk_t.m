function out=hulk_t(image)

bruce_transform=image;




% %---------------------
Size=size(bruce_transform);

Final_Output = zeros(Size(1),Size(2), Size(3));


 %%%%%            triangle 1       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     170 ;...
     228];

V = [
     1;...
     126;...
     1];
 
 
 
x = [ 1 166 243] ;
y = [ 1 130 1] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=1:166
    for j= 1:ceil(((i - 1)/((1-166)/(1-130))) + 1)                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

 %%%%%            triangle 2 and 3       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     170 ;...
     1];

V = [
     1;...
     126;...
     198];
 
 
 
x = [ 1 166 1] ;
y = [ 1 130 196] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=1:166
    for j= ceil(((i - 166)/((166-1)/(130-1))) + 130):ceil(((i - 166)/((166-1)/(130-196))) + 130)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

 %%%%%            triangle 4       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     170 ;...
     170];

V = [
     198;...
     126;...
     198];
 
 
 
x = [ 1 166 166] ;
y = [ 196 130 196] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=1:166
    for j= ceil(((i - 1)/((1-166)/(196-130))) + 196): 196
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 10&11       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     170 ;...
     1];

V = [
     198;...
     268;...
     400];
 
 
 
x = [ 1 166 1] ;
y = [ 196 261 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=1:166
    for j= ceil(((i - 166)/((166-1)/(261-196))) + 261): ceil(((i - 166)/((166-1)/(261-400))) + 261)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

 %%%%%            triangle 9       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     170 ;...
     170];

V = [
     198;...
     198;...
     268];
 
 
 
x = [ 1 166 166] ;
y = [ 196 196 261] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=1:166
    for j= 192:ceil(((i - 1)/((1-166)/(196-261))) + 196)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 12       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     170 ;...
     170];

V = [
     400;...
     268;...
     400];
 
 
 
x = [ 1 166 166] ;
y = [ 400 261 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=1:166
    for j= ceil(((i - 1)/((1-166)/(400-261))) + 400):400
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end
%%%%%            triangle 5       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [170 ;...
     228 ;...
     170];

V = [
     1;...
     1;...
     126];
 
 
 
x = [ 166 243 166] ;
y = [ 1 1 130] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=167:243
    for j= 1:ceil(((i - 166)/((166-243)/(130-1))) + 130)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 6 & 7       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [170 ;...
     228 ;...
     228];

V = [
     126;...
     1;...
     198];
 
 
 
x = [ 166 243 243] ;
y = [ 130 1 196] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=167:243
    for j= ceil(((i - 166)/((166-243)/(130-1))) + 130):ceil(((i - 166)/((166-243)/(130-196))) + 130)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 8 & 13       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [170 ;...
     170 ;...
     228];

V = [
     126;...
     268;...
     198];
 
 
 
x = [ 166 166 243] ;
y = [ 130 261 196] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=167:243
    for j= ceil(((i - 243)/((243-166)/(196-130))) + 196):ceil(((i - 243)/((243-166)/(196-261))) + 196)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 14 & 15       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [170 ;...
     228 ;...
     228];

V = [
     268;...
     198;...
     400];
 
 
 
x = [ 166 243 243] ;
y = [ 261 196 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=167:243
    for j= ceil(((i - 166)/((166-243)/(261-196))) + 261):ceil(((i - 166)/((166-243)/(261-400))) + 261)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 16      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [170 ;...
     228 ;...
     170];

V = [
     268;...
     400;...
     400];
 
 
 
x = [ 166 243 166] ;
y = [ 261 400 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=167:243
    for j= ceil(((i - 166)/((166-243)/(261-400))) + 261):400
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 17       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [228 ;...
     292 ;...
     292];

V = [
     1;...
     1;...
     126];
 
 
 
x = [ 243 300 300] ;
y = [ 1 1 134] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=244:300
    for j= 1:ceil(((i - 243)/((243-300)/(1-134))) + 1)              
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 18 & 19       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [228 ;...
     228 ;...
     292];

V = [
     1;...
     198;...
     126];
 
 
 
x = [ 243 243 300] ;
y = [ 1 196 134] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=244:300
    for j= ceil(((i - 300)/((300-243)/(134-1))) + 134):ceil(((i - 300)/((300-243)/(134-196))) + 134)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 20       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [228 ;...
     292 ;...
     292];

V = [
     198;...
     126;...
     282];
 
 
 
x = [ 243 300 300] ;
y = [ 196 134 272] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=244:300
    for j= ceil(((i - 243)/((243-300)/(196-134))) + 196):ceil(((i - 243)/((243-300)/(196-272))) + 196)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 21 & 22       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [228 ;...
     292 ;...
     228];

V = [
     198;...
     282;...
     400];
 
 
 
x = [ 243 300 243] ;
y = [ 196 272 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=244:300
    for j= ceil(((i - 300)/((300-243)/(272-196))) + 272):ceil(((i - 300)/((300-243)/(272-400))) + 272)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 23       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [228 ;...
     292 ;...
     292];

V = [
     400;...
     282;...
     400];
 
 
 
x = [ 243 300 300] ;
y = [ 400 272 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=244:300
    for j= ceil(((i - 243)/((-300+243)/(400-272))) + 400): 400
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 24       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [292 ;...
     292 ;...
     400];

V = [
     1;...
     126;...
     1];
 
 
 
x = [ 300 300 400] ;
y = [ 1 134 1] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=301:400
    for j= 1:ceil(((i - 300)/((300-400)/(134-1))) + 134)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 25&26       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [292 ;...
     400 ;...
     400];

V = [
     126;...
     1;...
     198];
 
 
 
x = [ 300 400 400] ;
y = [ 134 1 196] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=301:400
    for j= ceil(((i - 300)/((300-400)/(134-1))) + 134):ceil(((i - 300)/((300-400)/(134-196))) + 134)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 27&28       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [292 ;...
     400 ;...
     292];

V = [
     126;...
     198;...
     282];
 
 
 
x = [ 300 400 300] ;
y = [ 134 196 272] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=301:400
    for j= ceil(((i - 400)/((400-300)/(196-134))) + 196):ceil(((i - 400)/((400-300)/(196-272))) + 196)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 29 &30      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [292;...
     400 ;...
     400];

V = [
     282;...
     198;...
     400];
 
 
 
x = [ 300 400 400] ;
y = [ 272 196 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=301:400
    for j= ceil(((i - 300)/((-400+300)/(-196+272))) + 272):ceil(((i - 300)/((-400+300)/(-400+272))) + 272)
                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 31       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [292 ;...
     400 ;...
     292];

V = [
     282;...
     400;...
     400];
 
 
 
x = [ 300 400 300] ;
y = [ 272 400 400] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
for i=301:400
    for j= ceil(((i - 300)/((-400+300)/(272-400))) + 272):400                
              x_dash = a(1) + a(2) * i + a(3) * j ;
              y_dash = b(1) + b(2) * i + b(3) * j ;
              
              
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 400 && y1 > 0 && y1 < 400)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_young);
                    
                    Final_Output(i,j,m)=bruce_transform(x1,y1,m);
                end
              end
                          
 end
end

out=Final_Output;
end
