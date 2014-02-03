function mn=minimum(image)
im=image;
[m n] =size(im);

min_=256;



for i=1:m
    for j=1:n
          
      if im(i,1)<min_
          min_=im(i,j);
          
      end
    end
   
end     

mn=min_;
end