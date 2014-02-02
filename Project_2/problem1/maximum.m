function mx=maximum(image)
im=image;
[m n] =size(im);

max_=0;



for i=1:m
    for j=1:n
          
      if im(i,j)>max_
          max_=im(i,j);
       
      end
    end
   
end     

mx=max_;
end