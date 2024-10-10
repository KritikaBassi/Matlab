% Steepest Decent
clc
clear all

%Input the parameters
a=0;
b=0;
f=@(x,y) (x-y+2*x*x+2*x*y+y*y);
grad=@(x,y) [1+4*x+2*y,-1+2*x+2*y];

for i=1:4 %4 is the number of iterations
    grad(a,b);
    d=-grad(a,b)/norm(grad(a,b));
    fun = @(z) f(a + z * d(1), b + z * d(2));
    x1=fminbnd(fun,0,10000); %Differentiating and finding min
    a=a+x1*d(1);
    b=b+x1*d(2);
end
% Display the final values of a and b
fprintf('Final values of a and b are (%f,%f)\n',a,b)
fprintf('Ans= %f',f(a,b));