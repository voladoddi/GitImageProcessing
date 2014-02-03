function energy = energy_compute(matrix,extended_size)

input_matrix=matrix;
output_matrix=zeros(size(input_matrix));

ES=extended_size/2;
ESZ=extended_size;

R=size(input_matrix,1);
C=size(input_matrix,2);

for l=1+ES:R-ES
for m=1+ES:C-ES

    var=1;
        pattern=zeros(ESZ+1*ESZ+1,1);
        for win_w=(l-ES):(l+ES)
            for win_h=(m-ES):(m+ES)
                pattern(var)=input_matrix(win_w,win_h);
                var=var+1;
            end
        end
        sum=0;
        
         for sz=1:size(pattern)
               sum=sum+abs(pattern(sz));
         end
output_matrix(l,m)=sum;         
         
end
end

energy=output_matrix(1+ES:R-ES,1+ES:C-ES);
end
