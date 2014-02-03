function [Cor1 Cor2 Cor3]= Corner_Masking(Pixels)


C1 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 
C2 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4) && ~Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 
C3 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4) &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9); 
C4 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) &&  Pixels(4) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9); 

C5 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) &&  Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9); 
C6 = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) &&  Pixels(4) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9); 
C7 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(6) &&  Pixels(7) && ~Pixels(8) &&  Pixels(9); 
C8 =  Pixels(1) && ~Pixels(2) &&  Pixels(3) && ~Pixels(4) && ~Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 


C9  = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) &&  Pixels(4) &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 
C10 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) &&  Pixels(4) &&  Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9); 
C11 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4) &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 
C12 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) &&  Pixels(4) && ~Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 


C13 =  Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) &&  Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 
C14 = ~Pixels(1) && ~Pixels(2) &&  Pixels(3) &&  Pixels(4) && ~Pixels(6) && ~Pixels(7) &&  Pixels(8) && ~Pixels(9); 
C15 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) && ~Pixels(4) &&  Pixels(6) &&  Pixels(7) && ~Pixels(8) && ~Pixels(9); 
C16 = ~Pixels(1) &&  Pixels(2) && ~Pixels(3) &&  Pixels(4) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) &&  Pixels(9); 



Cor1 = C1 || C2 || C3 || C4 || C13 || C14 || C15 || C16;
Cor2 = C5 || C6 || C7 || C8 ;
Cor3 = C9 || C10 || C11 || C12;

end