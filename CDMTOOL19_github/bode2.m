function bode2(num1,den1,num2,den2)
%num1=[1.5 1];den1=[2.5 14.125 18.375 7.75 1];num2=[1];den2=[1.6667 8.6528 6.25 1];bode2(num1,den1,num2,den2)
%function bode2 produces requency responses for the transfer functions 
%specified by "num1 den1" and "num2 den2".
clf
ww=logspace(-2,2,800);
[m1,p1,ww]=bode(num1,den1,ww);
[m2,p2,ww]=bode(num2,den2,ww);
m1db=20*log10(m1);m2db=20*log10(m2);
p1p=p1;[m,n]=size(p1p);for i=1:m while p1p(i)>0 p1p(i)=p1p(i)-360;end;
while p1p(i)<-360 p1p(i)=p1p(i)+360;end;end;
p2p=p2;[m,n]=size(p2p);for i=1:m while p2p(i)>0 p2p(i)=p2p(i)-360;end;
while p2p(i)<-360 p2p(i)=p2p(i)+360;end;end; 
figure(1);
subplot(211),semilogx(ww,m1db,'w-',ww,m2db,'w--','Linewidth',1.5),axis([0.01 100 -60 20]);title('Mag. (w- G1(s), w-- G2(s))')
grid
subplot(212),semilogx(ww,p1p,'w-',ww,p2p,'w--','Linewidth',1.5),axis([0.01 100 -360 0]),set(gca,'ytick',[-360:90:0]);title('Phase  (w- G1(s), w-- G2(s))' ),
grid
