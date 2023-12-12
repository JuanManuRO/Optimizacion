% syms x y
% f = (x-2)^4 + (x-2*y)^2;
% [aux] = gradient(f);



% x0 = 0;
% y0 = 3;
% epsilon = 0.0001;
% 
% f =@(x,y) (x-2)^4 + (x-2*y)^2;
% fx =@(x,y)  2*x - 4*y + 4*(x - 2)^3;
% fy =@(x,y) 8*y - 4*x;

x0=1;
y0=1;
epsilon=0.0001;

f=@(x,y) 2*exp(x) + 3*x^2 + 2*x*y+4*y^2+10*(3*x+2*y-6)^2;
fx=@(x,y) 2*exp(x) + 6*x + 2*y + 60*(3*x+2*y-6);
fy=@(x,y) 2*x+8*y+ 40*(3*x+2*y-6);

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
