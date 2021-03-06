function [g,tau,gs,rr]=a2g(aa)
%aa=[1 2 2 1 0.2];[g,tau,gs,rr] = a2g(aa)
%aa is the coefficient of the characteristic polynomial P(s).
%P(s)=an*s^n+a3*s^3+a2*s^2+a1*s+a0, aa=[an a3 a2 a1 a0],
%function [g,tau,gs,rr] = a2g(aa) produces stability index g(gamma), 
%equivalent time constant tau, stability limit gs(gamma-star),
%and roots rr, for the characteristic polynomial specified by aa.
%gi=ai^2/{a(i+1)*a(i-1)}, g=[g(n-1) g2 g1] 
%gsi=1/g(i+1)+1/g(i-1) where g0=gn=infinity, gs=[gs(n-1) gs2 gs1]
[m,n]=size(aa);nn=n-1;
g=zeros(1,nn-1);gs=zeros(1,nn-1);
for i=1:nn-1,g(i)=aa(i+1)^2/aa(i)/aa(i+2);end;
gs(1)=1/g(2);gs(nn-1)=1/g(nn-2);for i=2:nn-2,gs(i)=1/g(i-1)+1/g(i+1);end;
tau=aa(nn)/aa(nn+1);
rr=roots(aa);
