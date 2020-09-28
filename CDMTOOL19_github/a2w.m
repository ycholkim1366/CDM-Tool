function [aq,apq,qq]=a2w(aa,ap)
%aa=[1 2 2 1 0.2];ap=[1 0 1 0 0];[aq,apq,qq]=a2w(aa,ap)
%The weight qq (diagonal of Q) for LQR design is calculated 
%from the characteristic polynomial aa, and plant denominator polynomial ap.
[m,n]=size(aa);nn=n-1;
am=zeros(1,nn+1);aaa=zeros(1,nn+1);apm=zeros(1,nn+1);aap=zeros(1,nn+1);qq=zeros(1,nn);
for i=1:nn+1,am(i)=(-1)^(nn+1-i)*aa(i);apm(i)=(-1)^(nn+1-i)*ap(i);end
aaaa=conv(aa,am);aaap=conv(ap,apm);
for i=1:nn+1,aq(i)=aaaa(2*i-1)*(-1)^(nn+1-i);apq(i)=aaap(2*i-1)*(-1)^(nn+1-i);end
qqq=aaaa-aaap;
for i=1:nn,qq(i)=qqq(2*i+1)*(-1)^(nn-i);end;
