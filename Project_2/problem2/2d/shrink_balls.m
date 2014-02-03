% %%%%%%to count point balls
% %%%%%%shrinking the balls until the small point balls are discovered

function shrunken=shrink_balls(image)
global count_arr ball_count

F1=image;
iteration=0; %to count number of iterations.
it=1;

sp=xlsread('spattern_con.xls','B3:BG11');
s=size(sp);
flag=true;

while flag
    Fhat=zeros(size(F1));
for l=2:442
for m=2:442

    var=1;
        pattern=zeros(9,1);
        for win_w=(l-1):(l+1)
            for win_h=(m-1):(m+1)
                pattern(var)=F1(win_w,win_h);
                var=var+1;
            end
        end
        
         for szc=1:s(2)
                if pattern==sp(:,szc)
                    Fhat(l,m)=1;
               end
          end
end
end

G=zeros(size(Fhat));

for j=2:442
for k=2:442
    
    if Fhat(j,k)==0
        G(j,k)=F1(j,k);
    elseif Fhat(j,k)==1
        var=1;
        pattern_window=zeros(9,1);
             
                for win_w=(j-1):(j+1)
                for win_h=(k-1):(k+1)
                
                pattern_window(var)=Fhat(win_w,win_h);
                var=var+1;
                end
                
                end
        M=uncon_mask(pattern_window);
                if M==1
                    G(j,k)=F1(j,k);
                elseif M==0
                    G(j,k)=0;
                end
    end
    
   
    
end
end

var=1;
count=0;

for x=2:442
    for y=2:442
            if G(x,y)==1 
            if (G(x-1,y-1)==0 && G(x,y-1)==0 && G(x+1,y-1)==0 && G(x-1,y)==0 && G(x+1,y)==0 && G(x-1,y+1)==0 && G(x,y+1)==0 && G(x+1,y+1)==0)
                  count=count+1;
            end
            end
         
    end
end

        
       count_arr(it)=count; 
       if count_arr(it)>0
           break;
       end
       count=0;   
       it=it+1;
       
        if F1==G 
           flag=false;
            break;
           
        
        else
          F1=G;
          iteration=iteration+1;
          it=it+1;
        end
end
ball_count=count;
shrunken=G;
end
