% Secant Method (SM) for multiple functions with multiple
% variables
% author: klysms
clc; clear; close all; % initialize IDE

% initial guess, tolerance, iteration, max iteration
X = [2 2]'; tol =1e-6; iter = 0; max_iter = 50;

% SECANT METHOD
while (err(X) > tol) && (iter < max_iter)
    s = -inv(Jnumerical(X))*f(X);
    X = X + s;
    iter = iter + 1;
end

if iter < max_iter
    disp("Secant method")
    disp('x1 = '); disp(X(1)); disp('x2 = '); disp(X(2));
    disp('Error = '); disp(err(X)); disp('Iteration = ');
    disp(iter);
else
    disp("Secant method didn't converge")
end

% FUNCTIONS
% error function
function outerr = err(x)
out = f(x);
outerr = out(1)^2+out(2)^2;
end

% function's vector
function out = f(x)
x1 = x(1);
x2 = x(2);
out = [x1+2*x2-2; x1^2+4*x2^2-4];
end

% Numerical Jacobian matrix
function out = Jnumerical(x)
out = zeros(2,2);
del = 1e-6;
dx = [del 0; 0 del];
out(:,1) = (f(x+dx(:,1))-f(x-dx(:,1)))/(2*del);
out(:,2) = (f(x+dx(:,2))-f(x-dx(:,2)))/(2*del);
end