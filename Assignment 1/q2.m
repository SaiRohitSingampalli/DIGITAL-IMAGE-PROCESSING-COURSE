count=0
xa = input('Enter X1');
ya = input('Enter Y1');
xb = input('Enter X2');
yb = input('Enter Y2');
M = input('Enter M');
N = input('Enter N');
n = input('Enter n');
V = zeros(n,1,1,'uint8');
for i=1:n
    V(i,1) = input('Enter the value in the range 120 to 255');
end
image = zeros(M,N,1,'uint8');
distancea = (((xa-xb)^2)+((ya-yb)^2))^0.5;
distanceb = abs(xa-xb)+abs(ya-yb);

if abs(xa-xb)>abs(ya-yb)
    distancec = abs(xa-xb);
else
    distancec = abs(ya-yb);
end


for i=1:M
    for j=1:N
        image(i,j) = round(120+(255-120)*rand(1));
    end
end

current =zeros(2,1);
current(1,1) = xa;
current(2,1) = ya;
while i>0
for j=1:n
if image(xa-1,ya)==V(j,1)
    count =count+1
    xa=xa-1;
    ya=ya;
    if xa==xb && ya==yb
        break
    else if image(xa+1,ya) ==V(j,1)
        count = count+1
        xa=xa+1
        ya=ya
        if xa==xb && ya==yb
                    break
        else if image(xa,ya+1)==V(j,1)
                count=count+1
                xa=xa
                ya=ya+1
                if xa==xb && ya==yb
                    break
            else if image(xa,ya-1)==V(j,1)
                    count =count+1
                    xa=xa
                    ya=ya-1
                     if xa==xb && ya==yb
                    break
                    
                    
                     
                    
                    
        
        
        

