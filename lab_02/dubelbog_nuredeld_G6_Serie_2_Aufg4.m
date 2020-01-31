t = @(v) 10./-(v.*sqrt(v));
n = 5;
a = 20;
b = 5;

h = (b-a)/n;
rf = 0;
tf_sum = 0;
sf = 0;
v = [];
exact = integral(t,a,b);
disp('------------------------------------------------------------------------------------------');
disp(num2str(exact,'Exakter Wert: %.8f '));

% Berechnung von v1 bis v5
for i=0:n-1
     v(i+1) = a+(i*h);
end

% 4a) Summierte Rechtecksregel
for i=1:n
    value = v(i) + (h/2);
    rf = rf + t(value);
end

rf = rf * h;
disp('------------------------------------------------------------------------------------------');
disp(num2str(rf,'Summierte Rechtecksregel: %.8f '));
disp(num2str(abs(rf - exact),'Absoluter Fehler: %.8f '));
disp('------------------------------------------------------------------------------------------');
% 4b) Summierte Trapezregel
for i=2:n
    tf_sum = tf_sum + t(v(i));
end

tf = h.*(((t(a) + t(b))./2) + tf_sum);
disp(num2str(tf,'Summierte Trapezregel: %.8f '));
disp(num2str(abs(tf - exact),'Absoluter Fehler: %.8f '));
disp('------------------------------------------------------------------------------------------');

% 4c) Summierte Simpsonregel
v(n+1) = b;
for i=2:n+1
   value = (v(i-1) + v(i))./2;
   sf = sf + t(value);
end

sf = (h/3).*(((1/2)*t(a)) + tf_sum + (2 * sf) + ((1/2)*t(b)));
disp(num2str(sf,'Summierte Simpsonregel: %.8f '));

sf_test = 1/3 * (tf + 2*rf);
disp(num2str(sf_test,'Simpsonregel als gewichtetes Mittel der summierten Trapez- und Rechteckregel: %.8f '));
disp(num2str(abs(sf - exact),'Absoluter Fehler: %.8f '));
disp('------------------------------------------------------------------------------------------');

