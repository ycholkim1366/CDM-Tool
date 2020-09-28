%siso: ap=[1 0 1 0];bp=[1];ac=[0.071794 0.39230 1];bc=[1.0718 0 0.27322];tm=1;cc
%simo: ap=[1 0 2 0];bp=[0 0 1;1 0 1];ac=[0.1 1];bc=[10.5 7.7;0 4.8];tm=1;cc
%Program cc is simplified form of c2g.
ba=1;
[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm);
[m,n]=size(aa);nna=n;
[m,n]=size(bp);nnb=n;
ba=aa(nna)/bp(1,nnb);
[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm);
ba,bc,ac,aa,g,tau,gs,rr,pmgm,wpmgm
