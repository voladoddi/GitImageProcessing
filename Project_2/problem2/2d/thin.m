function thinned= thin(image)

F1=image;

tp=xlsread('spattern_con.xls','B15:AU23');
t=size(tp);

flag=true;
while flag
    Fhat1=zeros(size(F1));
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
        
         for szc=1:t(2)
                if pattern==tp(:,szc)
                    Fhat1(l,m)=1;
               end
          end
end
end

G1=zeros(size(Fhat1));

for j=2:442
for k=2:442
    
    if Fhat1(j,k)==0
        G1(j,k)=F1(j,k);
    elseif Fhat1(j,k)==1
        var=1;
        pattern_window=zeros(9,1);
             
                for win_w=(j-1):(j+1)
                for win_h=(k-1):(k+1)
                
                pattern_window(var)=Fhat1(win_w,win_h);
                var=var+1;
                end
                
                end
        M=uncon_mask(pattern_window);
                if M==1
                    G1(j,k)=F1(j,k);
                elseif M==0
                    G1(j,k)=0;
                end
    end
    
   
    
end
end

            if F1==G1
                flag=false;
            break;
                   
            else
                F1=G1;
% %           iteration=iteration+1;
% %           it=it+1;
            end
end
thinned=G1;
end