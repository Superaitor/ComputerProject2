clear;
x = linspace(0,1,25);
t = linspace(0,2,25);
[X,T] = meshgrid(x,t);
E =pi*T;
F = (-(4*cos(pi))+4)/(power(pi,3))*(cos(E)).*(sin(pi*X));
for k = 2:5
   F = F + (-(4*cos(pi*k))+4)/(power(pi,3)*power(k,3))*(cos(E*k)).*(sin(pi*X));
end
surf(X,T,F);
