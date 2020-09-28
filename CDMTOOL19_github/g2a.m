function [aa,aq]=g2a(g,an,a0)
% g=[2 2 2 2.5];an=1;a0=1;[aa,aq]=g2a(g,an,a0)
% g is stability index, an/a0 are the coefficints of the highest/lowest order.
% aa/aq are the coefficients of the polynomial/the squared polynomial.
[m,n]=size(g);nn=n+1;ng=n;
gg=zeros(1,ng);ggg=zeros(1,ng);
gg(ng)=g(ng);for i=1:ng-1,gg(ng-i)=g(ng-i)*gg(ng-i+1);end;
ggg(ng)=gg(ng);for i=1:ng-1,ggg(ng-i)=gg(ng-i)*ggg(ng-i+1);end;
t=(an*ggg(1)/a0)^(1/nn);
aa=zeros(1,nn+1);aa(nn+1)=a0;aa(nn)=a0*t;for i=2:nn,aa(nn+1-i)=a0*t^i/ggg(ng+2-i);end;
aq=a2aq(aa);
