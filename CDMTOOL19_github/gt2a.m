function [aa,aq]=gt2a(g,t)
%g=[2 2 2 2.5];t=2.5;[aa,aq]=gt2a(g,t)
%g is stability index, t is equivalent time constant, a1/a0.
%aa/aq are the coefficients of the polynomial/the squared polynomial.
%aa(1), the highest-order coefficient of the polynomial, an, is automatically chosen to 1.
[m,n]=size(g);nn=n+1;ng=n;
gg=zeros(1,ng);ggg=zeros(1,ng);
gg(ng)=g(ng);for i=1:ng-1,gg(ng-i)=g(ng-i)*gg(ng-i+1);end;
ggg(ng)=gg(ng);for i=1:ng-1,ggg(ng-i)=gg(ng-i)*ggg(ng-i+1);end;
a0=ggg(1)/t^nn;
aa=zeros(1,nn+1);aa(nn+1)=a0;aa(nn)=a0*t;for i=2:nn,aa(nn+1-i)=a0*t^i/ggg(ng+2-i);end;
aq=a2aq(aa);
