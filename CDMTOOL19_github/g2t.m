function tau=g2t(ap,bp,nc,mc,gr)
%ap=[0.25 1.25 1 0];bp=1;gr=[4 2 2.5];nc=1;mc=1;tau=g2t(ap,bp,nc,mc,gr)
%ap/bp is the denominator/numerator polynomial of the plant.
%nc/mc is the order of the denominator/numerator polynomial of the controller. 
%gr is the reference stability index.
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
aacc=aab(:,ng+2-mm:ng+2);
pp=zeros(mm,nn+1);
for i=0:nc,for j=0:np,pp(nc+1-i, nn+1-i-j)=ap(np+1-j);end,end;
for i=0:mc,for j=0:mp,pp(nc+mc+2-i,nn+1-i-j)=bp(mp+1-j);end,end;
ppc=pp(:,nn+1-mm:nn+1);
aac=zeros(1,mm+1);aac(mm+1)=1;
ppd=zeros(1,mm+1);ppd(1)=1;ppd(mm)=1;
ppmm=[ppc;ppd];
aacm=ppmm\aac';
aact=aacm';
aacd=aacc.*aact;
tau=roots(aacd);

