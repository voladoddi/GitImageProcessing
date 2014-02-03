%%%%%Corner Cluster 


function C = Cornet_Cluster(Pixels)


C = (Pixels(1) == 2) && (Pixels(2) == 2) && (Pixels(4) == 2);


if( C == 1 )
    C = 1;
else C = 0;

end