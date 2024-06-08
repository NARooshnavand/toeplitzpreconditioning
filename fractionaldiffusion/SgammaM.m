function S = SgammaM(g,M)
%Create the S_{\gamma, M} described in Page 4
% 1- g must belong to (1,2) and M is nonnegative integer
s = zeros(M,1);
s(1) = gamma(g+1)/(gamma(g/2+1)^2);%s[1]=s_{0,\gamma}
for k=2:M
    s(k) = (1-(g+1)/(g/2+k+1))*s(k-1);%s[k] = s_{k+1,\gamma} computation gets from the definiation page 20
end
S = toeplitz(s);
