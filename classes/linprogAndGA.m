clear; close; clc;

% linear programming
c = [-2;-1];
A = [1 8/3; 1 1; 2 0; -1 0; 0 -1];
b = [4 2 3 0 0];

[x,f,flag] = linprog(c,A,b)

% Genetic algorithm
x2 = 1:24;
y2 = [75 77 76 74 69 68 62 59 57 55 54 ...
    52 50 50 49 49 49 50 54 56 59 63 67 72];
plot(x2,y2,'ko');

m = 200;    % generations
n = 50;     % trials
n2 = 10;    % kept trials

A = 12 + randn(n,1);
B = pi/12 + randn(n,1);
C = 60 + randn(n,1);

for jgen = 1:m
    for j = 1:n
        E(j) = sum((A(j)*cos(B(j)*x2)+C(j)-y2).^2)
    end
    [Es,Ej] = sort(E); % sort from small to large
end