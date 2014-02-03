function energy = en_compute(matrix,extended_size)

input_matrix=matrix;
output_matrix=zeros(size(input_matrix));

ES=extended_size/2;
ESZ=extended_size;

R=size(input_matrix,1);
C=size(input_matrix,2);

for l=1+ES:R-ES
for m=1+ES:C-ES

  sum=0;
        for win_w=-ES:ES
            for win_h=-ES:ES
                sum =sum + (input_matrix(l+win_w,m+win_h))^2;
               
            end
        end
   
output_matrix(l,m)=sum;         
         
end
end
energy=output_matrix(1+ES:R-ES,1+ES:C-ES);
end