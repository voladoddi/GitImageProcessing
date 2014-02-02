%to find the minimum intensity value element in the image
function mn=minimum(image)
im=image;
[m n] =size(im);

min_=256;



for i=1:m*n
          
      if im(i,1)<min_
          min_=im(i,1);
          
      end
      
   
end     

mn=min_;%returns the minimum intensity value value element
end