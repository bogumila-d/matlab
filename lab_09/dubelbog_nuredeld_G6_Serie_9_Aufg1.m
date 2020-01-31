value_lagrange = 8.38945;
fun = @(x) x.*log(x.^2);
a = 1;
b = exp(1);
m = 3;
q = 2 * integral(fun,1,exp(1));

disp('Exact:')
disp(num2str(q,' %.10f '));

romberg = 2 * dubelbog_nuredeld_G6_Serie_3_Aufg3(fun, a, b, m);

disp('Romberg:');
disp(num2str(romberg,'Value:  %.10f '));

error_abs_robmerg = abs(q - romberg);
error_abs_lagrange = abs(q - value_lagrange);

error_rel_robmerg = abs((romberg-q)/q);
error_rel_lagrange = abs((value_lagrange-q)/q);

disp(num2str(error_abs_robmerg,'Absolut error %.10f '));
disp(num2str(error_rel_robmerg,'Relativ error %.10f '));

disp('Lagrange:');
disp(num2str(value_lagrange,'Value:  %.10f '));
disp(num2str(error_abs_lagrange,'Absolut error %.10f '));
disp(num2str(error_rel_lagrange,'Relativ error %.10f '));

% Romberg Extrapolation schneidet deutlich besser ab als Lagrange
% Interpolation


