clear; close; clc;

x = [0 0.5 1.1 1.8 2.1 2.4 2.9 3.2 3.7 4.2 4.9 5.3 6.1 6.7 7];
y = [1.1 1.6 2.3 3.7 4.3 4.8 4.9 5.5 6.2 6.4 7.1 7.1 8.3 6.9 5.3];

plot(x,y,'mo-'), hold on

n = length(x);
pcoeff1 = polyfit(x,y,1); % polinomial fit 1 order
pcoeff2 = polyfit(x,y,2); % polinomial fit 2 order
pcoeffn = polyfit(x,y,n-1); % polinomial fit n order

xp = 0:0.1:7;
yp1 = polyval(pcoeff1,x);
yp2 = polyval(pcoeff2,x);
ypn = polyval(pcoeffn,n);

plot(x,yp1,'k',x,yp2,'g',x,ypn,'b')

E1 = sqrt(sum(abs(yp1-y).^2)/n)
E2 = sqrt(sum(abs(yp2-y).^2)/n)
En = sqrt(sum(abs(ypn-y).^2)/n)
