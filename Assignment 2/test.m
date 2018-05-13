clc;
clear all;
close all;
I=imread('image.jpg');
[mm nn oo] = size(I);

n = input('Enter the number of bin');
if(n>=1 && n<=256)
else
    n = 256;
end
figure()
imshow(I)
tic
% for color image calling histogram plot function and plotting histogram of each channel
if(oo==3)
  [bin_loc_R, bin_count_R,bin_loc_G, bin_count_G, bin_loc_B, bin_count_B]=histogram_plot(I,n);
end
time_taken_by_manual_function=toc
%  grayscale image
if(oo==1)
    [bin_loc, bin_count]=bins_calculation(I,n);
    figure();
    stem(bin_loc, bin_count)
end

%**********INBUILT FUNCTIONS******
% plotting histogram of color image using inbuilt function 'imhist'
tic
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
figure()
subplot(3,1,1)
imhist(R,n)
title('R channel using Inbuilt function')
subplot(3,1,2)
imhist(G,n)
title('G channel using Inbuilt function')
subplot(3,1,3)
imhist(B,n)
title('B channel using Inbuilt function')

% histogram equalization using 'histeq'
a=rgb2gray(I);
[Ie, trans]=histogram_equalization(a);
figure()
subplot(2,1,1)
histeq(Ie)
title('equalised image using inbulit fun')
g=a;
subplot(2,1,2)
imhist(g)
title('histogram of equalised image using inbulit fun')
time_taken_by_inbuilt_function=toc
