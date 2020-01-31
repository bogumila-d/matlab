function [yy] = dubelbog_nuredeld_G6_Serie_10_Aufg2(x,y,xx)

yy = xx;
n = length(x);

a = y;

for i=1:n-1
    h(i) = x(i+1) - x(i);
end

z(1) = 3*(y(3)-y(2))/h(2) - 3*(y(2)-y(1))/h(1);
for i=2:n-3
    z(i) = 3*(y(i+2)-y(i+1))/h(i+1) - 3*(y(i+1)-y(i))/h(i);
end
z(n-2) = 3*(y(n)-y(n-1))/h(n-1) - 3*(y(n-1)-y(n-2))/h(n-2);

A(1,1) = 2 * (h(1)+h(2));
A(1,2) = h(2);
for i=2:n-3
    A(i,i-1) = h(i-1);
    A(i,i) = 2*(h(i-1)+h(i));
    A(i,i+1) = h(i);
end
A(n-2,n-3) = h(n-2);
A(n-2,n-2) = 2*(h(n-2)+h(n-1));

cs = z/A;

c(1) = 0;
for i=2:n-1
    c(i) = cs(i-1);
end
c(n) = 0;

for i=1:n-1
    b(i) = (y(i+1)-y(i))/(h(i)) - h(i)/3*(c(i+1)+2*c(i));
    d(i) = 1/(3*h(i)) * (c(i+1)-c(i));
    r = find(x(i)<=xx &xx<=x(i+1));
    yy(r)= polyval([d(i) c(i) b(i) a(i)],xx(r)-x(i));
end

plot(yy);
grid on;
grid minor;

end

% [yy] = dubelbog_nuredeld_G6_Serie_10_Aufg2([0 1 2 3],[2 1 2 2],[0:0.1:3])