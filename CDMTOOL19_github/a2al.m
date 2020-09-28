function [al,RT]=a2al(aa)
%aa=[0.25 1 2 2 1 0.2];al=a2al(aa)
%aa is any polynomial and al is Routh Table parmeter. al(i)=R(i+1)/R(i).
%RT is Routh Table.
[m,n]=size(aa);nn=n-1;
al=zeros(1,nn);ppi=zeros(nn+1,nn+2);
for j=1:2:nn+1, ppi(1,j)=aa(j);end;
for j=2:2:nn+1, ppi(2,j)=aa(j);end;
for i=1:nn-1, al(i)=ppi(i,i)/ppi(i+1,i+1);
for j=i:2:nn+1, ppi(i+2,j)=ppi(i,j)-ppi(i+1,j+1)*al(i);end;end;
al(nn)=ppi(nn,nn)/ppi(nn+1,nn+1);
[g,tau,gs,rr] = a2g(aa),
RT=ppi(:,1:nn+1);
