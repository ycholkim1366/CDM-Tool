function tresp(num1,num2,den,tmax)
%num1=[0 0.2];num2=[1 0];den=[1 2 2 1 0.2];tmax=20;tresp(num1,num2,den,tmax)
%function tresp produces step responses for for the transfer functions 
%specified by "den" and "num1 num2".
%The number of curves corresponds to the sum of the row numbers of "num1"
%and "num2".
clf
t=[0:tmax/300:tmax];
[y1,x,t]=step(num1,den,t);
[y2,x,t]=step(num2,den,t);
plot(t,y1,'r-',t,y2,'b--','Linewidth',1.5);
grid on
