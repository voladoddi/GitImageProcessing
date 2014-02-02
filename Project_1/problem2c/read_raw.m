function I= read_raw(filename)
%readraw - read RAW format grey scale image of square size into matrix G
% Usage:	G = readraw(filename)

	disp(['	Retrieving Image ' filename ' ...']);
    
    % Get file ID for file
	 fid=fopen(filename,'rb');
        
     
	% Check if file exists
        if(fid==-1)
            error('cannot open');
            pause
        end
        
        
	% Get all the pixels from the image
        pixel=fread(fid,inf,'uchar');
              fclose(fid);
      
              % Calculate length/width of image
        [Y X ch]=size(pixel);
        Size=(Y*X);
          
        % Write pixels into matrix
        I(1:Size)=pixel(1:Size);
        
	% Transpose matrix, to orient it properly
        I=I';
        
end