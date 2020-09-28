function   vm=convvm(vv,mm)
%vv=[1 1];mm=[2 1;1 0];vm=convvm(vv,mm)
%vv is a vector. mm is a matrix.
% Each row vector of vm is a convolution of vv and coresponding row vector of mm.
[m,n]=size(mm);mmm=m;nmm=n;
[m,n]=size(vv);nvv=n;
vm=zeros(mmm,nmm+nvv-1);
for i=1:mmm, vm(i,:)=conv(vv,mm(i,:));end
