function m=variance(matrix)

input_matrix=matrix;

[m n]=size(input_matrix);

sum=0;
for i=1:m
    for j=1:n
        sum=sum+abs(input_matrix(i,j));
    end
end
m=sum/(m*n);
end
