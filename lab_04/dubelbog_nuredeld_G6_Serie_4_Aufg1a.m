t = 0:10:120;
h = [2 286 1268 3009 5375 8220 11505 15407 20127 25593 31672 38257 44931];
m = [2051113 1935155 1799290 1681120 1567611 1475282 1376301 1277921 1177704 1075683 991872 913254 880377];

% Aufgabe a)

v = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, h);
a = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, v);

subplot(7, 1, 1);
plot(t, h);
title('h(t)');
xlabel('t');
ylabel('h');
grid on;

subplot(7, 1, 2);
plot(t, v);
title('v(t)');
xlabel('t');
ylabel('v');
grid on;

subplot(7, 1, 3);
plot(t, a);
title('a(t)');
xlabel('t');
ylabel('a');
grid on;

subplot(7, 1, 4);
plot(t, m);
title('m(t)');
xlabel('t');
ylabel('m');
grid on;

dmdt = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, m);
subplot(7, 1, 5);
plot(t, dmdt);
title('dm/dt(t)');
xlabel('t');
ylabel('dm/dt');
grid on;

dmdh = dubelbog_nuredeld_G6_Serie_1_Aufg3a(h, m);
subplot(7, 1, 6);
plot(h, dmdh);
title('dm/dh(h)');
xlabel('h');
ylabel('dm/dh');
grid on;

subplot(7, 1, 7);
plot(t, dmdt, 'g', t, dmdh .* v, 'r');
title("dm/dt (t) = dm/dh (h) · v(t)");
grid on;



