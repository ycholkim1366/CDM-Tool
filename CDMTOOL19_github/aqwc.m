%aq=[0.13598 13.772 35.757 221.25 470.38 400];ap=[0.25 1.25 1 0];bp=[0.1 1];aqwc
%Program aqwc produces weights (for LQR) and controller from the the squared polynomial aq.
%aq is the squared polynomial of the characteristic polynomial aa.
%apq is the squared polynomial of the plant denominator polynomial ap.
%bpq is the squared polynomial of the plant denominator polynomial bp.
%qu is the weights polynomial for u in LQR design.
%qy is the weights polynomial for y In LQR design.
%In LQR, R=qu(1), Q=diag([qu(2) ... qu(nc+1) qy(1) ... qy(np)]).
apq=a2aq(ap);bpq=a2aq(bp);
[m,n]=size(apq);np=n-1;[m,n]=size(aq);nn=n-1;unc=nn-np;
[bc,ac,aa,g,tau,gs,rr]=a2c(apq,bpq,aq,unc);kk=aq(1)/ac(1)/apq(1);qu=ac*kk;qy=bc*kk;
%[bc,ac,aa,g,tau,gs,rr]=a2c(apq,bpq,aq,0);kk=aq(1)/ac(1)/apq(1);qu=ac*kk;qy=bc*kk;
[aa,g,tau,gs,rr]=aq2a(aq);
[bcc,acc,aaa,g,tau,gs,rr]=a2c(ap,bp,aa,0);kk=aa(1)/acc(1)/ap(1);bc=kk*bcc;ac=kk*acc;
ba=1;tm=0.5;
[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm);
[m,n]=size(aa);nna=n;
[m,n]=size(bp);nnb=n;
ba=aa(nna)/bp(1,nnb);
[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm);
aq,apq,bpq,qu,qy,ba,bc,ac,aa,g,tau,gs,rr,pmgm,wpmgm
