function [time, x]=oscilacion
clear all; clc

S=30 ;
Nr=10;
A=100;
a=1.45;
Tao1=5;
Tao2=50;
dt=0.1;
inh=-1;
e=1;
to=100;
tf=10000;
time=0:dt:tf;

c=round((tf/dt)+1);
u=zeros(1,c);
x=zeros(Nr+1,c);

for j=1:c

u(j)=40*(time(j)>99)*(time(j)<4001);
 
end


for i=1:c-1
       
     funcion1=( u(i)+a*x(1,i)+inh*x(Nr+1,i));   
    x(1,i+1)=(1-(dt/Tao1))*x(1,i)+(dt/Tao1)*(A*(funcion1.^2)./(S^2+funcion1.^2)).*(funcion1>=0);
    
    for n=1:Nr-1
    if n==1
        
   funcion1=( u(i)+a*x(1,i)+inh*x(Nr+1,i));   
   x(1,i+1)=(1-(dt/Tao1))*x(1,i)+(dt/Tao1)*(A*(funcion1.^2)/(S^2+funcion1.^2))*(funcion1>=0);
   
    end
    if n>=2
    funcion2= (e*x(n-1,i)+a*x(n,i)+inh*x(Nr+1,i));
      x(n,i+1)=(1-(dt/Tao1))*x(n,i)+(dt/Tao1)*(A*(funcion2.^2)./(S^2+funcion2.^2)).*(funcion2>=0);   
    
    end
      
    end

    funcion3=(a*x(Nr,i)+e*x(Nr-1,i)+inh*x(Nr+1,i));
    
    x(Nr,i+1)=(1-(dt/Tao1))*x(Nr,i)+(dt/Tao1)*(A*(funcion3.^2)./(S^2+funcion3.^2)).*(funcion3>=0);
    x(Nr+1,i+1)=(1-(dt/Tao2))*x(Nr+1,i)+(dt/Tao2)*(A*((sum(x(1:Nr,i))).^2)./(S^2+(sum(x(1:Nr,i))).^2)) ;
    
end

plot(time,x(1,:),'r-',time,x(3,:),'g-',time,x(5,:),'b-',time,x(7,:),'m-');
end




