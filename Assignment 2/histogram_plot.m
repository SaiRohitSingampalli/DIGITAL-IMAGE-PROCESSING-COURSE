function [bin_loc_R, bin_count_R, bin_loc_G, bin_count_G, bin_loc_B, bin_count_B]=histogram_plot(I,n)

fre=zeros(256,1);
[k,l]=size(I);
% selecting R channel of color image and doing bin calculation
R = I(:,:,1);
[bin_loc_R, bin_count_R]=bins_calculation(R,n);

% selecting G channel of color image and doing bin calculation
G = I(:,:,2);
[bin_loc_G, bin_count_G]=bins_calculation(G,n);

% selecting B channel of color image and doing bin calculation
B = I(:,:,3);
[bin_loc_B bin_count_B]=bins_calculation(B,n);

% histogram plot for R channel
figure();
subplot(3,1,1)
stem(bin_loc_R, bin_count_R,'red')
title('R channel using manual function')

% histogram plot for G channel
subplot(3,1,2)
stem(bin_loc_G, bin_count_G,'green')
title('G channel using manual function')

% histogram plot for B channel
subplot(3,1,3)
stem(bin_loc_B, bin_count_B,'blue')
title('B channel using manual function')

% histogram plot for triplet
bin_loc_G = bin_loc_G + 1*ones(n,1);
bin_loc_B = bin_loc_B +2*ones(n,1);
figure();
stem(bin_loc_R, bin_count_R,'red')
hold on;
stem(bin_loc_B, bin_count_B,'blue')
hold on;
stem(bin_loc_G, bin_count_G,'green')
title('triplet using manual function')
end