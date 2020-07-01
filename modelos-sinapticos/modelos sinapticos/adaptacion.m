function [time x u]=adaptacion
clear all; clc

S=30 ;
Nr=3;
A=100;
Tao1=10;
Tao2=10;
Tao3=10;
dt=0.1;
inh=-1;
e=1;
tf=10000;
time=0:dt:tf;

c=round((tf/dt)+1);
u=zeros(1,c);
x=zeros(Nr,c);

for j=1:c

u(j)=100*(time(j)>99)*(time(j)<4001);
 
end


for i=1:c-1
       
     funcion1=(u(i)+inh*x(2,i));   
    x(1,i+1)=(1-(dt/Tao1))*x(1,i)+(dt/Tao1)*(A*(funcion1.^2)./(S^2+funcion1.^2)).*(funcion1>=0);
    
     
    funcion2=(e*x(3,i));
     x(2,i+1)=(1-(dt/Tao2))*x(2,i)+(dt/Tao2)*(A*(funcion2.^2)./(S^2+funcion2.^2)).*(funcion2>=0);   
    

    funcion3=(e*x(1,i));
    
    x(3,i+1)=(1-(dt/Tao3))*x(3,i)+(dt/Tao3)*(A*(funcion3.^2)./(S^2+funcion3.^2)).*(funcion3>=0);
    
end

% plot(time,x(1,:),'r-',time,x(2,:),'g-',time,x(3,:),'b-',time,u);
end