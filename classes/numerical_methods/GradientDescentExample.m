% Gradient Descent Method (GD) to find the root of 
% a single function
% author: klysms
clc; clear; close all;  % initialize IDE

% initial guess, tolerance, max iteration
X0 = [1;-1];
tol = 1e-6;
max_iter = 50;
lambda = 0.5;

% define variables
X = X0;
Xold = X0;

for iter = 1:max_iter
    g = gradient(X);
    X = X - lambda*g;
    err(:,iter) = abs(X-Xold);
    Xold = X;
    
    if (err(:,iter)<tol) % convergence
        fprintf('Converged to the root after %d iterations\n', iter);
        fprintf('x = %.4f, y = %.4f\n', X(1), X(2));
        fprintf('X error = %.15f\n', err(1,iter));
        fprintf('Y error = %.15f\n', err(2,iter));
        break;
    end
end

% If method didnt converge
if iter == max_iter
    disp('Method didnt converge within max number of iterations');
end

function g = gradient(X)
x = X(1); y = X(2); % F(1,1) =  1/4*x^2 + y^2;
g = [1/2*x; 2*y];
end