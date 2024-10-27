clear; close; clc;

a = 0; b = 10;
dxf = 0.01;
xf = a:dxf:b;
yf = sin(xf);
plot(xf,yf,'b')

dxc = 0.1;  % course
% smaller dxc is, better the result
xc = a:dxc:b;
yc = sin(xc);
hold on
stairs(xc,yc,'r')

n = length(xc);

% integrate
% left-rectangle rule
area1 = 0;
for i=1:n-1
    area1 = area1 + yc(i)*dxc;
end
area1

% right-rectangle rule
area2 = 0;
for i=1:n-1
    area2 = area2 + yc(i+1)*dxc;
end
area2

% trapezoid rule
area3 = 0;
for i=1:n-1
    area3 = area3 + (dxc/2)*(yc(i)+yc(i+1));
end

% let's compute without for loops
area1 = sum(yc(1:end-1))*dxc;
area2 = sum(yc(2:end))*dxc;
area3 = trapz(xc,yc)

% let's compute without for loops and fine grid
area1f = sum(yf(1:end-1))*dxf;
area2f = sum(yf(2:end))*dxf;
area3f = trapz(xf,yf)

% Simpson's rule with matlab quad
area4 = quad(@(x)sin(x),a,b)
% quad not recommended
area4f = integral(@(x)sin(x),a,b)