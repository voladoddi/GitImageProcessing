%%%%%%%Single 4-Connected

function C = Single_4_Connection(Pixels)

c1 = (Pixels(8) == 2) && ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(6) && ~Pixels(7) &&~Pixels(9);
c2 = (Pixels(6) == 2) && ~Pixels(1) && ~Pixels(2) && ~Pixels(3) && ~Pixels(4) && ~Pixels(7) && ~Pixels(8) &&~Pixels(9);


if( c1 || c2)
    C = 1;
else
    C = 0;
end




end