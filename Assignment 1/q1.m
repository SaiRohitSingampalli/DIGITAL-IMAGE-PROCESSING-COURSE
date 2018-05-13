M=input('Enter M');
N=input('Enter N');
n=input('Enter n');
b=input('Enter border');
ra = input('Enter r1');
rb = input('Enter r2');
Vf=input('Enter Vf');
Vb=input('Enter Vb');

image = 255 * ones(M,N,1,'uint8');
center = zeros(n,4);


counter=1;
i=1;
while i>0
   
   x =round((N)*rand(1));
   y =round((M)*rand(1));
   r =ra+round((rb-ra)*rand(1));
   v =Vf+round((Vb-Vf)*rand(1));
   
   count=0;
   if counter~=1
       
       for j=1:(counter-1)
           distFromPrevCircles =(((((center(j,1)-x)^2)+((center(j,2)-y)^2)))^0.5);
                if(distFromPrevCircles>(center(j,3)+r))
                    count = count+1;
                end
       end
   end
   if ((count==counter-1)||(counter == 1))&&(((x+r)<N)&&((y+r)<M)&&((x-r)>0)&&((y-r)>0))
       
      center(counter,1)=x;
      center(counter,2)=y;
      center(counter,3)=r;
      center(counter,4)=v;
      counter = counter+1;
   end
   if counter ==n+1
       break
   end
   
   
end
disp(size(image))

for ii=1:M
    for jj=1:N
        for kk=1:n
            distance = ((center(kk,1)-jj)^2+(center(kk,2)-ii)^2)^0.5;
            if distance < center(kk,3)
                image(ii,jj) = center(kk,4);
            end
        end
    end
end
finalimage = zeros(M+(2*b),N+(2*b),1,'uint8'); 
for iii=b+1:(M+b)
    for jjj=b+1:(N+b)
        finalimage(iii,jjj)=image(iii-b,jjj-b);
    end
end
imshow(finalimage)

    
