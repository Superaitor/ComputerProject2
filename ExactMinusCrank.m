#plots the graph of the exact solution minus the solution obtained by the Crank-Nicolson method
clear 
L=1;
dx=0.1;
imax=L/dx+1;
X=linspace(0,L,imax);
X2=linspace(0,L,imax);
% inital value
f0 = (20*X2);
f1 = (20 *(1-X));
disp(f0);
dt=0.05;
nstep=50;
D=0.25;
alpha=D*dt/(dx)^2;

e  = ones(imax,1);
B  = [-alpha*e 2*(1+alpha)*e -alpha*e];
Lx = spdiags(B,[-1 0 1],imax,imax);
B  = [alpha*e 2*(1-alpha)*e alpha*e];
Rx = spdiags(B,[-1 0 1],imax,imax);

u=zeros(length(X),nstep+1);
disp(f1);
u(:,1) = f1;        %20(1-x)
disp("ufirst");
disp(u)
u(1:6,1)= f0(1:6);  %for the first half its 20*x, so refill first half
%disp(u);
disp("usecond");

disp(u);
u(1,:)=0;
u(end,:)=0;
imax=length(X)-2;   % remove boundary point
e  = ones(imax,1);
A  = [-alpha*e 2*(1+alpha)*e -alpha*e];
Lx = spdiags(A,[-1 0 1],imax,imax);
B  = [alpha*e 2*(1-alpha)*e alpha*e];
Rx = spdiags(B,[-1 0 1],imax,imax);
disp(u);
%% CN method:
for n=2:nstep+1
    temp=zeros(imax,1);
    temp(1)=alpha*2*u(1,n);
    temp(end)=alpha*2*u(end,n);    
    u(2:end-1,n)=Lx\(Rx*u(2:end-1,n-1)+temp);
end
% display graph
t=(0:0.04:2);
[Xg,tg] = meshgrid(X,t);
E = -0.25*power(pi,2)*tg;
F = (80/power(pi,2))*sin(pi/2)*(exp(E)).*(sin(pi*Xg));
for k = 2:5
   F = F + (1/k^2)*(80/power(pi,2))*sin(k*pi/2)*(exp(E*(k^2))).*(sin(k*pi*Xg));
end
figure;
surf(Xg,tg,F-u.');
