function I= read_raw(filename)
global Mlen Nlen ch_no
%open a file and create file ID
fid=fopen(filename,'rb');
        
        if(fid==-1) %error . file doesn't exist
            error('cannot open');
            pause
        end
        
        %read data into pixel
        pixel=fread(fid,inf,'uchar');
              fclose(fid);
              
        [Mlen Nlen ch_no]=size(pixel);
        Size=(Mlen*Nlen*ch_no);
          
        % put into matrix form
        I(1:Size)=pixel(1:Size);
        I=I';
        
end