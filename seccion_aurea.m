% f=@(x) (44*x-2)^4+(92*x-6)^2;
% a= 0;
% b= 1;
f =@(x) 8*exp(1-x)+7*log(x);
a = 1;
b = 2;

alpha = (-1 + sqrt(5))/2;
l = a + (1-alpha)*(b-a);
miu = a + alpha*(b-a);

while abs(b - a) >= 0.1
    fplot(f, [a,b])
    hold on
    plot(a,f(a), 'bo');
    plot(b,f(b), 'bo');
    plot(miu,f(miu), 'ro');
    plot(l,f(l), 'ko');
    hold off
    ant = b-a;
    if f(l) > f(miu)
        a = l;
        l = miu;
        miu = a + alpha*(b-a);
    else
        b= miu;
        miu = l;
        l = a +(1-alpha)*(b-a);
    end
    display(join(["Se redujo en", num2str(ant - abs(b-a))], ": "));
    display(a);
    display(f(a));
    display(b);
    display(f(b));
end


