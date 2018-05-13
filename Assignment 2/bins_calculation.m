function [bin_loc, bin_count]=bins_calculation(I,n)

% condition for dividing 256 in no of bins
if(mod(256,n-1)~=0)
    n1=256- mod(256,n-1);
    n2 = n1/(n-1);
else
    n2 = 256/n;
end

fre=zeros(256,1);
[k,l]=size(I);
% calculating  frequency of all pixels
for i=1:k
    for j=1:l
        p=I(i,j);
        fre(p+1,1)=fre(p+1,1)+1;
    end
end
% bin have four columns bin interval,bin location ,bin count
bin=zeros(n,4);
bin(1,1)=0;
% code for finding bin interval range for each bin
for i=1:256
    if(i==1)
        bin(i,1)=0;
    else
         bin(i,1)=bin(i-1,2)+1; 
         
    end
    if(i==n)
       bin(i,2)=255;
       break;
    else
        bin(i,2)=bin(i,1)+n2-1;
       
    end
end
% counting no of bin count in each bin interval
j=1;
for i=1:256
    bin(j,3) = fre(i,1)+bin(j,3); 
    if(i==bin(j,2)+1)
        j=j+1;
    end
end
% this finds bin location of each bin interval
for i=1:n
    bin(i,4)=round((bin(i,1)+bin(i,2))/2);   
bin_loc=bin(:,4);
bin_count=bin(:,3);
end