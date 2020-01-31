c = 0.16;
m = 1;
l = 1.2;
g = 9.81;

a = 0;
b = 60;
h = 0.1;

z0 = [pi/2; 0];
f = @(t, z0) [z0(2); (-(c/m) * z0(2)) - ((g/l)*sin(z0(1)))];

n = (b-a)/h;

[x, y] = dubelbog_nuredeld_G6_Serie_6_Aufg1(f, a, b, n, z0);

subplot(2, 1, 1);
plot(x,y);
title('Vektorielle Lösung');
xlabel('t');
ylabel("y(t), y'(t)");
grid on;
grid minor;
legend("y(t)", "y'(t)");

% Für die Aufgabenlösung ist nur die erste Funktionskurve relevant
subplot(2, 1, 2);
plot(x,y(1,:));
title('Lösungskurve y(t)');
xlabel('t');
ylabel("y(t)");
grid on;
grid minor;

