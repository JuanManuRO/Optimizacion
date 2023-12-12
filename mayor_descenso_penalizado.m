% syms x y c
% f = 2*(x-3)^2+(y-5)^2+c*(2*x^2-y)^2;
% [aux] = gradient(f);
syms c
x0=0;
y0=0;
epsilon=0.0001;

f=@(x,y) 2*(x-3)^2+(y-5)^2+c*(2*x^2-y)^2;
fx=@(x,y) 4*x - 8*c*x*(- 2*x^2 + y) - 12;
fy=@(x,y) 2*y + c*(- 4*x^2 + 2*y) - 10;

fcontour(f, 'LevelStep', 30)
hold on
while sqrt(fx(x0,y0)^2+fy(x0,y0)^2) > epsilon
    plot(x0,y0, 'bo');
    hold on
    d = -[fx(x0,y0), fy(x0,y0)];
    disp(d);
    px =@(l) x0 + l*d(1);
    py =@(l) y0 + l*d(2);
    func =@(l) f(px(l),py(l));
    minl = fminsearch(func, 0);
    disp(minl);
    x0 = x0+minl*d(1);
    y0 = y0+minl*d(2);
    disp(x0);
    disp(y0);
end
disp(x0)
disp(y0)
