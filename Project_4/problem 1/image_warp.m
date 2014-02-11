
function wp = image_warp(image,U_arr,V_arr,X_arr,Y_arr)

source_img=image;

u_array=U_arr;
v_array=V_arr;

x_array=X_arr;
y_array=Y_arr;



Size=size(source_img);
Final_Output = zeros(Size(1),Size(2), Size(3));


%%%%     triangle 1  %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(1) ; u_array(6) ; u_array(23)];
V = [v_array(1) ; v_array(6);  v_array(23)];
 
 
x = [ x_array(1) x_array(6)  x_array(23)] ;
y = [ y_array(1) y_array(6)  y_array(23)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output1 = triangle_warp1(source_img,A,U,V,Final_Output);


% %%%%     triangle 2 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(1) ; u_array(6) ; u_array(7)];
V = [v_array(1) ; v_array(6);  v_array(7)];
 
 
x = [ x_array(1) x_array(6)  x_array(7)] ;
y = [ y_array(1) y_array(6)  y_array(7)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output2 = triangle_warp1(source_img,A,U,V,Final_Output1);

% %%%%     triangle 4 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(2) ; u_array(7) ; u_array(9)];
V = [v_array(2) ; v_array(7);  v_array(9)];
 
 
x = [ x_array(2) x_array(7)  x_array(9)] ;
y = [ y_array(2) y_array(7)  y_array(9)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output3 = triangle_warp1(source_img,A,U,V,Final_Output2);

% %%%%     triangle 11 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(5) ; u_array(13) ; u_array(14)];
V = [v_array(5) ; v_array(13);  v_array(14)];
 
 
x = [ x_array(5) x_array(13)  x_array(14)] ;
y = [ y_array(5) y_array(13)  y_array(14)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output4 = triangle_warp1(source_img,A,U,V,Final_Output3);

% %%%%     triangle 6 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(3) ; u_array(10) ; u_array(9)];
V = [v_array(3) ; v_array(10);  v_array(9)];
 
 
x = [ x_array(3) x_array(10)  x_array(9)] ;
y = [ y_array(3) y_array(10)  y_array(9)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output5 = triangle_warp1(source_img,A,U,V,Final_Output4);


% %%%%     triangle 7 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(3) ; u_array(11) ; u_array(10)];
V = [v_array(3) ; v_array(11);  v_array(10)];
 
 
x = [ x_array(3) x_array(11)  x_array(10)] ;
y = [ y_array(3) y_array(11)  y_array(10)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output6 = triangle_warp1(source_img,A,U,V,Final_Output5);

% %%%%     triangle 9 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(4) ; u_array(13) ; u_array(11)];
V = [v_array(4) ; v_array(13);  v_array(11)];
 
 
x = [ x_array(4) x_array(13)  x_array(11)] ;
y = [ y_array(4) y_array(13)  y_array(11)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output7 = triangle_warp1(source_img,A,U,V,Final_Output6);

% %%%%     triangle 12 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(5) ; u_array(14) ; u_array(24)];
V = [v_array(5) ; v_array(14);  v_array(24)];
 
 
x = [ x_array(5) x_array(14)  x_array(24)] ;
y = [ y_array(5) y_array(14)  y_array(24)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output8 = triangle_warp1(source_img,A,U,V,Final_Output7);


% %%%%     triangle 3 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(1) ; u_array(2) ; u_array(7)];
V = [v_array(1) ; v_array(2);  v_array(7)];
 
 
x = [ x_array(1) x_array(2)  x_array(7)] ;
y = [ y_array(1) y_array(2)  y_array(7)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output9 = triangle_warp1(source_img,A,U,V,Final_Output8);

% %%%%     triangle 5 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(2) ; u_array(3) ; u_array(9)];
V = [v_array(2) ; v_array(3);  v_array(9)];
 
 
x = [ x_array(2) x_array(3)  x_array(9)] ;
y = [ y_array(2) y_array(3)  y_array(9)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output10 = triangle_warp1(source_img,A,U,V,Final_Output9);

% %%%%     triangle 8 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(3) ; u_array(4) ; u_array(11)];
V = [v_array(3) ; v_array(4);  v_array(11)];
 
 
x = [ x_array(3) x_array(4)  x_array(11)] ;
y = [ y_array(3) y_array(4)  y_array(11)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output11 = triangle_warp1(source_img,A,U,V,Final_Output10);

% %%%%     triangle 10 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(4) ; u_array(5) ; u_array(13)];
V = [v_array(4) ; v_array(5);  v_array(13)];
 
 
x = [ x_array(4) x_array(5)  x_array(13)] ;
y = [ y_array(4) y_array(5)  y_array(13)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output12 = triangle_warp1(source_img,A,U,V,Final_Output11);

% %%%%     triangle 13 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(6) ; u_array(15) ; u_array(23)];
V = [v_array(6) ; v_array(15);  v_array(23)];
 
 
x = [ x_array(6) x_array(15)  x_array(23)] ;
y = [ y_array(6) y_array(15)  y_array(23)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output13 = triangle_warp1(source_img,A,U,V,Final_Output12);

% %%%%     triangle 36 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(14) ; u_array(17) ; u_array(24)];
V = [v_array(14) ; v_array(17);  v_array(24)];
 
 
x = [ x_array(14) x_array(17)  x_array(24)] ;
y = [ y_array(14) y_array(17)  y_array(24)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output14 = triangle_warp1(source_img,A,U,V,Final_Output13);

% %%%%     triangle 37 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(18) ; u_array(22) ; u_array(23)];
V = [v_array(18) ; v_array(22);  v_array(23)];
 
 
x = [ x_array(18) x_array(22)  x_array(23)] ;
y = [ y_array(18) y_array(22)  y_array(23)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output15 = triangle_warp1(source_img,A,U,V,Final_Output14);

% %%%%     triangle 38 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(21) ; u_array(22) ; u_array(24)];
V = [v_array(21) ; v_array(22);  v_array(24)];
 
 
x = [ x_array(21) x_array(22)  x_array(24)] ;
y = [ y_array(21) y_array(22)  y_array(24)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output16 = triangle_warp1(source_img,A,U,V,Final_Output15);

% %%%%     triangle 30 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(15) ; u_array(18) ; u_array(23)];
V = [v_array(15) ; v_array(18);  v_array(23)];
 
 
x = [ x_array(15) x_array(18)  x_array(23)] ;
y = [ y_array(15) y_array(18)  y_array(23)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output17 = triangle_warp1(source_img,A,U,V,Final_Output16);

% %%%%     triangle 35 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(17) ; u_array(21) ; u_array(24)];
V = [v_array(17) ; v_array(21);  v_array(24)];
 
 
x = [ x_array(17) x_array(21)  x_array(24)] ;
y = [ y_array(17) y_array(21)  y_array(24)] ;



A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output18 = triangle_warp1(source_img,A,U,V,Final_Output17);


% %%%%     triangle 14 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(7) ; u_array(6) ; u_array(15)];
V = [v_array(7) ; v_array(6);  v_array(15)];
 
x = [ x_array(7) x_array(6)  x_array(15)] ;
y = [ y_array(7) y_array(6)  y_array(15)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output19 = triangle_warp1(source_img,A,U,V,Final_Output18);


% %%%%     triangle 15 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(7) ; u_array(15) ; u_array(18)];
V = [v_array(7) ; v_array(15);  v_array(18)];
 
x = [ x_array(7) x_array(15)  x_array(18)] ;
y = [ y_array(7) y_array(15)  y_array(18)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output20 = triangle_warp1(source_img,A,U,V,Final_Output19);

% %%%%     triangle 16 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(7) ; u_array(18) ; u_array(19)];
V = [v_array(7) ; v_array(18);  v_array(19)];
 
x = [ x_array(7) x_array(18)  x_array(19)] ;
y = [ y_array(7) y_array(18)  y_array(19)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output21 = triangle_warp1(source_img,A,U,V,Final_Output20);

% % % %%%%     triangle 18 %%%%%%%%%%%%%%%%%%%%%%%%%%
% % U = [u_array(7) ; u_array(9) ; u_array(8)];
% % V = [v_array(7) ; v_array(9);  v_array(8)];
% %  
% % x = [ x_array(7) x_array(9)  x_array(8)] ;
% % y = [ y_array(7) y_array(9)  y_array(8)] ;
% % 
% % A = [1 x(1) y(1) ;...
% %      1 x(2) y(2) ;...
% %      1 x(3) y(3) ];
% %  
% % Final_Output22 = triangle_warp1(source_img,A,U,V,Final_Output21);
% % 
% % % %%%%     triangle 19 %%%%%%%%%%%%%%%%%%%%%%%%%%
% % U = [u_array(9) ; u_array(8) ; u_array(19)];
% % V = [v_array(9) ; v_array(8);  v_array(19)];
% %  
% % x = [ x_array(9) x_array(8)  x_array(19)] ;
% % y = [ y_array(9) y_array(8)  y_array(19)] ;
% % 
% % A = [1 x(1) y(1) ;...
% %      1 x(2) y(2) ;...
% %      1 x(3) y(3) ];
% %  
% Final_Output23 = triangle_warp1(source_img,A,U,V,Final_Output22);

% % %%%%     triangle 17,18,19 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(7) ; u_array(9) ; u_array(19)];
V = [v_array(7) ; v_array(9);  v_array(19)];
 
x = [ x_array(7) x_array(9)  x_array(19)] ;
y = [ y_array(7) y_array(9)  y_array(19)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output22 = triangle_warp1(source_img,A,U,V,Final_Output21);


% %%%%     triangle 20 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(9) ; u_array(16) ; u_array(19)];
V = [v_array(9) ; v_array(16);  v_array(19)];
 
x = [ x_array(9) x_array(16)  x_array(19)] ;
y = [ y_array(9) y_array(16)  y_array(19)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output23 = triangle_warp1(source_img,A,U,V,Final_Output22);

% %%%%     triangle 21 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(10) ; u_array(9) ; u_array(16)];
V = [v_array(10) ; v_array(9);  v_array(16)];
 
x = [ x_array(10) x_array(9)  x_array(16)] ;
y = [ y_array(10) y_array(9)  y_array(16)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output24 = triangle_warp1(source_img,A,U,V,Final_Output23);

% %%%%     triangle 22 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(11) ; u_array(10) ; u_array(16)];
V = [v_array(11) ; v_array(10);  v_array(16)];
 
x = [ x_array(11) x_array(10)  x_array(16)] ;
y = [ y_array(11) y_array(10)  y_array(16)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output25 = triangle_warp1(source_img,A,U,V,Final_Output24);

% %%%%     triangle 23 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(11) ; u_array(16) ; u_array(20)];
V = [v_array(11) ; v_array(16);  v_array(20)];
 
x = [ x_array(11) x_array(16)  x_array(20)] ;
y = [ y_array(11) y_array(16)  y_array(20)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output26 = triangle_warp1(source_img,A,U,V,Final_Output25);

% %%%%     triangle 32 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(16) ; u_array(19) ; u_array(20)];
V = [v_array(16) ; v_array(19);  v_array(20)];
 
x = [ x_array(16) x_array(19)  x_array(20)] ;
y = [ y_array(16) y_array(19)  y_array(20)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output27 = triangle_warp1(source_img,A,U,V,Final_Output26);

% %%%%     triangle 24,25,26 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(13) ; u_array(11) ; u_array(20)];
V = [v_array(13) ; v_array(11);  v_array(20)];
 
x = [ x_array(13) x_array(11)  x_array(20)] ;
y = [ y_array(13) y_array(11)  y_array(20)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output28 = triangle_warp1(source_img,A,U,V,Final_Output27);

% % %%%%     triangle 24 %%%%%%%%%%%%%%%%%%%%%%%%%%
% U = [u_array(11) ; u_array(12) ; u_array(20)];
% V = [v_array(11) ; v_array(12);  v_array(20)];
%  
% x = [ x_array(11) x_array(12)  x_array(20)] ;
% y = [ y_array(11) y_array(12)  y_array(20)] ;
% 
% A = [1 x(1) y(1) ;...
%      1 x(2) y(2) ;...
%      1 x(3) y(3) ];
%  
% Final_Output29 = triangle_warp1(source_img,A,U,V,Final_Output28);
% 

% %%%%     triangle 27 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(13) ; u_array(21) ; u_array(20)];
V = [v_array(13) ; v_array(21);  v_array(20)];
 
x = [ x_array(13) x_array(21)  x_array(20)] ;
y = [ y_array(13) y_array(21)  y_array(20)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output29 = triangle_warp1(source_img,A,U,V,Final_Output28);

% %%%%     triangle 28 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(13) ; u_array(17) ; u_array(21)];
V = [v_array(13) ; v_array(17);  v_array(21)];
 
x = [ x_array(13) x_array(17)  x_array(21)] ;
y = [ y_array(13) y_array(17)  y_array(21)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output30 = triangle_warp1(source_img,A,U,V,Final_Output29);

% %%%%     triangle 29 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(14) ; u_array(13) ; u_array(17)];
V = [v_array(14) ; v_array(13);  v_array(17)];
 
x = [ x_array(14) x_array(13)  x_array(17)] ;
y = [ y_array(14) y_array(13)  y_array(17)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
 
Final_Output31 = triangle_warp1(source_img,A,U,V,Final_Output30);

% %%%%     triangle 33 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(20) ; u_array(19) ; u_array(22)];
V = [v_array(20) ; v_array(19);  v_array(22)];
 
x = [ x_array(20) x_array(19)  x_array(22)] ;
y = [ y_array(20) y_array(19)  y_array(22)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
Final_Output32 = triangle_warp1(source_img,A,U,V,Final_Output31);

% %%%%     triangle 39 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(22) ; u_array(23) ; u_array(24)];
V = [v_array(22) ; v_array(23);  v_array(24)];
 
x = [ x_array(22) x_array(23)  x_array(24)] ;
y = [ y_array(22) y_array(23)  y_array(24)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
Final_Output33 = triangle_warp1(source_img,A,U,V,Final_Output32);


% %%%%     triangle 31 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(18) ; u_array(19) ; u_array(22)];
V = [v_array(18) ; v_array(19);  v_array(22)];
 
x = [ x_array(18) x_array(19)  x_array(22)] ;
y = [ y_array(18) y_array(19)  y_array(22)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
Final_Output34 = triangle_warp1(source_img,A,U,V,Final_Output33);

% %%%%     triangle 34 %%%%%%%%%%%%%%%%%%%%%%%%%%
U = [u_array(21) ; u_array(20) ; u_array(22)];
V = [v_array(21) ; v_array(20);  v_array(22)];
 
x = [ x_array(21) x_array(20)  x_array(22)] ;
y = [ y_array(21) y_array(20)  y_array(22)] ;

A = [1 x(1) y(1) ;...
     1 x(2) y(2) ;...
     1 x(3) y(3) ];
Final_Output35 = triangle_warp1(source_img,A,U,V,Final_Output34);

wp= Final_Output35;
end

