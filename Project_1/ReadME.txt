POOJA VOLADODDI


1)  Programming Platform Used
-- All source code was created in MATLAB R2011b

2) Operating System
-- Windows 7, 64-bit


3) How to run the source codes

--The folder 'Project_1' contains each problem in a separate folder like below
 Problem1a_1c
 Problem2a
 Problem2b ... and so on.

--Open each folder-----> double click on 'main.m' ---------> type 'main' in MATLAB Command Window after MATLAB opens------> press 'Enter'

-------------------------------------------------------------
IMPORTANT- 
--------------------------------------------------------------
1)please paste the input image .RAW files inside the particular problem folder which you're running .
2)all the OUTPUT RAW files are NOT displayed in MATLAB. They will have to be viewed on ImageJ. The images will be accessible in the same directory as the source code.
3)In most of the problems, the code (or the function "main.m" ) has to be run again for different functions as multiple functions have been written to the SAME OUTPUT IMAGE RAW file.
-------------------------------------------------------------
For 

1) problems 1a -1c

 Input image = shapes.raw
 Functions that use it = extract_shape.m ; Identify_shape.m ; histogram.m
 output image = output_shapes.raw    //output for all the functions

2) problem2a -

Input images = barbara_bright.raw, barbara_dark.raw, barbara_mid.raw
Functions= read_raw.m ; histogram.m ; maximum.m ; minimum.m ; main.m ; cum_hist.m
Output images = out_contraststretched.raw -----//full scale linear ranging output
 	             cumulative_histogram.raw----//equalised histogram output

3)problem2b

Input image= ocean_contrast.raw
Functions that use it = main.m ; read_raw.m ; histogram.m ; equalized_histogram.m
Output images = 2b_eqCumHist.raw     // for equalized cumulative histogram implementation
	            equalized_hist.raw     // for bucket filling method implementation of equalised histogram

4)problem2c

Input image= barbara_contrast.raw
Functions that use it= read_raw.m ; main.m ; histogram.m ; input_histo_cdf.m  
Output image=  2c_output.raw

5)problem3a

Input image= peppers_mix.raw
functions that use it= read_raw.m ;  histogram.m ;  main.m ;  average_filter.m ;  average_wt_filter.m;  average_filter_5.m; median_filter.m ; median_filter_5.m
Output_image= filtered_output.raw   //please note that the "main.m" has to be called several times from MATLAB command window to observe the output image for each filter implementation separately.                                 