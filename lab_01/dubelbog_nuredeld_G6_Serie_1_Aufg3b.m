
for i = 1 : 1000
    t(i) = 0 + (i * 0.1);
    x(i) = (10.*exp(-0.05.*t(i))).*cos(0.2.*pi.*t(i));
end

dx1 = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, x);
dx2 = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, dx1);

figure('name','Aufgabe 3b, Gedäpfte Schwingung x(t) eines Federpendels');
plot(t,x, 'g', t, dx1, 'b', t, dx2, 'r')
xlabel('t')
ylabel("x(t), x'(t), x''(t)")
legend("  Auslenkung: x(t)", "  Geschwindigkeit: x'(t)", "  Beschleunigung: x''(t)");
grid on;

% Die Nulldurchgänge der Geschwindigkeit liegen an den Stellen wo die
% Auslenkung ein relatives Extremum hat. Die Beschleunigung erreicht
% deren relatives Extrmum direkt nachdem Nulldurchgang der Geschwindigkeit.
% Die Bedeutung: in dem Moment, in dem der Pendel die maximale Auslenkung
% erreicht (also ist kurz vorm Zurückschwenken nach unten oder oben), ist
% die Geschwndigkeit gleich Null. Nachdem die maximale Auslenkung erreicht
% wurde, nimmt der Pendel wieder Fahrt auf und somit ist die Beschleinigung
% am grösstem.
% Nach jeder Periode wird die Auslenkung gedämpft bis sie gelich Null ist. 
% Da die Beschleunigung und Geschwindigkeiten die Ableitungen der
% Auslenkungsfunktion sind erreichen sie auch den konstanten Wert Null.
