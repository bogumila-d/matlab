function [yj] = dubelbog_nuredeld_G6_Serie_9_Aufg3(x, y, xj)

size = length(x);
p = zeros(size);

for i=1:size
    p(i,1) = y(i);
end

for j=2 : size
    for i=2 : size  
        if i >= j
          p(i,j) = (((x(i) - xj)*p(i-1,j-1)) + (xj-x((i-j)+1))*p(i, j-1))./(x(i)-x((i-j)+1));  
        end
    end
end

disp(num2str(p,' %.8f '));
yj = p(size, size);


% [yj] = dubelbog_nuredeld_G6_Serie_9_Aufg3([0 2500 5000 10000], [1013 747 540 226], 1250)
% [yj] = dubelbog_nuredeld_G6_Serie_9_Aufg3([0 2500 5000 10000], [1013 747 540 226], 3750)
% [yj] = dubelbog_nuredeld_G6_Serie_9_Aufg3([0.5 0.6 0.7 0.8], [0.6915 0.7257 0.7580 0.7881], 0.52)

