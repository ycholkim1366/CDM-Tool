function  [aa,g,tau,gs,rr]=aq2a(aq)
%aq=[1 0 0.4 0.2 0.04];[aa,g,tau,gs,rr]=aq2a(aq)
%aq is a squared polynomial, aa is the original polynomial.
[m,n]=size(aq); nn=n-1;
aaq=aq/aq(1); an=aq(1)^0.5;
a=[zeros(1,nn);eye(nn-1) zeros(nn-1,1)];b=[1;zeros(nn-1,1)];qq=aaq(1,2:nn+1);
[kk,s,e]=lqr(a,b,diag(qq),1);
aa=an*[1 kk];
g=zeros(1,nn-1);gs=zeros(1,nn-1);
for i=1:nn-1,g(i)=aa(i+1)^2/aa(i)/aa(i+2);end;
if nn<=2 gs(1)=0;else gs(1)=1/g(2);gs(nn-1)=1/g(nn-2);for i=2:nn-2,gs(i)=1/g(i-1)+1/g(i+1);end;end;
tau=aa(nn)/aa(nn+1);
rr=roots(aa);
