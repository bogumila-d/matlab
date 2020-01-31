clc;

R = 4;
r = 0.02;

h0 = 6.5;
g = 9.81;
a = 0;
b = 24000;
t = 4000;

dhdt = @(t, h) -(r.^2 * sqrt(2*g*h))/(2*h*R - h.^2);

n = (b-a)/t;

% Aufgabe 2a
[t, ht] = dubelbog_nuredeld_G6_Serie_6_Aufg1(dhdt, a, b, n, h0);

% Aufagbe 2b

[x,euler,euler_mittel,euler_mod] = dubelbog_nuredeld_G6_Serie_5_Aufg3(dhdt, a, b, n, h0);
disp('Runge Kutta');
disp(num2str(ht,' %.8f '));
disp('Euler');
disp(num2str(euler,' %.8f '));
disp('Euler Mittelverfahren');
disp(num2str(euler_mittel,' %.8f '));
disp('Euler Modifiziert');
disp(num2str(euler_mod,' %.8f '));

% Aufagbe 2c

plot(t, ht);
hold on;
grid on;
grid minor;
plot(t, euler);
plot(t, euler_mittel);
plot(t, euler_mod);
xlabel('t');
ylabel('h');
legend('Runge Kutta', 'Euler', 'Euler Mittelverfahren', 'Euler modifiziert');





