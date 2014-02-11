function outp=mean_shift(image,filter_window_dimension)

in=image;

out=zeros(size(in));


sigma_s=64;
sigma_r=64;

iter=1;
MAXITER=3;

ES=filter_window_dimension/2;


R=size(in,1);
C=size(in,2);


while (iter<=1)


  for l=1+ES:R-ES
  for m=1+ES:C-ES

     
            for win_w=-ES:ES
            for win_h=-ES:ES
                
                
                yi=in(l,m,:);
                
                    sum_w=0;
                    sum_nr=0;
                    
                dist= sqrt((l-(l+win_w))^2 + (m-(m+win_h))^2);
                first_exp= -((dist^2)/sigma_s); %spatial exponent
                
                   
                feat= yi-in(l+win_w,m+win_h,:);
                feat= sqrt((feat(1)^2) + (feat(2)^2) + (feat(3)^2));
                
                second_exp= -((feat^2)/sigma_r); %range exponent
                
                w_term=exp(first_exp)*exp(second_exp)*feat;
                sum_w= sum_w + w_term; %denominator of yi_k
                sum_nr = sum_nr + (in(l+win_w,m+win_h,:).*sum_w); %numerator of yi_k
                
                yi=sum_nr./sum_w;
                             
            end
            end
  out(l,m,:)=yi;          
  end
  end
  
 iter=iter+1;  
end
outp=out(1+ES:R-ES,1+ES:C-ES,:);

end