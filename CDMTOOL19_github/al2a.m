function [aa,RT]=al2a(al)
%al=[0.25 0.5 1 2 4];aa=al2a(al)
%al is Routh Table parmeter. al(i)=R(i+1)/R(i),
%and aa is the corresponding polynomial. 
%RT is Routh Table.
[m,n]=size(al);nn=n;
aa=zeros(1,nn+1);ppi=zeros(nn+1,nn+2);
aa0=1;for i=1:nn,aa0=aa0/al(i);end;
ppi(nn+1,nn+1)=aa0;ppi(nn,nn)=ppi(nn+1,nn+1)*al(nn);
for i=1:nn-1;for j=nn-i:2:nn+1,
ppi(nn-i,j)=ppi(nn-i+1,j+1)*al(nn-i)+ppi(nn-i+2,j);end;end;
aa=ppi(1,1:nn+1)+ppi(2,1:nn+1);
[g,tau,gs,rr] = a2g(aa),
RT=ppi(:,1:nn+1);
