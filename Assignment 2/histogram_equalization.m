function [I, trans]=histogram_equalization(a)

[m n]= size(a);
b=a;
% freq will store frequency of each pixel
freq=zeros(256,1);
% fr will store frequency of equalized image
fr=zeros(256,1);
[m,n]=size(a);
% finding frequency of each pixel
for i=1:m
    for j=1:n
        p=a(i,j);
        freq(p+1,1)=freq(p+1,1)+1;
    end
end

% normalized will store normalised value(divinding freq by m*n) of each pixel 
normalized=zeros(256,1);
for i=1:256
    normalized(i,1)=freq(i,1)/(m*n);
end
% finding CDF of each pixel
d=zeros(256,1);
    for i=1:256
        d(i,1)=0;
        for k= 1:i
            d(i,1)=((normalized(k,1)+d(i,1)));
        end
    end
    
s=zeros(256,1);
% To findout Sk, multiplying cdf with L-1 or 255 and then rounding of the result
for i=1:256
    s(i,1)=round(255*d(i,1)); 
end
%  intensity transformation: replacing rk with sk
for i=1:m
    for j=1:n
        k=a(i,j);
        t=s(k+1,1);
        a(i,j)=t;
    end
end

I = a;
trans =s;

% finding frequency of each pixel in equalised image
for i=1:m
    for j=1:n
        p=I(i,j);
        fr(p+1,1)=fr(p+1,1)+1;
    end
end

% plotting original image and equalised image
figure();
subplot(2,2,1);
imshow(b);
title('original image');
subplot(2,2,2);
imshow(I)
title('equalised image');
%histogram of original image and histogram of equalised image
subplot(2,2,3);
stem(freq)
title('histogram of original image');
subplot(2,2,4);
stem(fr)
title('histogram of equalised image');

end