% Spring-mass-damper system
clear; close; clc;

w = 2*pi; % natural frequency
d = 0.25; % damping ratio

A = [0 1;
    -w^2 -2*d*w];
% dot{x} = A*x

dt = 0.01; % time step
T = 10;    % amount of time to integrate

x0 = [2; 0]; % initial condition (x=2; v=0);

% iterate forward Euler scheme

