% MAIN
clc; clear; close all; % initialize IDE

% wanted position, max iteration, tolerance;
pos = [0.5 0.5 0.5]'; max_iter = 4000; tol = 1e-6;
% calculated position initialization;
x_init = [0.01 0.01 0.01]'; x = x_init;

% Broyden method
for iter = 1:max_iter
    funcError = f(x) - pos;
    B = J(x);

    if norm(funcError) < tol
        disp(['Convergiu após ', num2str(iter), ' iterações.']);
        disp(['theta1: ', num2str(x(1)), ' graus']);
        disp(['d2: ', num2str(x(2)), ' unidades']);
        disp(['d3: ', num2str(x(3)), ' unidades']);
        return;
    end
    
    if iter == max_iter
        disp("Broyden's method didn't converge");
    end
    
    delta_x = - B \ funcError;
    x1 = x + delta_x;
    y = f(x1) - funcError;
    x = x1;
    if abs(delta_x' * delta_x) > tol
        B = B + ((y - B * delta_x) * delta_x') / (delta_x' * delta_x);
    end
end

% FUNCTIONS
function out = f(x) % Forward Kinematics matrix
    theta1 = x(1); d2 = x(2); d3 = x(3);
    out = [- d3 * sin((pi * theta1) / 180);
             d3 * cos((pi * theta1) / 180);
                                0.10 + d2];
end

function out = J(x) % Jacobian matrix
    out = zeros(3); 
    del = 1e-6; 
    dx = del * eye(3);  % Identity matrix scaled by small perturbation
    
    for iter = 1:3
        % Compute the finite difference for each component
        out(:,iter) = (f(x + dx(:,iter)) - f(x - dx(:,iter))) / (2 * del);
    end
end