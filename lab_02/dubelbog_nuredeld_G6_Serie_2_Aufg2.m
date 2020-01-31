function [D] = dubelbog_nuredeld_G6_Serie_2_Aufg2(f, x0, h0, n)

D2f = @(h) (f(x0+h) - f(x0-h))./(2*h);

funcDiff = ableiten(f);
exact_value = funcDiff(x0);
E = zeros(n);
D = zeros(n);

%erste Spalte
for i=1 : n
    D(i) = D2f(h0);
    E(i) = exact_value;
    h0 = h0/2;
end

for k=2 : n
    for i=1:n-(k-1)
            D(i,k) = (4.^k * (D(i+1, k-1)) - D(i, k-1))./(4.^k - 1);
            E(i,k) = exact_value;      
    end    
end

Error = D - E;
disp('--------');
disp('Approoximative Lösung');
disp(num2str(D,' %.8f '));
disp('--------');
disp('Error');
disp(num2str(Error,' %.8f '));
disp('--------');


% [D] = dubelbog_nuredeld_G6_Serie_2_Aufg2(@(x) log(x.^2), 2, 0.5, 4)
