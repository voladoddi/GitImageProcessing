function special=special_effect(image1,image2,alpha,beta)


[m n]=size(image1);

for i=1:m
    for j=1:n
        result(i,j)=image1(i,j)+(alpha*image2(i,j))+beta;
    end
end
special=first_edge(result);

figure(8)
imshow(uint8(special));
end