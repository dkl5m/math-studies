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

% iterate forward Euler scheme
xF(:,1) = x0;       % state
tF(1) = 0;          % time
for k=1:T/dt
    tF(k+1) = k*dt;
    xF(:,k+1) = (eye(2) + dt*A)*xF(:,k);
end

subplot(2,2,1), plot(tF,xF(1,:)), xlabel('Time'),
ylabel('Position'), grid
subplot(2,2,2), plot(xF(1,:),xF(2,:)), xlabel('Position'),
ylabel('Velocity'), grid
subplot(2,2,3), plot3(tF,xF(1,:),xF(2,:)), xlabel('Time'),
ylabel('Position'), zlabel('Velocity'), grid

% Forward Euler with big dt is unstable, and explode to infinite
% Change dt to dt=0.1 and see the difference