% Spring-mass-damper system
clear; close; clc;

w = 2*pi;           % natural frequency
d = 0.25;           % damping ratio

A = [0 1;
    -w^2 -2*d*w];
% dot{x} = A*x

dt = 0.01;          % time step
T = 10;             % amount of time to integrate

x0 = [2; 0];        % initial condition (x=2; v=0);

% iterate Backward Euler scheme
xB(:,1) = x0;       % state
tB(1) = 0;          % time
for k=1:T/dt
    tB(k+1) = k*dt;
    xB(:,k+1) = inv(eye(2)-A*dt)*xB(:,k);
    % probably pre-compile inverse for efficiency
end

subplot(2,2,1), plot(tB,xB(1,:)), xlabel('Time'),
ylabel('Position'), grid
subplot(2,2,2), plot(xB(1,:),xB(2,:)), xlabel('Position'),
ylabel('Velocity'), grid
subplot(2,2,3), plot3(tB,xB(1,:),xB(2,:)), xlabel('Time'),
ylabel('Position'), zlabel('Velocity'), grid

% Backward Euler with big dt is still stable
% Change dt to dt=0.1 and see the difference