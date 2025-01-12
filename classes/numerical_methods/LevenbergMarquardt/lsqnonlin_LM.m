clc;clear;close all;
% Example target vector (replace with actual target values)
x_target = [1; 1; 1];  % Example target, replace as needed

% Initial guess for the parameters [theta1, d2, d3]
initial_guess = [0, 0.1, 0.1];

% Set options for lsqnonlin to use Levenberg-Marquardt
options = optimoptions('lsqnonlin', 'Algorithm', 'levenberg-marquardt', 'Display', 'iter');

% Call lsqnonlin to solve the nonlinear least squares problem
[optimized_params, resnorm, residual, exitflag, output] = lsqnonlin(@(params) residuals(params, x_target), initial_guess, [], [], options);

% Display the optimized parameters
disp('Optimized Parameters:');
disp(optimized_params);

% Define the residual function for least squares
function res = residuals(params, x_target)
    % Extract the parameters
    theta1 = params(1);
    d2 = params(2);
    d3 = params(3);
    
    % Model equation
    f1 = -d3 * sind(theta1);  % f1 = -d3 * sin(theta1 in degrees)
    f2 = d3 * cosd(theta1);   % f2 = d3 * cos(theta1 in degrees)
    f3 = 0.10 + d2;           % f3 = 0.10 + d2
    
    % Return the residuals (difference between model and target)
    res = [f1; f2; f3] - x_target;
end
