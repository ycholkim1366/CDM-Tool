function  [bcp,acp,aa]=c2lp(ap,bp,ac,bc)
%ap=[1 0 -3 0 2];bp=[2 0 -2 0;1 0 -2 0 ];ac=[1 0.15 0.009];
%bc=[8.5 12 0;-12 -12 0];[bcp,acp,aa]=c2lp(ap,bp,ac,bc)
%ap is the denominator polynomial of the plant.
%bp is the numerator matrix of the plant, where each row specifies 
%the numerator polynomial corresponding to the respective output.
%ac is the denominator polynomial of the controller.
%bc is the numerator matrix of the controller, where each row specifies 
%the numerator polynomial corresponding to the respective output of the plant.
%bcp is the numerator polynomial of the controller and plant.
%acp is the dennominator polynomial of the controller and plant.
%aa is the characteristic polynomial.
[m,n]=size(ap);nnp=n-1;
[m,n]=size(ac);nnc=n-1;
[m,n]=size(bp); mmmp=m;mmp=n-1;
[m,n]=size(bc);mmc=n-1;
for j=1:mmmp, bpc(j,:)=conv(bc(j,:),bp(j,:));end;
den=conv(ac,ap);
num=zeros(1,mmp+mmc+1);
for j=1:mmmp,num=num+bpc(j,:);end;
bcp=num; acp=den;
nnum=[zeros(1,nnc+nnp-mmp-mmc) num];aa=nnum+den;
