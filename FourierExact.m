%simply plots the exact fourier series for the heat equation
clear;
x = linspace(0,1,25);
t = linspace(0,2,25);
[X,T] = meshgrid(x,t);
E = -0.25*power(pi,2)*T;
F = (80/power(pi,2))*sin(pi/2)*(exp(E)).*(sin(pi*X));
surf(X,T,F);
