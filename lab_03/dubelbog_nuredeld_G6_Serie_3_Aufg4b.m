r = [0 800 1200 1400 2000 3000 3400 3600 4000 5000 5500 6370];
p = [13000 12900 12700 12000 11650 10600 9900 5500 5300 4750 4500 3300];
m = @(r, p) p.*4.*pi.*r.^2;

m = dubelbog_nuredeld_G6_Serie_3_Aufg4a(r*1000,m(r*1000,p));
m_earth_reference = 5.976e+24;

abs_error = abs(m - m_earth_reference);
rel_error = abs(m - m_earth_reference)./abs(m_earth_reference);

disp(num2str(m,'M berechnet:  %.6e '));
disp(num2str(abs_error,'Absoluter Fehler:  %.6e '));
disp(num2str(rel_error,'Relativer Fehler:  %.6e '));




