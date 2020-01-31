% Aufgabe 2a

x0 = 2;
f = @(x0) log(x0.^2);
abl = @(x) 2/x;
abl2 = @(x) -2/x.^2;
abl3 = @(x) 4/x.^3;

% abl = @(x) ableiten(f);
% abl2 = ableiten(abl);
% abl3 = ableiten(abl2);

D1 = @(h, x0) (f(x0 + h) - f(x0))./h;
D2 = @(h, x0) (f(x0 + h) - f(x0 - h))./(2.*h); 

for n = 1 : 17
    h = 10.^-n;
    d1 = D1(h, x0);
    err = d1 - abl(x0);
    
    d2 = D2(h, x0);
    err1 = d2 - abl(x0);
    fprintf('h = %.8e   ', h)
    fprintf('D1 = %.8e   ', d1)
    fprintf('|D1 - abl(f(x))| = %.8e   ', abs(err))
    fprintf('D2 = %.4e   ', d2)
    fprintf('|D2 - abl(f(x))| = %.12e\n', abs(err1))
end

% Der Diskretisierungsfehler ist möglich klein bei D1 für h = 10^14 und bei
% D2 bei h = 2

% Aufgabe 2b
eps = 2.^-52;
hopt = sqrt(4 * eps.*(f(x0)./abl2(x0)));
err = D1(hopt, x0) - abl(x0);
disp('--------');
disp('D1');
fprintf('optimale Schrittweite = %.50e, ', hopt);
fprintf('Diskretisierungsfehler = %.8e \n', abs(err));

% Der Diskretisierungsfehler ist etwa höher als der tiefste Wert
% in der Tabelle. 

% Aufgabe 2c
hopt2 = nthroot((6*eps*(f(x0))./abl3(x0)), 3);
err2 = D2(hopt2, x0) - abl(x0);
disp('--------');
disp('D2');
fprintf('optimale Schrittweite = %.8e, ', hopt2);
fprintf('Diskretisierungsfehler = %.8e \n', abs(err2));
disp('--------');

% Der Diskretisierungsfehler entspricht meinen Erwartungen gem. der Tabelle



