function aq=a2aq(aa)
%aa=[1 2 2 1 0.2];aq=a2aq(aa)
%aa is any polynomial and aq is the squared polynomial.
%aq(-s^2)=a(-s)*a(s)
[m,n]=size(aa);nn=n-1;
am=zeros(1,nn+1);aq=zeros(1,nn+1);
for i=1:nn+1,am(i)=aa(i)*(-1)^(nn+1-i);end;
aaa=conv(aa,am);
for i=1:nn+1,aq(i)=aaa(2*i-1)*(-1)^(nn+1-i);end
