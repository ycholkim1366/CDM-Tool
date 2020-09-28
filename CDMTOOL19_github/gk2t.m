function tau=gk2t(ap,bp,nc,mc,gr,k0)
%ap=[0.05 0.6 1 0];bp=5;nc=1;mc=1;gr=[2 2 2.5];k0=1;tau=gk2t(ap,bp,nc,mc,gr,k0)
%ap/bp is the denominator/numerator polynomial of the plant.
%nc/mc is the order of the denominator/numerator polynomial of the controller. 
%gr is the reference stability index.
%k0 is the steady state gain of the controller.
%tau is the possible equivalent time constant.
[m,n]=size(bp);mp=n-1;
[m,n]=size(ap);np=n-1;
[m,n]=size(gr);ng=n;
nn=max(np+nc,mp+mc);
mm=nc+mc+2; 
gg=zeros(1,ng);ggg=zeros(1,ng);
gg(ng)=gr(ng);for i=1:ng-1,gg(ng-i)=gr(ng-i)*gg(ng-i+1);end;
ggg(ng)=gg(ng);for i=1:ng-1,ggg(ng-i)=gg(ng-i)*ggg(ng-i+1);end;
aab=zeros(1,ng+2);
aab(ng+2)=1;aab(ng+1)=1;for i=1:ng,aab(i)=1/ggg(i);end;
aacc=aab(:,ng+3-mm:ng+1);
pp=zeros(mm-2,nn+1);
for i=1:nc,for j=0:np,pp(nc+1-i, nn+1-i-j)=ap(np+1-j);end,end;
for i=1:mc,for j=0:mp,pp(nc+mc+1-i,nn+1-i-j)=bp(mp+1-j);end,end;
ppc=pp(:,nn+2-mm:nn);
aac=zeros(1,mm-1);aac(mm-1)=1;
ppd=zeros(1,mm-1);ppd(1)=1;ppd(mm-1)=1;
ppmm=[ppc;ppd];
aacm=ppmm\aac';
aact=aacm';
aacd=aacc.*aact;
aac0=zeros(1,nn+1);for i=0:np aac0(1,nn+1-i)=aac0(1,nn+1-i)+ap(np+1-i);end;
for i=0:mp aac0(1,nn+1-i)=aac0(1,nn+1-i)+k0*bp(mp+1-i);end;
aac00=aac0(:,nn+2-mm:nn);
aacdd=[(bp(mp+1)*k0+ap(np+1))*aacd  -aac00*aacm];
tau=roots(aacdd);

