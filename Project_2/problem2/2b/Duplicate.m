function D = Duplicate(Temp_Sum, Temp_Diff,Count_List)

 Duplicate = 0;
for i = 1 : (Count_List - 1) - 1
    
   if(Temp_Sum(i) == Temp_Sum(i+1) && Temp_Diff(i) == Temp_Diff(i + 1) && (Temp_Sum(i) ~= 0 || Temp_Diff(i) ~=0))
       Duplicate = Duplicate  + 1;
   end
    
    
end


D = Duplicate;
end