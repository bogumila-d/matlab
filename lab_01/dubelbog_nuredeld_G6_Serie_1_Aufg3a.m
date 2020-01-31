function [dx] = dubelbog_nuredeld_G6_Serie_1_Aufg3a(x, y)

h_forward = x(2) - x(1);
h_central = @(i) x(i+1) - x(i-1);
h_backward = x(end) - x(end-1);

s = size(x, 2);

dx(1) = (y(2) - y(1))./h_forward;

for i = 2 : s - 1
    dx(i) = (y(i + 1) - y(i-1))./ h_central(i);
end

dx(s) = (y(end) - y(end-1))./h_backward;


 % [dx] = dubelbog_nuredeld_G6_Serie_1_Aufg3a([1 2 3 4 5 6], [2 4 6 8 10 12]) 
