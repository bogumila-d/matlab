function [func] = dubelbog_nuredeld_G6_Serie_5_Aufg1(f , xmin, xmax, ymin, ymax, hx, hy)

[x,y] = meshgrid(xmin:hx:xmax,ymin:hy:ymax);

dy = f(x,y);
size_y = size(dy);
dx = ones(size_y(1:1), size_y(2:2));

figure
quiver(x,y,dx, dy)

func = f;
% [func] = dubelbog_nuredeld_G6_Serie_5_Aufg1(@(x,y) x.^2.+y.*0.1 , 0, 5, 0, 3, 0.1, 0.1)

% [func] = dubelbog_nuredeld_G6_Serie_5_Aufg1(@(x,y) x.^2.+y.*0.1 , -2, 2, -0.5, 3.5, 0.1, 0.1)