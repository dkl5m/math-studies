% Spring-mass-damper system
clear; close; clc;

w = 2*pi;           % natural frequency
d = 0.25;           % damping ratio
A = [0 1;-w^2 -2*d*w];
% dot{x} = A*x

dt = 0.1;          % time step
T = 5;              % amount of time to integrate
x0 = [2; 0];        % initial condition (x=2; v=0);

% iterate forward Euler scheme
xF(:,1) = x0;       % state
tF(1) = 0;          % time
for k=1:T/dt
    tF(k+1) = k*dt;
    xF(:,k+1) = (eye(2) + dt*A)*xF(:,k);
end

% iterate Backward Euler scheme
xB(:,1) = x0;       % state
tB(1) = 0;          % time
for k=1:T/dt
    tB(k+1) = k*dt;
    xB(:,k+1) = inv(eye(2)-A*dt)*xB(:,k);
    % probably pre-compile inverse for efficiency
end

% compute better simulation using built-in Matlab integrator
% 4-th order Runge Kutta integrator
[t,xGood] = ode45( @(t,x) A*x, 0:dt:T, x0); % using function handle

% Plots
plot(tF,xF(1,:),'b'), xlabel('Time'), ylabel('Position'), grid % FE plot
hold on
plot(tB,xB(1,:),'g'), % BE plot
hold on
plot(t,xGood(:,1),'r') % RK4 plot
legend('Forward Euler','Backward Euler','ODE45 (RK4)')
hold off
