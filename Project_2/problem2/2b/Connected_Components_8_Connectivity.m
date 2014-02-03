function [Out_Image, Labels ,List , Count_List] = Connected_Components_8_Connectivity( In_Image )
clc
% Finds the connected components in an image

Size_In_Image = size(In_Image);

Label_Image = zeros(Size_In_Image(1),Size_In_Image(2)); %% This Image will contain all the labeled components or its a label image

L = 1; %%% Start Label for the connected components in a binary image
V = 1; %%% The pixels with value V will only be marked
%%%%%Dealing with the first row which is the start 
if(In_Image(1,1))
    
    L = L + 1;
    Label_Image(1,1) = L;
end
    
for i = 2 : Size_In_Image(2)
   
    if(In_Image(1,i) == V && (In_Image(1,i) == In_Image(1, i - 1)))
        Label_Image(1,i) = Label_Image(1,i - 1);
    else if(In_Image(1,i) == V && (In_Image(1,i) ~= In_Image(1, i - 1)))
        L = L + 1;
        Label_Image(1,i) = L;
        end
    end
end

Equivalency_List = 40000*ones(10000, 4);

%%%%%  Dealing with rest of the other rows
Count_List = 1;
for i = 2 : Size_In_Image(1) - 1
    for j = 1 : Size_In_Image(2) - 1
        
        %%%%Handling the first element of each row
                if(j == 1    )
                    if(In_Image(i,j) == V)
                    if( ( In_Image(i,j) == In_Image(i - 1,j) ) )
                     Label_Image(i,j) = Label_Image(i - 1,j);
                    else
                        L = L + 1;
                        Label_Image(i,j) = L;
                    end
                    end
                
                else
                         %%%%%% Singles %%%%%%%
                        if( ( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1))  )
               
                             Label_Image(i,j) = Label_Image(i, j - 1);
               
                        end
           
                        %%%%%% Singles %%%%%%%
                        if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1)))
               
                         Label_Image(i,j) = Label_Image(i - 1,j - 1);
               
                        end
                        
                        %%%%%% Singles %%%%%%%
           
                        if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1)))
               
                             Label_Image(i,j) = Label_Image(i - 1,j);
                        end
                        
                        
                        %%%%%% Singles %%%%%%%
                        if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
               
                             Label_Image(i,j) = Label_Image(i - 1,j + 1);
                        end
                        
                        
                        %%%%%% Doubles %%%%%%%
                        
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1)))
                           if( Label_Image(i - 1,j - 1) == Label_Image(i, j - 1))
               
                               Label_Image(i,j) = Label_Image(i - 1,j - 1);
                           else
                              Max = max( Label_Image(i - 1,j - 1), Label_Image(i,j - 1));
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i - 1,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i,j - 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         
                         %%%%%% Doubles %%%%%%%
                         
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1)))
                           if( Label_Image(i,j - 1) == Label_Image(i - 1, j))
               
                               Label_Image(i,j) = Label_Image(i - 1,j);
                           else
                              Max = max( Label_Image(i,j - 1), Label_Image(i - 1,j));
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i ,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                        
                         %%%%%% Doubles %%%%%%%
                         
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
                           if( Label_Image(i,j - 1) == Label_Image(i - 1, j + 1))
               
                               Label_Image(i,j) = Label_Image(i - 1,j + 1);
                           else
                              Max = max( Label_Image(i - 1,j + 1), Label_Image(i,j - 1));
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i - 1,j + 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i,j - 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         
                         %%%%%% Doubles %%%%%%%
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1)))
                           if( Label_Image(i - 1,j - 1) == Label_Image(i - 1, j))
               
                               Label_Image(i,j) = Label_Image(i - 1,j - 1);
                           else
                              Max = max( Label_Image(i - 1,j - 1), Label_Image(i - 1,j));
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i - 1,j);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j - 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         
                         %%%%%% Doubles %%%%%%%
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
                           if( Label_Image(i - 1,j - 1) == Label_Image(i - 1, j + 1))
               
                               Label_Image(i,j) = Label_Image(i - 1,j + 1);
                           else
                              Max = max( Label_Image(i - 1,j + 1), Label_Image(i - 1,j - 1));
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i - 1,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j + 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         
                         %%%%%% Doubles %%%%%%%
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
                           if( Label_Image(i - 1,j) == Label_Image(i - 1, j + 1))
               
                               Label_Image(i,j) = Label_Image(i - 1,j + 1);
                           else
                              Max = max( Label_Image(i - 1,j + 1), Label_Image(i - 1,j));
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i - 1,j);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j + 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         %%%%%% Triples %%%%%%%
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1)))
                           if( Label_Image(i,j - 1) == Label_Image(i - 1, j - 1)  && Label_Image(i - 1, j - 1) == Label_Image(i - 1, j )  )
               
                               Label_Image(i,j) = Label_Image(i,j - 1);
                           else
                              Max = max( [Label_Image(i,j - 1), Label_Image(i - 1,j - 1), Label_Image(i - 1, j)]);
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i ,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j - 1);
                              Equivalency_List(Count_List, 3) = Label_Image(i - 1,j );
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         %%%%%% Triples %%%%%%%
                         
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
                           if( Label_Image(i,j - 1) == Label_Image(i - 1, j - 1)  && Label_Image(i - 1, j - 1) == Label_Image(i - 1, j + 1)  )
               
                               Label_Image(i,j) = Label_Image(i - 1,j + 1);
                           else
                              Max = max( [Label_Image(i,j - 1), Label_Image(i - 1,j - 1), Label_Image(i - 1, j + 1)]);
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i ,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j - 1);
                              Equivalency_List(Count_List, 3) = Label_Image(i - 1,j + 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         %%%%%% Triples %%%%%%%
                         
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
                           if( Label_Image(i - 1,j - 1) == Label_Image(i - 1, j)  && Label_Image(i - 1, j) == Label_Image(i - 1, j + 1)  )
               
                               Label_Image(i,j) = Label_Image(i - 1,j + 1);
                           else
                              Max = max( [Label_Image(i - 1,j - 1), Label_Image(i - 1,j), Label_Image(i - 1, j + 1)]);
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i - 1,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j);
                              Equivalency_List(Count_List, 3) = Label_Image(i - 1,j + 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         %%%%%% Triples %%%%%%%
                         
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
                           if( Label_Image(i,j - 1) == Label_Image(i - 1, j)  && Label_Image(i - 1, j) == Label_Image(i - 1, j + 1)  )
               
                               Label_Image(i,j) = Label_Image(i - 1,j + 1);
                           else
                              Max = max([ Label_Image(i,j - 1), Label_Image(i - 1,j), Label_Image(i - 1, j + 1)]);
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j);
                              Equivalency_List(Count_List, 3) = Label_Image(i - 1,j + 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         %%%%%% Triples %%%%%%%
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) == In_Image(i, j -1) )  && ( In_Image(i,j) == In_Image(i - 1, j - 1) ) && (In_Image(i,j) == In_Image(i - 1, j )) && (In_Image(i,j) == In_Image(i - 1, j + 1)))
                           if( Label_Image(i,j - 1) == Label_Image(i - 1, j - 1)  && Label_Image(i - 1, j - 1) == Label_Image(i - 1, j) && Label_Image(i - 1, j) == Label_Image(i - 1, j + 1)  )
               
                               Label_Image(i,j) = Label_Image(i - 1,j + 1);
                           else
                              Max = max( [Label_Image(i,j - 1), Label_Image(i - 1,j - 1), Label_Image(i - 1, j), Label_Image(i - 1, j + 1)]);
                              Label_Image(i,j) = Max;
                              Equivalency_List(Count_List, 1) = Label_Image(i,j - 1);
                              Equivalency_List(Count_List, 2) = Label_Image(i - 1,j - 1);
                              Equivalency_List(Count_List, 3) = Label_Image(i - 1,j);
                              Equivalency_List(Count_List, 4) = Label_Image(i - 1,j + 1);
                              Count_List = Count_List + 1;
                              
                           end

                         end
                         
                         
                         if(( In_Image(i,j) == V ) && ( In_Image(i,j) ~= In_Image(i, j -1) )  && ( In_Image(i,j) ~= In_Image(i - 1, j - 1) ) && (In_Image(i,j) ~= In_Image(i - 1, j )) && (In_Image(i,j) ~= In_Image(i - 1, j + 1)))
                             L = L + 1;
                             Label_Image(i,j) = L;
                         end
           
            
            
            
            
               end
              
    end
end


%%%%%%%%Second Pass to replace the equivalent labels

% for i = 1 : Size_In_Image(1)
%     for j = 1 : Size_In_Image(2)
%         
%         i
%         for k = 1 : Count_List - 1
%            
%             if(Label_Image(i,j) == Equivalency_List(k,1) || Label_Image(i,j) == Equivalency_List(k,2) || Label_Image(i,j) == Equivalency_List(k,3) || Label_Image(i,j) == Equivalency_List(k,4))
%                 Label_Image(i,j) = min([Equivalency_List(k,1),Equivalency_List(k,2),Equivalency_List(k,3),Equivalency_List(k,4) ]);
%             end
%         end
%     end
% end
% 

List = Equivalency_List;


Labels = L - Count_List;
Out_Image = Label_Image;
end
