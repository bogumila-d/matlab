
function [x, yab4] = dubelbog_nuredeld_G6_Serie_7_Aufg2(f, a, b, n, y0)

h = (b-a)/n;
yab4 = zeros(n+1, 1);
x = zeros(n+1, 1);

[x(1:4), yab4(1:4)] = dubelbog_nuredeld_G6_Serie_6_Aufg1(f, a, a + h*3, 3, y0);

b = dubelbog_nuredeld_G6_Serie_7_Aufg1;

for i=4:n
    yab4(i+1) = yab4(i) + h*(b(1)*f(x(i), yab4(i)) + b(2)*f(x(i-1), yab4(i-1)) + b(3)*f(x(i-2), yab4(i-2)) + b(4)*f(x(i-3), yab4(i-3)));
    x(i+1) = x(i) + h;
end

% [x, y] = dubelbog_nuredeld_G6_Serie_7_Aufg2(@(x, y) exp(x), 0, 1, 10, 1)