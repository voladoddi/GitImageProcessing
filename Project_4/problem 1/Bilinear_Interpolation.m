function x=Bilinear_Interpolation(x_int,y_int,I11,I21,I12,I22,P)


%Bilinear_Interpolation')X1,I11=[x,y];X2,I21=[x+1,y];X12,I12=[x,y+1];X22,I22=[x+1,y+1];

x = I11 *(x_int + 1 - P(1))*(y_int + 1 - P(2)) + I21*(P(1) - x_int)*(y_int + 1 - P(2)) + I12 *(x_int + 1 - P(1))*(P(2) - y_int) + I22*(P(1) - x_int)*(P(2) - y_int);


end
