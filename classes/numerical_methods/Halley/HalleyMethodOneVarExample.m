% Halley Method (HM) to find the root of 
% a single function with one variable
% author: klysms
clc; clear; close all;  % initialize IDE

% initial guess, tolerance, max iteration
X0 = 1;
tol = 1e-6;
max_iter = 50;

% define variables
X = X0;
Xold = X0;

for iter = 1:max_iter
    f = func(X); g = gradient(X); h = hessian(X);
    X = X - 2*f*g/(2*g^2-f*h);
    err(:,iter) = abs(X-Xold);
    Xold = X;
    
    if (err(:,iter)<tol) % convergence
        fprintf('Converged to the root after %d iterations\n', iter);
        fprintf('x = %.4f, y = %.4f\n', X);
        fprintf('X error = %.15f\n', err(1,iter));
        break;
    end
end

% If method didnt converge
if iter == max_iter
    disp('Method didnt converge within max number of iterations');
end

function F = func(X)
x = X(1); F = x^2-x-1;
end

function g = gradient(X)
x = X(1); g = 2*x-1;
end

function h = hessian(X)
x = X(1); h = 2;
end