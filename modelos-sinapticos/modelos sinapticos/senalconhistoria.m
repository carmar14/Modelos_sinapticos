clear all; clc

S=30 ;
Nr=5;
A=100;
a=1.45;
Tao1=5;
Tao2=50;
dt=0.1;
e=1;

tf=10000;
time=0:dt:tf;

c=round((tf/dt)+1);
u=zeros(1,c);
x=zeros(Nr+1,c);

for j=1:c

u(j)=40*(time(j)>99)*(time(j)<4001);
 
end


for i=1:c-1
       
     funcion1=( u(i));   
    x(1,i+1)=(1-(dt/Tao1))*x(1,i)+(dt/Tao1)*(A*(funcion1.^2)./(S^2+funcion1.^2)).*(funcion1>=0);
    
    for n=1:Nr
   
    if n>=2
    funcion2= (e*x(n-1,i));
      x(n,i+1)=(1-(dt/Tao1))*x(n,i)+(dt/Tao1)*(A*(funcion2.^2)./(S^2+funcion2.^2)).*(funcion2>=0);   
    
    end
      
    end

    
    x(Nr+1,i+1)=(1-(dt/Tao2))*x(Nr+1,i)+(dt/Tao2)*(A*((sum(x(1:Nr,i))).^2)./(S^2+(sum(x(1:Nr,i))).^2)) ;
    
end

plot(time,x(1,:),'r-',time,x(2,:),'g-',time,x(3,:),'b-',time,x(6,:),'m-');