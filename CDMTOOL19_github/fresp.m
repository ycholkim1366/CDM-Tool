%siso: ap=[1 0 1 0];bp=[1];ac=[0.071794 0.39230 1];bc=[1.0718 0 0.27322];w=[0.5 1 2];fresp
%simo: ap=[1 0 2 0];bp=[0 0 1;1 0 1];ac=[0.1 1];bc=[10.5 7.7;0 4.8];w=[0.5 1 2];fresp
%ap is the denominator polynomial of the plant.
%bp is the numerator matrix of the plant, where each row specifies the numerator polymoial 
%corresponding to the respective output.
%ac is the denominator polynomial of the controller.
%bc is the numerator matrix of the controller, where each row specifies the numerator polymoial 
%corresponding to the respective output of the plant.
%w is the frequency in rad/sec, where G, S, T, and phase are evaluated.
%fresp produces the magnitude response of G(open-loop), S(sensitivity function) and
%T(complementary sensitivity function), and the open-loop phase response. 
[m,n]=size(ap);np=n-1;
[m,n]=size(bp);mp=n-1;mmp=m;
[m,n]=size(ac);nc=n-1;
[m,n]=size(bc);mc=n-1;mmc=m;
nn=max(np+nc,mp+mc);
apc=conv(ac,ap);
bpc=zeros(mmp,mp+mc+1);for j=1:mmp,bpc(j,:)=conv(bc(j,:),bp(j,:));end;
aa=zeros(1,nn+1);
for i=1:np+nc+1,aa(nn-np-nc+i)=apc(i)+aa(nn-np-nc+i);end
for j=1:mmp,for i=1:mp+mc+1,aa(nn-mp-mc+i)=bpc(j,i)+aa(nn-mp-mc+i);end;end;
den=aa;
dden=apc;
nnum=zeros(1,mp+mc+1);
for j=1:mmp,nnum=nnum+bpc(j,:);end;
ww=logspace(-2,2,800);
[mag,phase]=bode(nnum,dden,ww);
db=20*log10(mag);
[tmag,tphase]=bode(nnum,den,ww);[smag,sphase]=bode(dden,den,ww);
tdb=20*log10(tmag);sdb=20*log10(smag);
nphase=phase;[m,n]=size(nphase);for i=1:m while nphase(i)>0 nphase(i)=nphase(i)-360;end;
while nphase(i)<-360 nphase(i)=nphase(i)+360;end;end; 
figure(1);
subplot(211),semilogx(ww,db,'r-',ww,tdb,'b--',ww,sdb,'k:','Linewidth',1.5),axis([0.01 100 -40 40]);title('Mag. (r- G(s), b-- T(s), k: S(s))')
grid
subplot(212),semilogx(ww,nphase,'r-','Linewidth',1.5),axis([0.01 100 -360 0]),set(gca,'ytick',[-360:90:0]);title('Phase  ( G(s) )'),
grid
[mag,phase]=bode(nnum,dden,w);
[tmag,tphase]=bode(nnum,den,w);
[smag,sphase]=bode(dden,den,w);
w,
G=mag',
Gphase=phase',
T=tmag',
S=smag',

