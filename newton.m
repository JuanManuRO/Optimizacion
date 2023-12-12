% syms x y
% f = (x-2)^4 + (y-5)^2;
% aux1 = gradient(f);
% aux2 = hessian(f,[x,y]);


x0 = 0;
y0 = 2;
epsilon = 0.001;

f =@(x,y) (x-2)^4 + (y-5)^2;
fx =@(x,y) 4*(x - 2)^3;
fy =@(x,y) 2*y - 10;
fxx =@(x,y) 12*(x - 2)^2;
fxy =@(x,y) 0;
fyx =@(x,y) 0;
fyy =@(x,y) 2;
fcontour(f, 'LevelStep', 30)
hold on
while sqrt(fx(x0,y0)^2+fy(x0,y0)^2) > epsilon
    plot(x0,y0, 'bo');
    hold on
    pts = [x0,y0] - transpose(inv([fxx(x0,y0) fxy(x0,y0); fyx(x0,y0) fyy(x0,y0)])*[fx(x0,y0); fy(x0,y0)]);
    x0 = pts(1);
    y0 = pts(2);
end
disp(x0)
disp(y0)