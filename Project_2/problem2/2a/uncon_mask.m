function match_uncond=uncon_mask(array)

x=array;

p1= (~x(1)&&~x(2)&&~x(4)&&~x(6)&&~x(7)&&~x(8)&&~x(9))    &&   x(3);
p2= x(1)&&(~x(2)&&~x(3)&&~x(4)&&~x(6)&&~x(7)&&~x(8)  &&     ~x(9));
p3= (~x(1)&&~x(2)&&~x(3)&&~x(4)&&~x(6)&&~x(7)&&~x(9)) &&     x(8);
p4=(~x(1)&&~x(2)&&~x(3)&&~x(4)&&~x(7)&&~x(8)&&~x(9)) &&     x(6);

p5=(~x(1)&&~x(2)&&~x(4)&&~x(7)&&~x(8)&&~x(9))  &&  (x(3)&&x(6));
p6= (x(2)&& x(3))   &&     (~x(1)&&~x(4)&&~x(6)&&~x(7)&&~x(8)&&~x(9));
p7= (x(1)&& x(2))   &&     (~x(3)&&~x(4)&&~x(6)&&~x(7)&&~x(8)&&~x(9));
p8= (x(1)&& x(4))   &&     (~x(2)&&~x(3)&&~x(6)&&~x(7)&&~x(8)&&~x(9));

p9= (x(4)&& x(7))  &&    (~x(1)&&~x(2)&&~x(3)&&~x(6)&&~x(8)&&~x(9));
p10=(x(7)&& x(8))   &&     (~x(1)&&~x(2)&&~x(3)&&~x(4)&&~x(6)&&~x(9));
p11= (x(8)&& x(9))  &&     (~x(1)&&~x(2)&&~x(3)&&~x(4)&&~x(6)&&~x(7));
p12= (x(6)&& x(9))  &&    (~x(1)&&~x(2)&&~x(3)&&~x(4)&&~x(7)&&~x(8));

p13=(x(2)&& x(3)&&x(4))  && (~x(1)&&~x(6)&&~x(7)&&~x(8)&&~x(9));
p14=(x(2)&& x(1)&&x(6))  && (~x(3)&&~x(4)&&~x(7)&&~x(8)&&~x(9));

p15=(x(2)&& x(6)&&x(9))  && (~x(1)&&~x(3)&&~x(7)&&~x(8)&&~x(4));
p16=(x(3)&& x(6)&&x(8))  && (~x(1)&&~x(2)&&~x(7)&&~x(9)&&~x(4));


p17= (x(2)||x(6))   &&  (x(3)&&x(7)) && (~x(1)&&~x(4)&&~x(8)&&~x(9));
p18= (x(2)||x(4))   &&  (x(1)&&x(9)) && (~x(3)&&~x(6)&&~x(7)&&~x(8));
p19= (x(4)||x(8))   &&  (x(3)&&x(7)) && (~x(1)&&~x(2)&&~x(6)&&~x(9));
p20= (x(8)||x(6))   &&  (x(1)&&x(9)) && (~x(2)&&~x(4)&&~x(3)&&~x(7));

p21= x(1)&&x(2)&&x(4);

p22= (~x(3)&&~x(8)&&~x(9))  && (x(2)&&x(4)&&x(6));
p23= (~x(1)&&~x(7)&&~x(8))  && (x(2)&&x(4)&&x(6));
p24= (~x(1)&&~x(2)&&~x(7))  && (x(8)&&x(4)&&x(6));
p25= (~x(3)&&~x(2)&&~x(9))  && (x(8)&&x(4)&&x(6));

p26= (~x(6)&&~x(7)&&~x(9))  && (x(2)&&x(4)&&x(8));
p27= (~x(3)&&~x(1)&&~x(6))  && (x(2)&&x(4)&&x(8));
p28= (~x(1)&&~x(3)&&~x(4))  && (x(2)&&x(6)&&x(8));
p29= (~x(4)&&~x(7)&&~x(9))  && (x(2)&&x(6)&&x(8));

p30= (x(1)&&x(3))  &&  (x(7)||x(8)||x(9));
p31= (x(1)&&x(7))  &&  (x(3)||x(6)||x(9));
p32= (x(7)&&x(9))  &&  (x(1)||x(2)||x(3));
p33= (x(3)&&x(9))  &&  (x(1)||x(4)||x(7));

p34= (x(2)&&x(6)&&x(7))     &&      (~x(3)&&~x(4)&&~x(8));
p35= (x(2)&&x(4)&&x(9))     &&      (~x(1)&&~x(6)&&~x(8));
p36= (x(3)&&x(4)&&x(8))     &&      (~x(2)&&~x(6)&&~x(7));
p37= (x(1)&&x(6)&&x(8))     &&      (~x(2)&&~x(4)&&~x(9));

if p1||p2||p3||p4||p5||p6||p7||p8||p9||p10||p11||p12||p13||p14||p15||p16||p17||p18||p19||p20||p21||p22||p23||p24||p25||p26||p27||p28||p29||p30||p31||p32||p33||p34||p35||p36||p37
    match_uncond=1;
else
    match_uncond=0;
end


end
