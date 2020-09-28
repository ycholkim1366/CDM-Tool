function tresp4(num1,num2,num3,num4,den,tmax,ty1,ty2,ty3,ty4)
%num1=[343000];num2=[-462.5 -4701.7 0];num3=[1 2.7650];num4=[0.0748302 0.29145];
%den=[462.5 5980.5 38667 100000];tmax=3;
%ty1='vd0 to theta';ty2='vd0 to sigma/e';ty3='qr to theta';ty4='qr to sigma/e';
%tresp4(num1,num2,num3,num4,den,tmax,ty1,ty2,ty3,ty4)
%function tresp produces step responses for for the transfer functions 
%specified by "den" and "num1,2,3,4",with tytle specified by "ty1,2,3,4".
clf
t=[0:tmax/300:tmax];
[y1,x,t]=step(num1,den,t);
[y2,x,t]=step(num2,den,t);
[y3,x,t]=step(num3,den,t);
[y4,x,t]=step(num4,den,t);
figure(1)
subplot(2,1,1),plot(t,y1,'r-','Linewidth',1.5);title(ty1);grid on;
subplot(2,1,2),plot(t,y2,'b-','Linewidth',1.5);title(ty2);grid on;
figure(2)
subplot(2,1,1),plot(t,y3,'k-','Linewidth',1.5);title(ty3);grid on;
subplot(2,1,2),plot(t,y4,'m-','Linewidth',1.5);title(ty4);grid on;
