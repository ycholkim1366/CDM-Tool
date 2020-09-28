function  [aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm)
%siso: ap=[1 0 1 0];bp=[1];ac=[0.071794 0.39230 1];bc=[1.0718 0 0.27322];ba=[0.27322];tm=1;[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm)
%simo: ap=[1 0 2 0];bp=[0 0 1;1 0 1];ac=[0.1 1];bc=[10.5 7.7;0 4.8];ba=12.5;tm=1;[aa,g,tau,gs,rr,pmgm,wpmgm]=c2g(ap,bp,ac,bc,ba,tm)
%ap is the denominator polynomial of the plant.
%bp is the numerator matrix of the plant, where each row specifies the numerator polymoial 
%corresponding to the respective output.
%ac is the denominator polynomial of the controller.
%bc is the numerator matrix of the controller, where each row specifies the numerator polymoial 
%corresponding to the respective output of the plant.
%ba is the numerator polynomial for the command input.
%tm specifies the time scale of time response figure; normal value is 1 or 0.5.
%aa is the characteristic polynomial of the closed loop with the designed controller. 
%g is stability index.  tau is equivalent time constant.  gs is stability limit.
%rr is roots of the characteristic polynomial.
%pmgm is phase/gain margin.  wpmgm is the frequency for pm/gm.
[m,n]=size(ap);np=n-1;
[m,n]=size(bp);mp=n-1;mmp=m;
[m,n]=size(ac);nc=n-1;
[m,n]=size(bc);mc=n-1;mmc=m;
nn=max(np+nc,mp+mc);
apc=conv(ac,ap);
for j=1:mmp,bpc(j,:)=conv(bc(j,:),bp(j,:));end;
aa=zeros(1,nn+1);
for i=1:np+nc+1,aa(nn-np-nc+i)=apc(i)+aa(nn-np-nc+i);end
for j=1:mmp,for i=1:mp+mc+1,aa(nn-mp-mc+i)=bpc(j,i)+aa(nn-mp-mc+i);end;end;
g=zeros(1,nn-1);gs=zeros(1,nn-1);
for i=1:nn-1,g(i)=aa(i+1)^2/aa(i)/aa(i+2);end;
if nn<=2 gs(1)=0;else gs(1)=1/g(2);gs(nn-1)=1/g(nn-2);for i=2:nn-2,gs(i)=1/g(i-1)+1/g(i+1);end;end;
tau=aa(nn)/aa(nn+1);
rr=roots(aa);
den=aa;
num=conv(ba,bp(1,:));
dden=apc;
nnum=zeros(1,mp+mc+1);
for j=1:mmp,nnum=nnum+bpc(j,:);end;
w=logspace(-2,2,800);
[mag,phase]=bode(nnum,dden,w);
db=20*log10(mag);
[gm,pm,wcp,wcg]= margin(mag, phase,w);
pmgm=[pm gm];
wpmgm=[wcg wcp];
[wmag,wphase]=bode(nnum,den,w);[smag,sphase]=bode(dden,den,w);
wdb=20*log10(wmag);sdb=20*log10(smag);
nphase=phase;[m,n]=size(nphase);for i=1:m while nphase(i)>0 nphase(i)=nphase(i)-360;end;
while nphase(i)<-360 nphase(i)=nphase(i)+360;end;end; 
figure(1);
subplot(221),semilogx(w,db,'r-',w,wdb,'b--',w,sdb,'k:','Linewidth',1.5),axis([0.01 100 -40 40]);title('Mag. (r- G(s), b-- T(s), k: S(s))')
grid
subplot(223),semilogx(w,nphase,'r-','Linewidth',1.5),axis([0.01 100 -360 0]),set(gca,'ytick',[-360:90:0]);title('Phase  ( G(s) )'),
grid
t=0:0.05*tau*tm:10*tau*tm;
y=step(num,den,t);y1=step(nnum,den,t);
subplot(222),plot(t,y,'r-',t,y1,'b--','Linewidth',1.5),title('Step  (r- W(s), b-- T(s))')
grid
subplot(224),plot(rr,'r*','Linewidth',1.5),title('Closed-loop poles')
grid
%figure(3);
%subplot(211),semilogx(w,db,'w-',w,wdb,'w--'),axis([0.01 100 -40 40]);title('Magnitude response  - open,  --- close'); ylabel('dB')
%grid
%subplot(212),semilogx(w,nphase,'w-'),axis([0.01 100 -360 0]),set(gca,'ytick',[-360:90:0]);title('Phase response');xlabel('rad / sec');ylabel('degree');
%grid
%den,nnum
