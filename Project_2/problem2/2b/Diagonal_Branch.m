function  C = Diagonal_Branch(Pixels)

C1 = (Pixels(2) == 2) && (Pixels(6) == 2) && (Pixels(7) == 2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(8);

C2 = (Pixels(2) == 2) && (Pixels(4) == 2) && (Pixels(9) == 2) && ~Pixels(1) && ~Pixels(6) && ~Pixels(8);

C3 = (Pixels(3) == 2) && (Pixels(4) == 2) && (Pixels(8) == 2) && ~Pixels(2) && ~Pixels(6) && ~Pixels(7);

C4 = (Pixels(1) == 2) && (Pixels(6) == 2) && (Pixels(8) == 2) && ~Pixels(2) && ~Pixels(4) && ~Pixels(9);

if(C1 || C2 || C3 || C4)
    C = 1;
else
    C = 0;
end




end