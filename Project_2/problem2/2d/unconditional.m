%%%%%Unconditional Marking

function C = unconditional(Pixels)


c1 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && (Pixels(9) == 2);
c2 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(6) &&  (Pixels(7) == 2) && ~Pixels(8) && ~Pixels(9);
c3 = ~Pixels(1) && ~Pixels(2) && (Pixels(3) == 2) && ~Pixels(4) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
c4 = (Pixels(1) == 2) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);

c5 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(6) && ~Pixels(7) && (Pixels(8) == 2) && ~Pixels(9);
c6 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && (Pixels(6) == 2) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
c7 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && (Pixels(4) == 2) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
c8 = ~Pixels(1) && (Pixels(2) == 2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);

c9  = ~Pixels(1) && (Pixels(2) == 2) && ~Pixels(3) && ~Pixels(4) && (Pixels(6) == 2) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
c10 = ~Pixels(1) && (Pixels(2) == 2) && ~Pixels(3) && (Pixels(4) == 2) && ~Pixels(6) && ~Pixels(7) && ~Pixels(8) && ~Pixels(9);
c11 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && (Pixels(6) == 2) && ~Pixels(7) && (Pixels(8) == 2) && ~Pixels(9);
c12 = ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && (Pixels(4) == 2) && ~Pixels(6) && ~Pixels(7) && (Pixels(8) == 2) && ~Pixels(9);

c13 = (Pixels(1) == 2) && (Pixels(2) == 2) && (Pixels(4) == 2);
c14 = (Pixels(4) == 2) && (Pixels(8) == 9) && (Pixels(9) == 2);


c15 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(6) == 2);
c16 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(8) == 2);
c17 = (Pixels(4) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2);
c18 = (Pixels(2) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2);


c19 = (Pixels(1) == 2) && (Pixels(3) == 2) &&  (Pixels(7) ||  Pixels(8) ||  Pixels(9));
c20 = (Pixels(1) == 2) && (Pixels(7) == 2) &&  (Pixels(9) ||  Pixels(6) ||  Pixels(3));
c21 = (Pixels(7) == 2) && (Pixels(9) == 2) &&  (Pixels(3) ||  Pixels(2) ||  Pixels(1));
c22 = (Pixels(3) == 2) && (Pixels(9) == 2) &&  (Pixels(1) ||  Pixels(4) ||  Pixels(7));

c23 = (Pixels(2) == 2) && (Pixels(6) == 2) && (Pixels(7) == 2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(8);
c24 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(9) == 2) && ~Pixels(1) && ~Pixels(6) && ~Pixels(8);
c25 = (Pixels(3) == 2) && (Pixels(4) == 2) && (Pixels(8) == 2) && ~Pixels(2) && ~Pixels(6) && ~Pixels(7);
c26 = (Pixels(1) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2) && ~Pixels(2) && ~Pixels(4) && ~Pixels(9);

C_1 = c1 || c2 || c3 || c4 || c5 || c6 || c7 || c8 || c9 || c10 || c11 || c12 || c13;
C_2 = c14 || c15 || c16 || c17 || c18 || c19 || c20 || c21 || c22 || c23 || c24 || c25 || c26;

if(C_1 || C_2) 
    C = 1;
else
    C = 0;






end