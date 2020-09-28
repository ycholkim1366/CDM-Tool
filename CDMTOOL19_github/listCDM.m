%List of M-files for CDM

%g2a	g=[2 2 2 2.5];an=1;a0=1;[aa,aq]=g2a(g,an,a0)
%gt2a	g=[2 2 2 2.5];t=2.5;[aa,aq]=gt2a(g,t)
%a2g	aa=[1 2 2 1 0.2];[g,tau,gs,rr] = a2g(aa)
%a2aq	aa=[1 2 2 1 0.2];aq=a2aq(aa)
%aq2a	aq=[1 0 0.4 0.2 0.04];[aa,g,tau,gs,rr]=aq2a(aq)
%a2w	aa=[1 2 2 1 0.2];ap=[1 0 1 0 0];[aq,apq,qq]=a2w(aa,ap)
%aqwc   aq=[0.13598 13.772 35.757 221.25 470.38 400];
		ap=[0.25 1.25 1 0];bp=[0.1 1];aqwc
%a2c	ap=[1 0 1 0 0];bp=1;ar=[2^(-9) 2^(-5) 2^(-2) 1 2 2 1 0.2];
		[bc,ac,aa,g,tau,gs,rr]=a2c(ap,bp,ar,0)
%aq2c	ap=[1 0 1 0 0];bp=1;aq=[1 0 0 0 0 0 0 1];
		[bc,ac,aa,g,tau,gs,rr]=aq2c(ap,bp,aq,0)
%g2t	ap=[0.25 1.25 1 0];bp=1;gr=[4 2 2.5];nc=1;mc=1;
		tau=g2t(ap,bp,nc,mc,gr)
%gk2t	ap=[0.05 0.6 1 0];bp=5;nc=1;mc=1;gr=[2 2 2.5];k0=1;
		tau=gk2t(ap,bp,nc,mc,gr,k0)
%g2c	ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;
		[bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,0)
		ap=[1 0 0 0];bp=[1 0.1];gr=[2 2 2 2.5];nc=1;mc=1;t=[2 0];
		[bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,0)
		ap=[1 0 2 0];bp=[0 0 1; 1 0 1];gr=[2 2 2.5];nc=1;mc=[1;0];t=1;
		[bc,ac,aa,g,tau,gs,rr]=g2c(ap,bp,nc,mc,gr,t,0)
%gk2c	ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;k0=10;
		[bc,ac,aa,g,tau,gs,rr]=gk2c(ap,bp,nc,mc,gr,t,k0)
%c2g	ap=[1 0 1 0];bp=[1];ac=[0.071794 0.39230 1];bc=[1.0718 0 0.27322];ba=0.27322;tm=1;
		[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm)
		ap=[1 0 2 0];bp=[0 0 1;1 0 1];ac=[0.1 1];bc=[10.5 7.7;0 4.8];ba=12.5;tm=1;
		[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm)
%gc		ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;tm=1;gc
		ap=[1 0 2 0];bp=[0 0 1;1 0 1];gr=[2 2 2.5];nc=1;mc=[1;0];t=1;tm=1;gc 
%gkc	ap=[0.25 1.25 1 0];bp=1;gr=[2 2 2 2.5];nc=2;mc=2;t=0.77314;k0=10;tm=1;gkc
%cc		ap=[1 0 1 0];bp=[1];ac=[0.071794 0.39230 1];bc=[1.0718 0 0.27322];tm=1;cc
		ap=[1 0 2 0];bp=[0 0 1;1 0 1];ac=[0.1 1];bc=[10.5 7.7;0 4.8];tm=1;cc
%a2al	aa=[0.25 1 2 2 1 0.2];[al,RT]=a2al(aa)
%al2a	al=[0.25 0.5 1 2 4];[aa,RT]=al2a(al)
%ozawasim	Example of simulation
%ozawa		Dynamic model for the above simulation

%cdia	aa=[1 2 2 1 0.2];[g,tau,gs] = cdia(aa)
%tresp	num1=[0 0.2];num2=[1 0];den=[1 2 2 1 0.2];tmax=20;
		tresp(num1,num2,den,tmax)
%tresp4	num1=[343000];num2=[-462.5 -4701.7 0];num3=[1 2.7650];num4=[0.0748302 0.29145];
		den=[462.5 5980.5 38667 100000];tmax=3;
		ty1='vd0 to theta';ty2='vd0 to sigma/e';ty3='qr to theta';ty4='qr to sigma/e';
		tresp4(num1,num2,num3,num4,den,tmax,ty1,ty2,ty3,ty4)
%convvm	vv=[1 1];mm=[2 1;1 0];vm=convvm(vv,mm)
%bpt	aa=[1 2 2 1 0.2];bpp=bpt(aa)
%rresp2	num1=[0.4];den1=[1 1 0.4];num2=[0.4];den2=[1 1.3416 0.4];tmax=20;
		rresp2(num1,den1,num2,den2,tmax)
%rresp3	num1=[0.2];den1=[1 2 2 1 0.2];
		num2=[0.2];den2=[1 0.72904 2.26572 1.05182 0.2];
		num3=[0.2];den3=[1 2.4869 3.0923 1.1987 0.2];tmax=30;
		rresp3(num1,den1,num2,den2,num3,den3,tmax)
%fresp  ap=[1 0 1 0];bp=[1];ac=[0.071794 0.39230 1];bc=[1.0718 0 0.27322];w=[0.5 1 2];fresp
		ap=[1 0 2 0];bp=[0 0 1;1 0 1];ac=[0.1 1];bc=[10.5 7.7;0 4.8];w=[0.5 1 2];fresp
%c2lp	ap=[1 0 -3 0 2];bp=[2 0 -2 0;1 0 -2 0 ];ac=[1 0.15 0.009];bc=[8.5 12 0;-12 -12 0];
		[bcp,acp,aa]=c2lp(ap,bp,ac,bc)
%lp		ap=[1 0 -3 0 2];bp=[2 0 -2 0;1 0 -2 0 ];ac=[1 0.15 0.009];bc=[8.5 12 0;-12 -12 0];
		lp
%bode2	num1=[1.5 1];den1=[2.5 14.125 18.375 7.75 1];num2=[1];den2=[1.6667 8.6528 6.25 1];
		bode2(num1,den1,num2,den2)
