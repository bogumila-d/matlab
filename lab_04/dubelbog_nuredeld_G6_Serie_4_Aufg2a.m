v = @(t) 3500 .* sin(140.*pi.*t).*exp(-63.*pi.*t);
a = 0;
b = 50;
m = 3;
R = 50;

E = @(t) (v(t).^2)./R;
T = 0;

for t=a:50
   T(t+1) = dubelbog_nuredeld_G6_Serie_3_Aufg3(E, 0, t, m);
end

subplot(2, 1, 1);
t = 0:1:50;
plot(t, T);
title('m = 3, falsches Ergebnis');
xlabel('t');
ylabel('E(t)');
grid on;

% Die Anzahl der Iterationen wurde zu tief gesetzt, sodass der Fehler noch
% viel zu gross ist, was irtümlicherweise zu absurden Ergebnissen führt. Um
% einen annährend korrekten Wert zu erhalten muss die Anzahl der
% Iterationen auf min. 15 gesetzt werden. Exakter Wert der Funktion liegt bei 257.35380033

m = 15;
for t=a:50
   T(t+1) = dubelbog_nuredeld_G6_Serie_3_Aufg3(E, 0, t, m);
end

subplot(2, 1, 2);
t = 0:1:50;
plot(t, T);
title('m = 15, korrektes Ergebnis');
xlabel('t');
ylabel('E(t)');
grid on;
