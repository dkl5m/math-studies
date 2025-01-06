% Newton-Raphson Method to find the root of a single equation
% author: klysms
clc; clear; close all;  % initialize IDE

% define function and its derivative
f = @(x) x^2 + 5*x + 6;
f_prime = @(x) 2*x + 5;

% initial guess, tolerance, max iteration
x0 = 2;
tol = 1e-6;
max_iter = 100;

% Newton-Raphson method
for iter = 1:max_iter
    x1 = x0 - f(x0)/f_prime(x0); % NR approximation
    
    if abs(x1 - x0) < tol % convergence
        fprintf('Converged to the root after %d iterations\n', iter);
        fprintf('Root = %.4f\n', x1);
        break;
    end

    x0 = x1; % Update approximation for next iteration
end

% If method didnt converge within the maximum number of iterations
if iter == max_iter
    disp('Method didnt converge within max number of iterations');
end