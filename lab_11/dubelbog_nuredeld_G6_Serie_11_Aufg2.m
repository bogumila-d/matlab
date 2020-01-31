clear all;
clc;
data = load('Serie11_Aufg2_Daten.m','-ASCII');

% Aufgabe a
s = size(data);
n = s(1);

A = [data(1:end,1:4) ones(n,1)];
mch = transpose(data(:,5));

left = transpose(A)*A;
right = transpose(A).*mch;
lambda = left \ sum(right, 2);

fit = A*lambda;

subplot(2,1,1);
plot((1:n),mch,'bx',(1:n),fit,'g-o');
xlabel("Messungen");
ylabel("Aufgenommene Werte");
grid on;
grid minor;
legend('Ausgleichsfunktion', 'Daten');

% Aufgabe b
m = 1000; 

for i=1:10
    for l=1:1000
        for j=1:length(mch)
            error = mch(j) * (i/100);
            a = mch(j) - error;
            b = mch(j) + error;
            mch_error(j) = (b-a).*rand(1,1) + a;   
        end  
        r_side = transpose(A).*mch_error;
        l_disturbed = left \ sum(r_side, 2);
        fit_disturbed = A*l_disturbed;
        errors(i,l) = norm(mch_error - transpose(fit_disturbed),2)^2;        
    end
    f_min(i) = max(errors(i,:));
    f_max(i) = min(errors(i,:));
end

subplot(2,1,2);
hold on;
plot(f_min, '-x');
plot(f_max, '-o');
xlabel('Fehlerkategorie in %');
ylabel('Min/Max Fehlerfunktional');
legend('Maximal Fehler', 'Minimal Fehler');
grid on;
grid minor;

