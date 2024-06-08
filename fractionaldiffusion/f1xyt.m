function f = f1xyt(x,y,t,alpha,beta)
kkx = length(x);
s1 = zeros(kkx,1);
kky = length(y);
s2 = zeros(kky,1);
for i=2:4
    s1 = s1 + nchoosek(2,i-2)*2^(4-i)*factorial(i)*(x.^(i-alpha)+(2-x).^(i-alpha))/(gamma(i+1-alpha)*(-1)^(i-2));
    s2 = s2 + nchoosek(2,i-2)*2^(4-i)*factorial(i)*(y.^(i-beta)+(2-y).^(i-beta))/(gamma(i+1-beta)*(-1)^(i-2));
end

f = -exp(-t).*x.^2.*(2-x).^2.*y.^2.*(2-y).^2 ...
    +(exp(-t)*d1xy(x,y,alpha,beta).*y.^2.*(2-y).^2)/(2*cos(alpha*pi/2)*gamma(2-alpha)).*s1 ...
    +(exp(-t)*e1xy(x,y).*x.^2.*(2-x).^2)/(2*cos(beta*pi/2)*gamma(2-beta)).*s2;