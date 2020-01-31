function [x, y_euler, y_mittelpunkt, y_modeuler] = dubelbog_nuredeld_G6_Serie_5_Aufg3(f,a,b,n,y0)

h = (b-a)/n;
y = y0;
x = a;

% exakte Lösung Aufgabe 2
% diff = @(x) sqrt(((2*x.^3)/3) + 4);

% euler
for i=1:n
   x(i+1) =  x(i) + h;
   y(i+1) = y(i) + h.*f(x(i), y(i));
end

y_euler = y;

y = y0;
x = a;

% mittelpunkt
for i=1:n
   xh2 = x(i) + h/2;
   yh2 = y(i) + (h/2)*f(x(i), y(i));
   x(i+1) = x(i) + h;
   y(i+1) = y(i) + h.*f(xh2, yh2);
end

y_mittelpunkt = y;

y = y0;
x = a;

% modeuler
for i=1:n
   x(i+1) =  x(i) + h;
   y(i+1) = y(i) + h.*f(x(i), y(i));
   k1 = f(x(i), y(i));
   k2 = f(x(i+1), y(i+1));
   y(i+1) = y(i) + h*((k1 + k2)/2);
end

y_modeuler = y;

% [x, y_euler, y_mittelpunkt, y_modeuler] = dubelbog_nuredeld_G6_Serie_5_Aufg3(@(x,y) x.^2./y, 0, 2.1, 3, 2)
% [x, y_euler, y_mittelpunkt, y_modeuler] = dubelbog_nuredeld_G6_Serie_5_Aufg3(@(x,y) x.^2 + y.*0.1, -1.5, 1.5, 5, 0)