function mn=mean_(matrix)

input_matrix=matrix;

[m n]=size(input_matrix);

sum=0;
for i=1:m
    for j=1:n
        sum=sum+abs(input_matrix(i,j));
    end
end
mn=sum/(m*n);
end
