clear; close; clc;

x = [0 0.5 1.1 1.8 2.1 2.4 2.9 3.2 3.7 4.2 4.9 5.3 6.1 6.7 7];
y = [1.1 1.6 2.3 3.7 4.3 4.8 4.9 5.5 6.2 6.4 7.1 7.1 8.3 6.9 5.3];

plot(x,y,'mo-'), hold

n = length(x);
pcoeff1 = polyfit(x,y,1); % polinomial fit 1 order
pcoeff2 = polyfit(x,y,2); % polinomial fit 2 order

xp = 0:0.1:7;
yp1 = polyval(pcoeff1,xp);
yp2 = polyval(pcoeff2,xp);
yint = interp1(x,y,xp,'spline')

plot(xp,yp1,'k',xp,yp2,'g',xp,yint), hold off;

% E1 = sqrt(sum(abs(yp1-y).^2)/n)
% E2 = sqrt(sum(abs(yp2-y).^2)/n)

% polinomial fit for a lot of data will give bad results

x = [-3 -2.2 -1.7 -1.5 -1.3 -1.0 -0.8 -0.5 -0.25 -0.04 0.06 0.15 0.3 ...
    0.62 1.1 1.25 1.9 2.3];
y = [-0.2 0.1 0.05 0.17 0.35 0.9 1.2 1.4 1.7 2.1 2.0 1.7 1.5 1.2 0.7 ...
    0.25 -0.15 0.2];
plot(x,y,'ko'), hold

A = 1; B = 1;
coeff = fminsearch('gauss_fit',[A B],[],x,y);

A = coeff(1), B = coeff(2)

x2 = -3:0.1:3;
y2 = A*exp(-B*x2.^2);

plot(x2,y2,'m-'), hold off;
