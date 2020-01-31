function [x, y_euler, y_mittelpunkt] = dubelbog_nuredeld_G6_Serie_5_Aufg3(f,a,b,n,y0)

h = (b-a)/n;
y = y0;
x = a;

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

