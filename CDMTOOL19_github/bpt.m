function [bpp]=bpt(aa)
%aa=[1 2 2 1 0.2];bpt=bp(aa)
%aa is any polynomial.
%bpp is break points corresponding to each term of aa.
[m,n]=size(aa);nbpt=n-1;
bpp=zeros(1,nbpt);
for i=1:nbpt,bpp(i)=aa(i+1)/aa(i);end;
