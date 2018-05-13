%classdef myClass < handle
    xa = input('Enter X1');
    ya = input('Enter Y1');
    xb = input('Enter X2');
    yb = input('Enter Y2');
    M = input('Enter M');
    N = input('Enter N');
    n = input('Enter no of elements in v');
    range = input('Enter the maximum value of pixel intensity');
    V = zeros(n,1,1,'uint8');


    for i=1:n
        V(i,1)=input('Enter');
    end

    image = zeros(M,N,1,'uint8');
    dummy = zeros(M,N,1,'uint8');
    distance = -1*ones(M,N);
    distance(xa,ya)=0;

    for i=1:M
       for j=1:N
           image(i,j) = round(range*(rand(1)));
       end 
    end

    for i=1:M
        for j=1:N
            for m=1:n
               if image(i,j)==V(m,1)
                  dummy(i,j)=1;
               end
            end
        end
    end


    counter = 0;
    distance=mpath(xa,ya,counter,distance,dummy,M,N);
    if distance(xb,yb)==-1
        
             disp('No path exists between the two given points')
        
    else
       disp('The mpath distance');
       disp(distance(xb,yb));
    end 

        



