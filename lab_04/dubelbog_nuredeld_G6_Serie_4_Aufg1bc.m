t = 0:10:120;
h = [2 286 1268 3009 5375 8220 11505 15407 20127 25593 31672 38257 44931];
m = [2051113 1935155 1799290 1681120 1567611 1475282 1376301 1277921 1177704 1075683 991872 913254 880377];

R0 = 6378137;
G = 6.673 * 10^-11;
M = 5.976 * 10^24;
v = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, h);
a = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, v);
dmdt = dubelbog_nuredeld_G6_Serie_1_Aufg3a(t, m);

e_kin = 0;
e_pot = 0;

for i = 1 : length(h)    
    e_kin_1 = dmdt .*v;
    e_kin_2 = m .* a;
    e_pot_0 = m(1:i)./((R0 + h(1:i)).^2);
    e_kin(i) = dubelbog_nuredeld_G6_Serie_3_Aufg4a(R0 + h(1:i), e_kin_1) + dubelbog_nuredeld_G6_Serie_3_Aufg4a(R0 + h(1:i), e_kin_2);
    e_pot(i) = G.*M.*dubelbog_nuredeld_G6_Serie_3_Aufg4a(R0 + h(1:i), e_pot_0);   
end

e_tot = e_kin + e_pot;
plot(t, e_pot, 'g', t, e_kin, 'b', t, e_tot, 'r');
legend('Potentielle Energie', 'Kinetische Energie', 'Totale Energie');


% Aufgabe 1c)
E = e_tot(length(e_tot))
disp(num2str(E/10^10,'Mit dieser Energie könnten mindestens %.0f  Haushalte versorgt werden'));

% Mit dieser Energie könnten mindestens 69 Haushalte versorgt werden.


