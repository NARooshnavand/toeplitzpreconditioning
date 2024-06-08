% clc
clear
%this program contains First neumerical experiment, which
%demonstrated by author(s) in page 21.
r1 = 0;
l1 = 2;
r2 = 0;
l2 = 2;
T = 1;
%d=d1xy where d1xy is defined in the current folder
%e=e1xy where e1xy is defined in the current folder
%psi=psi1xy where psi1xy is defined in the current folder
%f=f1xyt where f1xyt is defined in the current folder
%u=u1xyt where u1xyt is exact solution and defined in the current folder
%in this example M_x = M_y = M
M = 2^4-1;
Mx = M;
My = M;
N = 2^4;
J = Mx*My;
Deltax = (l1-r1)/(Mx+1);
x = (1:Mx)*(Deltax);
x = x(:);
Deltay = (l2-r2)/(My+1);
y = (1:My)*(Deltay);
y = y(:);
alpha = 1.1;
beta = 1.9;
d=zeros(J,1);
e=zeros(J,1);
Dt = T/N;
f=zeros(J,N+1);
u = zeros(J,N+1);
Uexact = zeros(J,N+1);
% initial values;
for j=1:My
    d((j-1)*Mx+1:j*Mx) = d1xy(x,y(j),alpha,beta);
    e((j-1)*Mx+1:j*Mx) = e1xy(x,y(j));
    u((j-1)*Mx+1:j*Mx,1) = psi1xy(x,y(j));
    for k=1:N+1
        f((j-1)*Mx+1:j*Mx,k) = f1xyt(x,y(j),(k-1)*Dt,alpha,beta);
        Uexact((j-1)*Mx+1:j*Mx,k) = u1xyt(x,y(j),(k-1)*Dt);
    end
end
SalphaMx = SgammaM(alpha,Mx);
SbetaMy = SgammaM(beta,My);
Ax = kron(eye(My),SalphaMx);
Ax = diag(d)*Ax;
etax = Dt/(Deltax^alpha);
Ay = kron(SbetaMy,eye(Mx));
Ay = diag(e)*Ay;
etay = Dt/(Deltay^beta);
A = eye(J)+etax*Ax+etay*Ay;
for k=2:N+1
    b = u(:,k-1)+Dt*f(:,k);
    u(:,k) = A\b;
end
norm(u-Uexact)