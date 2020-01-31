
sol_ab = 0;
sol_rk = 0;
error_ab = 0;
error_rk = 0;
time_ab = 0;
time_rk = 0;
f = @(x, y) exp(x);
a = 0;
b = 1;
y0 = 1;

exact = f(1);

for i=1:7
    n = 10.^i;
    
    % adam-bashforth
    tic;
    [x_ab, y_ab] = dubelbog_nuredeld_G6_Serie_7_Aufg2(f, a, b, n, y0);
    time_ab(i) = toc;
    sol_ab(i) = y_ab(end);
    error_ab(i) = abs(y_ab(end) - exact);
    
    % runge-kutta
    tic;
    [x_rk, y_rk] = dubelbog_nuredeld_G6_Serie_6_Aufg1(f, a, b, n, y0);
    time_rk(i) = toc;
    error_rk(i) = abs(y_rk(end) - exact);
    sol_rk(i) = y_rk(end);
end 

x = (1:7);

subplot(2, 1, 1);
semilogy(x,error_ab);
hold on;
grid on;
grid minor;
semilogy(x,error_rk);
title('error');
xlabel('n');
ylabel('error');
legend('Adam-Bashforth', 'Runge-Kutta');


subplot(2, 1, 2);
semilogy(x,time_ab);
hold on;
grid on;
grid minor;
semilogy(x,time_rk);
title('time');
xlabel('n');
ylabel('time');
legend('Adam-Bashforth', 'Runge-Kutta');

% Error:
% Der globale Fehler ist bis zum n = 4 (also bis zur Schrittweite h = 0.001)
% beim Runge-Kutta Verfahren kleiner als beim Adam-Bashforth. Ab dem n > 4
% nähren sich die Fehler für die beiden Verfahren und werden identisch. Das
% kann darauf zurückgeführt werden, dass je kleiner Schrittweite umso höher
% die Gefahr, dass ein Rundungsfehler entsteht. Die Grenze scheint beim h <
% 0.001 erreicht zu sein. 

% Hinsichtlich der Genauigkeit ist das Runge-Kutta Verfahren dem
% Adam-Bashforth vorzuziehen.

% Time:
% Bis zu einem n von ca. 4.4 ist Runge-Kutta Verfahren schneller als
% Adam-Bashforth. 

% Fazit:
% Hinsichtlich der Zeit gewinnt man bei Adam-Bashforth erst bei n > 4, da
% aber wegen dem Rundungsfehler ist es nicht ratsam so eine kleine
% Schrittweite auszuwählen ist Runge-Kutta Verfahren dem Adam-Bashforth
% klar vorzuziehen. 
