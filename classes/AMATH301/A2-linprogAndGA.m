clear; close; clc;

% linear programming
c = [-2;-1];
A = [1 8/3; 1 1; 2 0; -1 0; 0 -1];
b = [4 2 3 0 0];

[x,y,flag] = linprog(c,A,b)

%% Genetic algorithm
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
    
    % plot(E), pause(0.5);

    [Es,Ej] = sort(E); % sort from small to large

    Ak1 = A(Ej(1:n2));
    Bk1 = B(Ej(1:n2));
    Ck1 = C(Ej(1:n2));

    Ak2 = Ak1 + rand(n2,1)/jgen;
    Bk2 = Bk1 + rand(n2,1)/jgen;
    Ck2 = Ck1 + rand(n2,1)/jgen;

    Ak3 = Ak1 + rand(n2,1)/jgen;
    Bk3 = Bk1 + rand(n2,1)/jgen;
    Ck3 = Ck1 + rand(n2,1)/jgen;
    
    Ak4 = Ak1 + rand(n2,1)/jgen;
    Bk4 = Bk1 + rand(n2,1)/jgen;
    Ck4 = Ck1 + rand(n2,1)/jgen;

    Ak5 = Ak1 + rand(n2,1)/jgen;
    Bk5 = Bk1 + rand(n2,1)/jgen;
    Ck5 = Ck1 + rand(n2,1)/jgen;

    A = [Ak1; Ak2; Ak3; Ak4; Ak5];
    B = [Bk1; Bk2; Bk3; Bk4; Bk5];
    C = [Ck1; Ck2; Ck3; Ck4; Ck5];

end

Ak1 = A(Ej(1));
Bk1 = B(Ej(1));
Ck1 = C(Ej(1));

f = Ak1*cos(Bk1*x2)+Ck1;
plot(x2,y2,'ko',x2,f,'r');