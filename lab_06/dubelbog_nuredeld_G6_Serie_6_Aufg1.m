function [x, y] = dubelbog_nuredeld_G6_Serie_6_Aufg1(f, a, b, n, y0)

h = (b-a)/n;
y = y0;
x = a;
h2 = h/2;

% Runge-Kutta Verfahren
for i=1:n
   x(i+1) =  x(i) + h;
   k1 = f(x(i), y(i));
   k2 = f(x(i) + h2, y(i) + (h2 * k1));
   k3 = f(x(i) + h2, y(i) + (h2 * k2));
   k4 = f(x(i) + h, y(i) + (h * k3));
   y(i+1) = y(i) + h.*1/6 * (k1 + 2*k2 + 2*k3 + k4);
end


% [x, y] = dubelbog_nuredeld_G6_Serie_6_Aufg1(@(x,y) x.^2 + y.*0.1, -1.5, 1.5, 5, 0)
