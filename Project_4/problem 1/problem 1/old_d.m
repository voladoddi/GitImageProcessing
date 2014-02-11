function outp =old_d(image)

drew_old=image;




% %---------------------
Size=size(drew_old);

Final_Output = zeros(Size(1),Size(2), Size(3));

%%%%     triangle 1  %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     175];

V = [
     1;...
     1;...
     98];
 
 
 
x = [ 1 174  174] ;
y = [ 1  1 98] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
epsilon = 1e-7;
for i=1:174
    for j=1:ceil((97/173)*i)
                
          

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
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
              aa= x_dash-x1;
              bb= y_dash-y1;
              
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                 
                for m=1:3
                   Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                        
          
         
                 
     end
end
 

%%%%%          triangle 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     1];

V = [
     1;...
     98;...
     98];
 
 
 
x = [ 1 174 1] ;
y = [ 1  98 98] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
epsilon = 1e-7;
for i=174:-1:1
    for j= 98: -1: ceil((97/173)*i)
                
          

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
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
            
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                  for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                  end
             end
            
           
            
         
     end
end


 %%%%%            triangle 3     %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     1];

V = [
     98;...
     98;...
     148];
 
 
 
x = [ 1 174 1] ;
y = [ 98  98 149] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
epsilon = 1e-7;
for i=174:-1:1
for j= ceil(((i - 1)/(-3.3922)) + 149):-1:98
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              %%%additional check
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
              %%%
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
              aa= x_dash-x1;
              bb= y_dash-y1;
              
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                    pixel(m)=interpolate(aa,bb,x1,y1,m,drew_old);
                    
                    Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end


 %%%%%            triangle 4        %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     175];

V = [
     148;...
     98;...
     148];
 
 
 
x = [ 1 174 174] ;
y = [149  98 149] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
epsilon = 1e-7;
for i=174:-1:1
    for j= ceil(((i - 1)/(-3.3922)) + 149):149
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              %%%additional check
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
              %%%
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
              aa= x_dash-x1;
              bb= y_dash-y1;
              
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_old);
                    
                    Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

 %%%%%            triangle 9       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     175];

V = [
     148;...
     148;...
     202];
 
 
 
x = [ 1 174 174] ;
y = [149  149 202] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
epsilon = 1e-7;
for i=1:174
    for j= 1:ceil(((i - 1)/((1-174)/(149-202))) + 149)
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              %%%additional check
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
              %%%
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
              aa= x_dash-x1;
              bb= y_dash-y1;
              
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_old);
                    
                    Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

  %%%%%            triangle 10       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     1];

V = [
     148;...
     202;...
     202];
 
 
 
x = [ 1 174 1] ;
y = [149  202 202] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
epsilon = 1e-7;
for i=1:174
    for j= ceil(((i - 1)/((1-174)/(149-202))) + 149):1:202
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              %%%additional check
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
              %%%
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
              aa= x_dash-x1;
              bb= y_dash-y1;
              
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
%                     pixel(m)=interpolate(aa,bb,x1,y1,m,drew_old);
                    
                    Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end


 %%%%%            triangle 11       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     1];

V = [
     148;...
     202;...
     300];
 
 
 
x = [ 1 174 1] ;
y = [149  202 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 
 
epsilon = 1e-7;
for i=1:174
    for j= ceil(((i - 1)/((1-174)/(300-202))) + 300):-1:202
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              
              %%%additional check
              if(abs(x_dash) < epsilon)
                  x_dash = 0;
              end
              
              if(abs(y_dash) < epsilon)
                  y_dash = 0;
              end
              %%%
                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
              aa= x_dash-x1;
              bb= y_dash-y1;
              
              if( x1 > 0 && x1 < 350 && y1 > 0 && y1 < 300)
                for m=1:3
                 
                    
                    Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

 %%%%%            triangle 12       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [1 ;...
     175 ;...
     175];

V = [
     300;...
     202;...
     300];
 
 
 
x = [ 1 174 174] ;
y = [300  202 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=1:174
for j= ceil(((i - 1)/((1-174)/(300-202))) + 300):1:300
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3

                    
                    Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end


 %%%%%            triangle 5      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [238;...
     175 ;...
     175];

V = [
     1;...
     1;...
     98];
 
 
 
x = [ 240 174 174] ;
y = [1 1 98] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= ceil(((i - 174)/((174-240)/(98-1))) + 98):-1:1
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

 %%%%%            triangle 6       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [175;...
     238 ;...
     238];

V = [
     98;...
     1;...
     98];
 
 
 
x = [174 240 240] ;
y = [98 1 98] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= ceil(((i - 174)/((174-240)/(98-1))) + 98):1:98
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 7       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [175;...
     238 ;...
     238];

V = [
     98;...
     98;...
     148];
 
 
 
x = [174 240 240] ;
y = [98 98 149] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= 98:1:ceil(((i - 174)/((174-240)/(98-149))) + 98)
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 8       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [175;...
     238 ;...
     175];

V = [
     98;...
     148;...
     148];
 
 
 
x = [174 240 174] ;
y = [98 149 149] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= ceil(((i - 174)/((174-240)/(98-149))) + 98):149
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 13       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [175;...
     238 ;...
     175];

V = [
     148;...
     148;...
     202];
 
 
 
x = [174 240 174] ;
y = [149 149 202] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= ceil(((i - 174)/((174-240)/(202-149))) + 202):-1:149
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 14       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [175;...
     238 ;...
     238];

V = [
     202;...
     148;...
     202];
 
 
 
x = [174 240 240] ;
y = [202 149 202] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= ceil(((i - 174)/((174-240)/(202-149))) + 202):1:202
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%            triangle 15       %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [175;...
     238 ;...
     238];

V = [
     202;...
     202;...
     300];
 
 
 
x = [174 240 240] ;
y = [202 202 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= 202:ceil(((i - 174)/((174-240)/(202-300))) + 202)
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end
%%%%%            triangle 16      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [175;...
     175 ;...
     238];

V = [
     202;...
     300;...
     300];
 
 
 
x = [174 174 240] ;
y = [202 300 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=174:240
for j= ceil(((i - 174)/((174-240)/(202-300))) + 202):300
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 23      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [238;...
     264 ;...
     264];

V = [
     1;...
     1;...
     104];
 
 
 
x = [240 268 268] ;
y = [1 1 107] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=240:268
for j= 1:ceil(((i - 240)/((240-268)/(1-107))) + 1)
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end


%%%%%     triangle 17      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [238;...
     264 ;...
     238];

V = [
     1;...
     104;...
     104];
 
 
 
x = [240 268 240] ;
y = [1 107 107] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=240:268
for j= ceil(((i - 240)/((240-268)/(1-107))) + 1):107
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 18      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [238;...
     264 ;...
     238];

V = [
     98;...
     104;...
     202];
 
 
 
x = [240 268 240] ;
y = [98 107 202] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=240:268
for j= ceil(((i - 240)/((240-268)/(149-107))) + 149):-1:107
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 19 and 20      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [238;...
     264 ;...
     268];

V = [
     148;...
     104;...
     189];
 
 
 
x = [240 268 270] ;
y = [149 107 189] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=240:268
for j= ceil(((i - 240)/((240-268)/(149-107))) + 149): ceil(((i - 240)/((240-270)/(149-189))) + 149)
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 21 and 22      %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [238;...
     268 ;...
     238];

V = [
     148;...
     189;...
     300];
 
 
 
x = [240 270 240] ;
y = [149 189 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=240:268
for j= ceil(((i - 240)/((240-270)/(149-189))) + 149):ceil(((i - 240)/((240-270)/(300-189))) + 300) 
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 32   %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [238;...
     268 ;...
     268];

V = [
     300;...
     189;...
     300];
 
 
 
x = [240 270 270] ;
y = [300 189 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=240:268
for j= ceil(((i - 240)/((240-270)/(300-189))) + 300):300
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 300 && y1 > 0 && y1 < 350)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 24   %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [350;...
     264 ;...
     264];

V = [
     1;...
     1;...
     104];
 
 
 
x = [350 268 268] ;
y = [1 1 107] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=268:350
for j=ceil(((i - 268)/((268-350)/(107-1))) + 107):-1:1
                
        

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 350 && y1 > 0 && y1 < 300)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                  %drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 25 and 26     %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [264;...
     350 ;...
     350];

V = [
     104;...
     1;...
     148];
 
 
 
x = [268 350 350] ;
y = [107 1 149] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=268:350
for j= ceil(((i - 268)/((268-350)/(107-1))) + 107):ceil(((i - 268)/((268-350)/(107-149))) + 107) 
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 350 && y1 > 0 && y1 < 300)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

%%%%%     triangle 24 and 28     %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [264;...
     350 ;...
     268];

V = [
     104;...
     148;...
     189];
 
 
 
x = [268 350 270] ;
y = [107 149 189] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=268:350
for j= ceil(((i - 268)/((268-350)/(107-1))) + 107):ceil(((i - 270)/((270-350)/(189-149))) + 189) 
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 350 && y1 > 0 && y1 < 300)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end
%%%%%     triangle 29 and 30     %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [268;...
     350 ;...
     350];

V = [
     189;...
     148;...
     300];
 
 
 
x = [270 350 350] ;
y = [189 149 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=270:350
for j= ceil(((i - 270)/((270-350)/(189-149))) + 189):ceil(((i - 270)/((270-350)/(189-300))) + 189)
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 350 && y1 > 0 && y1 < 300)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end
%%%%%     triangle 31     %%%%%%%%%%%%%%%%%%%%%%%%%%%
U = [268;...
     268 ;...
     350];

V = [
     300;...
     189;...
     300];
 
 
 
x = [240 268 350] ;
y = [300 189 300] ;


A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];


 B = pinv((A')*A)*A';
 
 a = B*U;
 b = B*V;
 

for i=268:350
for j= ceil(((i - 270)/((270-350)/(189-300))) + 189):300
                
          

              x_ = (i);
              y_ = (j);

              x_dash = a(1) + a(2) * x_ + a(3) * y_ ;
              y_dash = b(1) + b(2) * x_ + b(3) * y_ ;
              

                  
              x1 = floor(x_dash) ;
              y1 = floor(y_dash) ;
              
               
              if( x1 > 0 && x1 < 350 && y1 > 0 && y1 < 300)
                for m=1:3
                  Final_Output(i,j,m)=drew_old(x1,y1,m);
                end
              end
                          
 end
end

outp=Final_Output;
end
