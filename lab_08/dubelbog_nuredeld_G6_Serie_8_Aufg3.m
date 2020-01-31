f = @(t, y) -12*y + 30 * exp(-2*t);

y_exact = @(t) 3 *(1-exp(-10*t)) * exp(-2*t);
y_exact_val = 0;

a = 0;
b = 10;
y0 = 0;

n = 100;

% Teilaufgabe a
% Bei einem n < 50 die Lösungskurve für beiden Verfahren weicht bei höhren
% Werten für t sehr stark von der exakten Lösungskurve ab (s. beigefügter Screenshot). 
% Wenn man ein enstprechend hohen Wert für n-Anzahl Schrite wählt wird die 
% Lösung sehr genau.
[x, y_euler, y_mittelpunkt] = dubelbog_nuredeld_G6_Serie_5_Aufg3(f,a,b,n,y0);


for i=1:length(x)
   y_exact_val(i) =  y_exact(x(i));
end

disp('Exact');
disp(num2str(y_exact_val(n+1),' %.8f '));

disp('Euler');
disp(num2str(y_euler(n+1),' %.8f '));
disp('Mittelpunkt');
disp(num2str(y_mittelpunkt(n + 1),' %.8f '));

subplot(4, 1, 1);
plot(x, y_mittelpunkt, '-o');
hold on;
plot(x, y_exact_val, '-o');
title('Mittelpunkt vs. Exact');
xlabel('t');
ylabel('y(t)');
grid on;
grid minor;
legend('Mittelpunkt', 'Exact');

subplot(4, 1, 2);
plot(x, y_euler, '-o');
hold on;
plot(x, y_exact_val, '-o');
title('Euler vs. Exact');
xlabel('t');
ylabel('y(t)');
grid on;
grid minor;
legend('Euler', 'Exact');

% Teilaufgabe b

% tol = 10; % immer verdoppelt / halbiert => entsteht eine periodische Funktion
% tol = 10.^-25; % immer halbiert
 tol = 10.^-1;
h = 0.001;
[x, y_e, y_m, h_values] = dubelbog_nuredeld_G6_Serie_8_Aufg3b(f,a,b,h,y0, tol);

for i=1:length(x)
   y_exact_val(i) =  y_exact(x(i));
end

disp(num2str(h_values,' %.15f '));
subplot(4, 1, 3);
plot(x, y_m);
hold on;
plot(x, y_exact_val);
title('Dynamische Schrittweite');
xlabel('t');
ylabel('y(t)');
grid on;
grid minor;
legend('Dynamischen Schrittweite', 'Exact');

% Teilaufgabe c
subplot(4, 1, 4);
semilogy(x, h_values);
title('Schrittweite in Abhängigkeit der Zeit');
xlabel('t');
ylabel('Schrittweite');
grid on;
grid minor;

% Teilaufgabe d
% Bei kleiner Toleranz und kleiner Schrittweite greift meistens der zweite
% Fall, sodass die Schrittweite mit jedem Schritt halbiert wird und sich
% dem Null nährt., die Lösungskurve wird ziemlich genau berechnet und entspricht 
% der exakten Lösung.
% Bei höher Toleranz wie tol >= 10 wird  die Schtittweite
% verdoppelt und somit ensteht eine sehr gezackte Lösungskurve, die sehr
% stark von der exakten Lösung abweicht.




