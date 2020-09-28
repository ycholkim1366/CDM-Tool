function rresp2(num1,den1,num2,den2,tmax)
%num1=[0.4];den1=[1 1 0.4];num2=[0.4];den2=[1 1.3416 0.4];tmax=20;rresp2(num1,den1,num2,den2,tmax)
%function rresp2 produces step responses for the transfer functions 
%specified by "num1 den1" and "num2 den2".
clf
t=[0:tmax/300:tmax];
[y1,x,t]=step(num1,den1,t);
[y2,x,t]=step(num2,den2,t);
plot(t,y1,'r-',t,y2,'b--','Linewidth',1.5);
grid on
