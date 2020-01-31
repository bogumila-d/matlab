function [Tf_neq] = dubelbog_nuredeld_G6_Serie_3_Aufg4a(x,y)

Tf_neq = 0;
for i = 1:length(x)-1
    Tf_neq = Tf_neq + (y(i) + y(i+1))/2*(x(i+1) - x(i));
end



