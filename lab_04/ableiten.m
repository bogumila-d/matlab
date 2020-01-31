function [funcDiff] =  ableiten(func)
syms y(x)
y(x) = func;
funcDiff = matlabFunction(diff(y,x));
end