
func = @(x) log(x.^2);
diff_1 = ableiten(func);
diff_2 = ableiten(diff_1);

x = [1:0.1:2];
max_x = diff_2(2);
plot(x, diff_2(x));
hold on;

h_R = sqrt(12 * 10.^-5);
h_T = sqrt(6 * 10.^-5);

diff_3 = ableiten(diff_2);
diff_4 = ableiten(diff_3);
plot(x, diff_4(x));

h_S = nthroot(((2880 * 10^-5)./12),4);

disp(num2str(h_R,'h für summierte Rechtecksregel:  %.8f '));
disp(num2str(h_T,'h für summierte Trapezregel:  %.8f '));
disp(num2str(h_S,'h für summierte Simpsonregel:  %.8f '));
