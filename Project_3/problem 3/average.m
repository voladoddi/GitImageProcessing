function avg=average(array_3d)

input_array=array_3d;

sum=0;
s=size(input_array);


for k=1:9
    sum=0;
    for i=1:s(1)
        for j=1:s(2)
            sum=sum+abs(input_array(i,j,k));
            
        end
    end
   
    avg(k,:)=sum/(s(1)*s(2));
end



