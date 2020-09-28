function    [bc,ac,aa,g,tau,gs,rr]=a2c(ap,bp,ar,unc)
%ap=[1 0 1 0 0];bp=1;ar=[2^(-9) 2^(-5) 2^(-2) 1 2 2 1 0.2];[bc,ac,aa,g,tau,gs,rr]=a2c(ap,bp,ar,0)
%ap/bp is the denominator/numerator polynomial of the plant.
%ar is the reference characteristic polynomial of the closed loop.
%unc is the order of coefficient of the denominator polynomial of controller to be set unity, normally 0 or nc.
%aa is the characteristic polynomial of the closed loop with the designed controller. 
%ac/bc is the denominator/numerator polynomial of the designed controller.
%g is stability index, tau is equivalent time constant, gs is stability limit.
%rr is roots of the characteristic polynomial.
[m,n]=size(bp);mp=n-1;
[m,n]=size(ap);np=n-1;
[m,n]=size(ar);nn=n-1;
nc=nn-np;
mc=np-1;
pp=zeros(nn+1,nn+1);
for i=1:nc+1,for j=1:1+np,pp(i,j+nn-nc-np+i-1)=ap(j);end,end;
for i=1:mc+1,for j=1:1+mp,pp(i+nc+1,j+nn-mc-mp+i-1)=bp(j);end,end;
llk=ar/pp;
lk=(1/llk(nc+1-unc))*llk;
aa=lk*pp;
bc=lk(nc+2:nc+mc+2);
ac=lk(1:nc+1);
g=zeros(1,nn-1);gs=zeros(1,nn-1);
for i=1:nn-1,g(i)=aa(i+1)^2/aa(i)/aa(i+2);end;
if nn<=2 gs(1)=0;else gs(1)=1/g(2);gs(nn-1)=1/g(nn-2);for i=2:nn-2,gs(i)=1/g(i-1)+1/g(i+1);end;end;
tau=aa(nn)/aa(nn+1);
rr=roots(aa);
