function E = gauss_fit(x0,x,y)
A = x0(1); B = x0(2);

% least square fit error
E = sum((A*exp(-B*x.^2)-y).^2);
end