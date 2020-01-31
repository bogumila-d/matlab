clear all;
clc;
T = (0:10:100);
q = [999.9 999.7 998.2 995.7 992.2 988.1 983.2 977.8 971.8 965.3 958.4];

f1 = @(T) T.^2;
f2 = @(T) T;
f3 = 1;


n = length(T);

for i=1 : n
    A(i, 1) =  f1(T(i));
    A(i, 2) =  f2(T(i));
    A(i, 3) =  f3;
end

left = transpose(A)*A;
right = transpose(A).*q;
cond = cond(left);


lambda = left \ sum(right, 2);

a = lambda(1);
b = lambda(2);
c = lambda(3);

pT = @(T) a*f1(T) + b*f2(T) + c;

p = polyfit(T,q,2);
fp = polyval(p,T);

k = length(p);
diff = 0;

for i=1:k
    diff(i) = abs(p(i)-lambda(i));
end

disp("Konditionszahl:");
disp(cond);
% Die Konditionszahl ist sehr hoch, was darauf hinweist, dass es eine
% schlecht kondizinoierte Matrix ist.

disp('Differenz lamda - polyfit (matlab)');
disp(diff);

plot(T, pT(T),'b-o', T, q, 'rx', T, fp, 'g--');
grid on;
grid minor;
legend('Ausgleichsfunktion', 'Daten', 'Ployfit matlab');

% die berechneten Koeffitzienten von Ausgleichsfunktion sind fast identisch mit denen, die mit matlab polyfit berechnet wurden. 
% Die Abweichungen sind erst nach der 12 Kommastelle zu bemerken.

