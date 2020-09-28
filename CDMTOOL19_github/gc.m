%siso: ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;tm=1;gc
%simo: ap=[1 0 2 0];bp=[0 0 1;1 0 1];gr=[2 2 2.5];nc=1;mc=[1;0];t=1;tm=1;gc 
%Program gc is a combination of g2c and c2g.
[bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,0);
[m,n]=size(aa);naa=n;
[m,n]=size(bp);npb=n;
ba=aa(naa)/bp(1,npb);
[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm);
ba,bc,ac,aa,g,tau,gs,rr,pmgm,wpmgm
