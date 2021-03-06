function [time x]=saturacion
clear all; clc

S=30;
Nr=2;
A=100;
Tao1=5;
dt=0.1;
e=1;
tf=10000;
time=0:dt:tf;

c=round((tf/dt)+1);
u=zeros(1,c);
x=zeros(Nr,c);


for j=1:c

u(j)=40*(time(j)>99)*(time(j)<4001);

  
end


for i=1:c-1
       
     funcion1=( u(i)+e*x(2,i));   
    x(1,i+1)=(1-(dt/Tao1))*x(1,i)+(dt/Tao1)*(A*(funcion1.^2)./(S^2+funcion1.^2)).*(funcion1>=0);
    
     funcion2=(e*x(1,i));   
    x(2,i+1)=(1-(dt/Tao1))*x(2,i)+(dt/Tao1)*(A*(funcion2.^2)./(S^2+funcion2.^2)).*(funcion2>=0);
    
    
end

plot(time,x(1,:),'r-',time,x(2,:),'g-');
end