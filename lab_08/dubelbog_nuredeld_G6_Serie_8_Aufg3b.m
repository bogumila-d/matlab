function [x, y_e, y_m, h_values] = dubelbog_nuredeld_G6_Serie_8_Aufg3b(f,a,b,h,y0, tol)

n = (b-a)/h;
y_e = y0;
y_m = y0;
x = a;
h_values = h;
i = 1;


while x(i) < b 
   % euler
   x(i+1) =  x(i) + h_values(i);
   y_e(i+1) = y_e(i) + h_values(i).*f(x(i), y_e(i));
   
   % mittelpunkt
   xh2 = x(i) + h_values(i)/2;
   yh2 = y_m(i) + (h_values(i)/2)*f(x(i), y_m(i));
   x(i+1) = x(i) + h_values(i);
   y_m(i+1) = y_m(i) + h_values(i).*f(xh2, yh2);
   
   if abs(y_e(i+1) - y_m(i+1)) < tol/20
       h_values(i+1) = h_values(i) * 2;
   elseif abs(y_e(i+1) - y_m(i+1)) >= tol
      h_values(i) = h_values(i)/2;
      
      % mittelpunkt
      xh2 = x(i) + h_values(i)/2;
      yh2 = y_m(i) + (h_values(i)/2)*f(x(i), y_m(i));
      x(i+1) = x(i) + h;
      y_m(i+1) = y_m(i) + h_values(i).*f(xh2, yh2);
     
      h_values(i+1) = h_values(i);
      
   else
      h_values(i+1) = h_values(i); 
   end   
   i = i+1;
end

