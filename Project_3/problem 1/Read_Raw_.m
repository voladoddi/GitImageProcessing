%%% Read the raw Image Data in a column vector
function Im = Read_Raw_(filename,ht,wt)


fid = fopen(filename,'r');
pixel = fread(fid, inf, 'uint8'); %%% Total Pixels are in this variable
fclose(fid);

Size_Pixel = size(pixel);
Image_Formed = zeros(ht, wt);
row_count = 1;
column_count = 1;

for  i = 1 : 3 : Size_Pixel(1) - 2
    
    Image_Formed(row_count,column_count,1) = pixel(i,1);
    Image_Formed(row_count,column_count,2) = pixel(i+1,1);
    Image_Formed(row_count,column_count,3) = pixel(i+2,1);
    column_count = column_count + 1;
    if(mod(column_count,wt) == 1)
        row_count = row_count + 1;
        column_count = 1;
    end
end
    Im = Image_Formed;
end