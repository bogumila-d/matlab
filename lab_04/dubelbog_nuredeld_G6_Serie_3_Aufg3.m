function [T] = dubelbog_nuredeld_G6_Serie_3_Aufg3(y, a, b, m)
max = m;
T = zeros(max + 1);

% Referenzwert
exact = integral(y,a,b);
%disp('------------------------------------------------------------------');
%disp(num2str(exact,'Exakter Wert: %.8f '));

% Berechnen der ersten Spalte der Matrix
for m=0:max
    
    h = (b-a)/2.^m;
    n = 2^m;
    tf_sum = 0;
    x = [];
        
    % Berechnung von x1 bis xn
    for i=1:n
        x(i) = a+(i*h);
    end
    
    % Summierte Trapezregel
    for i=1:n-1
        tf_sum = tf_sum + y(x(i));
    end
    
    tf = h.*(((y(a) + y(b))./2) + tf_sum);
    T(m+1) = tf; 
end

% Romberg-Extrapolation, Berechnen der weiteren Matrix-Werten
for k=2 : max + 1
    for i=1: (max+1)-(k-1)
        T(i,k) = (4.^(k-1) * (T(i+1, k-1)) - T(i, k-1))./(4.^(k-1) - 1);
    end
end

%disp(num2str(T,'  %.8f '));
% Ploten vom genausten Wert
T = T(1, max + 1);

% [T] = dubelbog_nuredeld_G6_Serie_3_Aufg3(@(x) 1./x, 2, 4, 3)
% [T] = dubelbog_nuredeld_G6_Serie_3_Aufg3(@(x) cos(x.^2), 0, pi, 4)
% [T] = dubelbog_nuredeld_G6_Serie_3_Aufg3(@(x) exp(-x.^2), 0, 0.5, 3)
