clc;
clear all;
close all;
I=imread('einstein.jpg');
[mm nn oo] = size(I);
% asking user to input no. of bins
n = input('Enter the number of bin');
if(n>=1 && n<=256)
    
else
    n = 256;
end

% if color image is there then calling histogram_RGB
%histogram_RGB(I,n) that will plot histogram of R, G ,B channel and triplet
if(oo==3)
  [bin_loc_R, bin_count_R,bin_loc_G, bin_count_G, bin_loc_B, bin_count_B]=histogram_plot(I,n);
end

% if input image is grayscale then calling then calling bins_calculation function plotting histogram 
if(oo==1)
    [bin_loc, bin_count]=bins_calculation(I,n);
    figure();
    stem(bin_loc, bin_count)
end

