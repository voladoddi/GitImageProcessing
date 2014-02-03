function C = Check_Pixels(Pixels);


 
% S1_1 = [0 0 1;0 1 0;0 0 0];
% S1_2 = [1 0 0;0 1 0;0 0 0];
% S1_3 = [0 0 0;0 1 0;1 0 0];
% S1_4 = [0 0 0;0 1 0;0 0 1];
% 
% S2_1 = [0 1 0;0 1 0;0 0 0];
% S2_2 = [0 0 0;1 1 0;0 0 0];
% S2_3 = [0 0 0;0 1 1;0 0 0];
% S2_4 = [0 0 0;0 1 0;0 1 0];
%  
% S3_1 = [0 0 1;0 1 1;0 0 0];
% S3_2 = [0 1 1;0 1 0;0 0 0];
% S3_3 = [1 1 0;0 1 0;0 0 0];
% S3_4 = [1 0 0;1 1 0;0 0 0];
% S3_5 = [0 0 0;1 1 0;1 0 0];
% S3_6 = [0 0 0;0 1 0;1 1 0];
% S3_7 = [0 0 0;0 1 0;0 1 1];
% S3_8 = [0 0 0;0 1 1;0 0 1];





if(Pixels(5))
    
    
    c1 = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c2 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c3 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c4 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    
    c5 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c6 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c7 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c8 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    c9  = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c10 = ~Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c11 =  Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c12 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c13 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c14 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) && ~Pixels(9);
    c15 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c16 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    
    
    c17 = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    c18 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c19 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c20 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    c21 =  Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c22 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    c23 = ~Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c24 = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9);
    c25 = ~Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c26 =  Pixels(1) &&  Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c27 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) && ~Pixels(9);
    c28 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    c29 =  Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    c30 = ~Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9);
    
    
    c31 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c32 = ~Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    c33 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c34 =  Pixels(1) &&  Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c35 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) && ~Pixels(9);
    c36 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c37 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c38 = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    c39 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    c40 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c41 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c42 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    c43 = ~Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c44 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c45 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) && ~Pixels(9);
    c46 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    c47 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c48 = ~Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c49 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  &&  Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9);
    c50 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9);
    c51 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) && ~Pixels(9);
    c52 =  Pixels(1) &&  Pixels(2) && ~Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c53 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c54 = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) &&  Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    
    c55 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) && ~Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c56 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  &&  Pixels(6) &&  Pixels(7) && ~Pixels(8) &&  Pixels(9);
    c57 =  Pixels(1) &&  Pixels(2) &&  Pixels(3) &&  Pixels(4)  && ~Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    c58 =  Pixels(1) && ~Pixels(2) &&  Pixels(3) &&  Pixels(4)  &&  Pixels(6) &&  Pixels(7) &&  Pixels(8) &&  Pixels(9);
    
    
    C_1 = c1 || c2 || c3 || c4 || c5 || c6 || c7 || c8 || c9 || c10 || c11 || c12 || c13 || c14 || c15 || c16 || c17 || c18 || c19 || c20 || c21;
    C_2 = c22 || c23 || c24 || c25 || c26 || c27 || c28 || c29 || c30 || c31 || c32 || c33 || c34 || c35 || c36 || c37 || c38 || c39 || c40 || c41;
    C_3 = c42 || c43 || c44 || c45 || c46 || c47 || c48 || c49 || c50 || c51 || c52 || c53 || c54 || c55 || c56 || c57 || c58 ;
    
    
    
   if(C_1 || C_2 || C_3)    
    C = 2;
   else
       C = Pixels(5);
   end
else
    C = Pixels(5);
end
        
end