% Broyden's Method (BM) with initial Jacobian approximation
% using Secant Method (SM)
% author: klysms
clc; clear; close all; % initialize IDE

% initial guess, tolerance, iteration, max iteration
X = [2 2]'; tol =1e-6; iter = 0; max_iter = 50;
% initial Jacobian approximation
% using known Jacobian
B = J(X);

% BROYDEN'S METHOD
while (err(X) > tol) && (iter < max_iter)
    s = -inv(B)*f(X);
    X1 = X + s;
    iter = iter + 1;
    y = f(X1)-f(X);
    X = X1;
    % Recompute and update the approximated B
    if abs(s'*s) > tol
        B = B + ((y-B*s)*s')/(s'*s);
    end
end

if iter < max_iter
    disp("Broyden's method")
    disp('x1 = '); disp(X(1)); disp('x2 = '); disp(X(2));
    disp('Error = '); disp(err(X)); disp('Iteration = ');
    disp(iter);
else
    disp("Broyden's method didn't converge")
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

% Jacobian matrix
function out = J(x)
x1 = x(1);
x2 = x(2);
out = [1, 2; 2*x1, 8*x2];
end