%simply plots the exact fourier series for the heat equation
clear;
x = linspace(0,1,25);
t = linspace(0,2,25);
[X,T] = meshgrid(x,t);
E = -0.25*power(pi,2)*T;
F = (80/power(pi,2))*sin(pi/2)*(exp(E)).*(sin(pi*X));
for k = 2:5
   F = F + (1/k^2)*(80/power(pi,2))*sin(k*pi/2)*(exp(E*(k^2))).*(sin(k*pi*X));
end
surf(X,T,F);

