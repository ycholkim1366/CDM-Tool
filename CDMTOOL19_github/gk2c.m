function    [bc,ac,aa,g,tau,gs,rr]=gk2c(ap,bp,nc,mc,gr,t,k0)
%ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;k0=10;[bc,ac,aa,g,tau,gs,rr]=gk2c(ap,bp,nc,mc,gr,t,k0)
%ap/bp is the denominator/numerator polynomial of the plant.
%nc/mc is the order of the denominator/numerator polynomial of the controller. 
%gr is the reference stability index; t is equivalent time constant.
%k0 is the steady state gain of the controller.
%aa is the characteristic polynomial of the closed loop with the designed controller. 
%ac/bc is the denominator/numerator polynomial of the designed controller.
%g is stability index, tau(same as t) is equivalent time constant, gs is stability limit.
%rr is roots of the characteristic polynomial.
[m,n]=size(bp);mp=n-1;
[m,n]=size(ap);np=n-1;
[m,n]=size(gr);ng=n;
nn=max(np+nc,mp+mc);
mm=nc+mc+2; 
gg=zeros(1,ng);ggg=zeros(1,ng);
gg(ng)=gr(ng);for i=1:ng-1,gg(ng-i)=gr(ng-i)*gg(ng-i+1);end;
ggg(ng)=gg(ng);for i=1:ng-1,ggg(ng-i)=gg(ng-i)*ggg(ng-i+1);end;
aaa=zeros(1,ng+2);
aaa(ng+2)=k0*bp(mp+1)+ap(np+1);aaa(ng+1)=t*aaa(ng+2);for i=2:ng+1,aaa(ng+2-i)=aaa(ng+2)*t^(i)/ggg(ng+2-i);end;
aam1=zeros(1,ng+2);for i=0:min(np,ng+1),aam1(ng+2-i)=aam1(ng+2-i)+ap(np+1-i);end;
for i=0:min(ng+1,mp),aam1(ng+2-i)=aam1(ng+2-i)+bp(mp+1-i)*k0;end;
aam2=aaa-aam1;
aam=aam2(:,ng+4-mm:ng+1);

pp=zeros(mm-2,nn);
for i=0:nc-1,for j=0:np,pp(nc-i,nn-i-j)=ap(np+1-j);end,end;
for i=0:mc-1,for j=0:mp,pp(nc+mc-i,nn-i-j)=bp(mp+1-j);end,end;
pp1=pp(:,nn-mm+3:nn);
ppp=zeros(mm,nn+1);
for i=0:nc,for j=0:np,ppp(nc+1-i, nn+1-i-j)=ap(np+1-j);end,end;
for i=0:mc,for j=0:mp,ppp(nc+mc+2-i,nn+1-i-j)=bp(mp+1-j);end,end;
llk=aam/pp1;
lk=[llk(1:nc) 1 llk(nc+1:nc+mc) k0];
aa=lk*ppp;
bc=lk(nc+2:nc+mc+2);
ac=lk(1:nc+1);
g=zeros(1,nn-1);gs=zeros(1,nn-1);
for i=1:nn-1,g(i)=aa(i+1)^2/aa(i)/aa(i+2);end;
if nn<=2 gs(1)=0;else gs(1)=1/g(2);gs(nn-1)=1/g(nn-2);for i=2:nn-2,gs(i)=1/g(i-1)+1/g(i+1);end;end;
tau=aa(nn)/aa(nn+1);
rr=roots(aa);
