function C = Tee_Brach(Pixels)


C1 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(6) == 2) && ~Pixels(3) && ~Pixels(8) && ~Pixels(9);
C2 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(6) == 2) && ~Pixels(1) && ~Pixels(7) && ~Pixels(8);
C3 = (Pixels(4) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2) && ~Pixels(1) && ~Pixels(2) && ~Pixels(7);
C4 = (Pixels(4) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2) && ~Pixels(2) && ~Pixels(3) && ~Pixels(9);
C5 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(8) == 2) && ~Pixels(6) && ~Pixels(7) && ~Pixels(9);
C6 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(8) == 2) && ~Pixels(1) && ~Pixels(3) && ~Pixels(6);
C7 = (Pixels(2) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2) && ~Pixels(1) && ~Pixels(3) && ~Pixels(4);
C8 = (Pixels(2) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2) && ~Pixels(4) && ~Pixels(7) && ~Pixels(9);

if(C1 || C2 || C3 || C4 || C5 || C6 || C7 || C8 )
    C = 1;
else
    C = 0;
end


end