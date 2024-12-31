% Newton-Raphson Method (NR) to find the
% root of multiple equations

clc; clear; close all;  % initialize IDE

% initial guess, tolerance, max iteration
X0 = [1;1;1];
tol = 1e-6;
max_iter = 50;

% define variables
X = X0;
Xold = X0;

% Newton-Raphson method
for iter = 1:max_iter
    [F,J] = NRM(X);
    X = X - inv(J)*F;
    err(:,iter) = abs(X-Xold);
    Xold = X;

    if (err(:,iter)<tol) % convergence
        fprintf('Converged to the root after %d iterations\n', iter);
        fprintf('x = %.4f, y = %.4f, z = %.4f\n', X(1), X(2), X(3));
        fprintf('X error = %.15f\n', err(1,iter));
        fprintf('Y error = %.15f\n', err(2,iter));
        fprintf('Z error = %.15f\n', err(3,iter));
        break;
    end
end

% If method didnt converge
if iter == max_iter
    disp('Method didnt converge within max number of iterations');
end

function [F,J] = NRM(X)
x = X(1); y = X(2); z = X(3);
F(1,1) = x-y;
F(2,1) = 2*x-x*z-y;
F(3,1) = x*y-3*z;
J = [1,-1,0; 2-z,-1,-x; y,x,-3];
end