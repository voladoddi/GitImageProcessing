function interpol=interpolate(aaa,bbb,xx1,yy1,channel_number,image)

drew_young=image;


Pixel1= (1-aaa)*(1-bbb)*drew_young(xx1,yy1,channel_number)...
                        + (1-aaa)*bbb*drew_young(xx1,yy1,channel_number)...
                        + aaa*(bbb)*drew_young(xx1+1,yy1,channel_number)...
                        +   aaa*bbb*drew_young(xx1+1,yy1+1,channel_number);
                    
 interpol=Pixel1;
 
end
