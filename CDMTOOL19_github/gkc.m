%ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;k0=10;tm=1;gkc
%Proglam gkc is a combination of gk2c and c2g.
[bc,ac,aa,g,tau,gs,rr]=gk2c(ap,bp,nc,mc,gr,t,k0);
ba=bc(mc+1);
[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm);
ba,bc,ac,aa,g,tau,gs,rr,pmgm,wpmgm
