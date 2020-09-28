function rresp3(num1,den1,num2,den2,num3,den3,tmax)
%num1=[0.2];den1=[1 2 2 1 0.2];num2=[0.2];den2=[1 0.72904 2.26572 1.05182 0.2];num3=[0.2];den3=[1 2.4869 3.0923 1.1987 0.2];
%tmax=30;rresp3(num1,den1,num2,den2,num3,den3,tmax)
%function rresp3 produces step responses for the transfer functions 
%specified by "num1,2,3" and "den1,2,3".
clf
t=[0:tmax/300:tmax];
[y1,x,t]=step(num1,den1,t);
[y2,x,t]=step(num2,den2,t);
[y3,x,t]=step(num3,den3,t);
plot(t,y1,'r-',t,y2,'b--',t,y3,'k-.','Linewidth',1.5);
grid on
