clc;

f = @(x,y) x.^2./y;
a = 0;
b = 10;
n = (b-a)/0.1;
y0 = 2;

f_sol = @(x) sqrt((2*x^3/3)+4);

[x, runge_kutta] = dubelbog_nuredeld_G6_Serie_6_Aufg1(f, a, b, n, y0);
[x_value, euler, mittelpunkt, modeuler] = dubelbog_nuredeld_G6_Serie_5_Aufg3(f, a, b, n, y0);

% plot Lösung
subplot(2, 1, 1);
plot(x, runge_kutta);
hold on;
grid on;
grid minor;
plot(x_value, euler);
plot(x_value, mittelpunkt);
plot(x_value, modeuler);
xlabel('x');
ylabel('y');
title('Lösung')
legend('Runge Kutta', 'Euler', 'Euler Mittelverfahren', 'Euler modifiziert');


% plot Fehler
length = size(x_value);
y_exact = 0;
x_value

for i=1:length(2)
   y_exact(i) = f_sol(x_value(i));
end

error_runge_kutta = abs(y_exact - runge_kutta);
error_euler = abs(y_exact - euler);
error_mittelpunkt = abs(y_exact - mittelpunkt);
error_modeuler = abs(y_exact - modeuler);

subplot(2, 1, 2);
semilogy(x_value, error_runge_kutta);
hold on;
grid on;
grid minor;
semilogy(x_value, error_euler);
semilogy(x_value, error_mittelpunkt);
semilogy(x_value, error_modeuler);
xlabel('x');
ylabel('error');
title("Error");
legend('Runge Kutta', 'Euler', 'Euler Mittelverfahren', 'Euler modifiziert');


