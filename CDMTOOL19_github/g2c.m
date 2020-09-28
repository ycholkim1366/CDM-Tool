function    [bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,unc)
%siso:  ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;[bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,0)
%siso:  ap=[1 0 0 0];bp=[1 0.1];gr=[2 2 2 2.5];nc=1;mc=1;t=[2 0];[bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,0)
%simo (miso, mimo):  ap=[1 0 2 0];bp=[0 0 1; 1 0 1];gr=[2 2 2.5];nc=1;mc=[1;0];t=1;[bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,0)
%ap is the denominator polynomial of the plant.
%bp is the numerator matrix of the plant, where each row specifies the numerator polymoial 
%corresponding to the respective output. 
%nc is the order of the denominator polynomial of the controller. 
%mc is the column vector for the order of numerator of the controller, where each row specifies 
%the order of numerator polynomial corresponding to the respective output.
%gr is the reference stability index.  
%t is the equivalent time constant. 
%If t is specified as a vector, the left-end value specifies the equivalent time constant of higher order.
%unc is the order of coefficient of the denominator polynomial of controller to be set unity, normally 0 or nc.
%aa is the characteristic polynomial of the closed loop with the designed controller. 
%ac is the denominator polynomial of the designed controller.
%bc is the numerator polynomial matrix for the designed controller.
%g is stability index.  tau(same as t) is equivalent time constant.  gs is the stability limit.
%rr is the roots of the characteristic polynomial.
[m,n]=size(bp);mp=n-1;mmp=m;
[m,n]=size(ap);np=n-1;
[m,n]=size(gr);ng=n;
[m,n]=size(t);nt=n-1;
mcmax=max(mc);  nn=max(np+nc,mp+mcmax);  mm=nc+sum(mc)+mmp+1; 
ti=t(1);t0=ti;
if nt>0, for i=1:nt, t0=t0*gr(ng-i+1);end;end;
gg=zeros(1,ng);ggg=zeros(1,ng);
gg(ng)=gr(ng);for i=1:ng-1,gg(ng-i)=gr(ng-i)*gg(ng-i+1);end;
ggg(ng)=gg(ng);for i=1:ng-1,ggg(ng-i)=gg(ng-i)*ggg(ng-i+1);end;
aaa=zeros(1,ng+2);
aaa(ng+2)=1;aaa(ng+1)=t0*aaa(ng+2);for i=2:ng+1,aaa(ng+2-i)=aaa(ng+2)*t0^(i)/ggg(ng+2-i);end;
ppp=zeros(mm,nn+1);
for i=0:nc,for j=0:np,ppp(nc+1-i, nn+1-i-j)=ap(np+1-j);end,end;
mme=nc+1;for k=1:mmp, mme=mme+mc(k,1)+1;
for i=0:mc(k,1),for j=0:mp,ppp(mme-i,nn+1-i-j)=bp(k,mp+1-j);end,end;end;
ia=ng-nt+3-mm;ip=nn-nt+1-mm+1;
iia=[ia ng-nt+4-mm:ng-nt+2];iip=[ip nn-nt+2-mm+1:nn-nt+1];aam=aaa(:,iia);pp1=ppp(:,iip);
while det(pp1)==0,ia=ia-1;ip=ip-1;
iia=[ia ng-nt+4-mm:ng-nt+2];iip=[ip nn-nt+2-mm+1:nn-nt+1];aam=aaa(:,iia);pp1=ppp(:,iip);end;
llk=aam/pp1;
lk=llk/llk(nc+1-unc);
aa=lk*ppp;
bc=zeros(mmp,mcmax+1);mme=nc+1;
for i=1:mmp,mme=mme+mc(i,1)+1;
for j=0:mc(i,1),bc(i,mcmax+1-j)=lk(mme-j);end;end;
ac=lk(1:nc+1);
g=zeros(1,nn-1);gs=zeros(1,nn-1);
for i=1:nn-1,g(i)=aa(i+1)^2/aa(i)/aa(i+2);end;
if nn<=2 gs(1)=0;else gs(1)=1/g(2);gs(nn-1)=1/g(nn-2);for i=2:nn-2,gs(i)=1/g(i-1)+1/g(i+1);end;end;
tau=zeros(1,nt+1); for i=0:nt,tau(nt+1-i)=aa(nn-i)/aa(nn+1-i);end;
rr=roots(aa);
