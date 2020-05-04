clear
u = 1; 
r = 1;
delx = 0.1; % x-step
delt = (delx*sqrt(r))/u; % t-step
x = 0:delx:1; 
t = 0:delt:2; 
f = zeros(length(t),1)*zeros(1,length(x)); 
f(:,1) = 0; % u(0,t) = 0
f(:,length(x)) = 0; %u(1,t) = 0
f(1,:) = x.*(1-x);  %u(x,0) = x*(1-x)
%\Implicit method
for n = 2:length(x)-1 %columns
    
    f(2,n)= (f(1,n-1)+f(1,n+1))/2; 
    
end

for m = 3:length(t) % rows
    for n = 2:length(x)-1 % columns
      
 f(m,n) = f(m-1,n+1)+f(m-1,n-1)-f(m-2,n);    
           
    end       
end

mesh(x,t,f);
surf(x,t,f);
