% Generalized Halley Method (HM) for multiple functions with 
% multiple variables
% author: klysms
clc; clear; close all; % initialize IDE

% initial guess, tolerance, iteration, max iteration
X = [2 2]'; tol =1e-6; iter = 0; max_iter = 50;

% GENERALIZED HALLEY METHOD
while (err(X) > tol) && (iter < max_iter)
    a = -inv(J(X))*f(X);
    a2 = a.*a;
    b = 0.5*inv(J(X))*H(X)*a2;
    X = X + a2./(a+b);
    iter = iter + 1;
end

if iter < max_iter
    disp("Generalized Halley method")
    disp('x1 = '); disp(X(1)); disp('x2 = '); disp(X(2));
    disp('Error = '); disp(err(X)); disp('Iteration = ');
    disp(iter);
else
    disp("Method didn't converge")
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

% Hessian matrix
function out = H(x)
x1 = x(1);
x2 = x(2);
out = [0, 0; 2, 8];
end