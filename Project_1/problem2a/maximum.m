%to find the maximum intensity value element in the image
function mx=maximum(image)
im=image;
[m n] =size(im);

max_=0;



for i=1:m*n
          
      if im(i,1)>max_
          max_=im(i,1);
       
      end
      
   
end     

mx=max_; %returns the maximum value element
end