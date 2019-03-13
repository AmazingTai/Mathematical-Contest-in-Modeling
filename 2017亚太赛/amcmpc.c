 A=[129.8665,-55.2435,1.7436,-297.3908;52.5130,-5.7480,0.7394,-128.6368;59.7245,393.9655,-0.1244,150.0184;-7.0125,34.5045,0.0284,-9.5229;-4.6130,18.3620,0.0113,-0.3924 ];
B=[0.2;0.2;225;1];
C=A * B
a=C(1,1);
b=C(2,1);


function [s,phis,k,G,E]=golds(phi,a,b,delta,epsilon) 
   t=((5)^(1/2)-1)/2;  
   h=b-a; 
   phia=feval(phi,a); 
   phib=feval(phi,b); 
  p=a+(1-t)*h; q=a+t*h; 
  phip=feval(phi,p); 
  phiq=feval(phi,q); 
   k=1; 
   G(k,:)=[a, p, q, b]; 
while(abs(phib-phia)>epsilon)||(h>delta) 
 if(phip<phiq) 
      b=q; phib=phiq; q=p; phiq=phip; 
      h=b-a; p=a+(1-t)*h; phip=feval(phi,p); 
else 
    a=p; phia=phip; p=q; phip=phiq; 
    h=b-a; q=a+t*h; phiq=feval(phi,q); 
end 
k=k+1; G(k,:)=[a, p, q, b]; 
end 
ds=abs(b-a); dphi=abs(phib-phia); 
if(phip<=phiq) 
   s=p; phis=phip; 
else 
  s=q; phis=phiq; 
end
E=[ds,dphi];


function [r,m]=mulGSND(F,x0,h,eps) 
format long; 
if nargin==3 
     eps=1.0e-8; 
end 
n=length(x0); 
x0=transpose(x0); 
m=1; 
tol=1; 
while tol>eps 
fx=subs(F,findsym(F),x0); 
J=zeros(n,n); 
for i=1:n 
x1 = x0; 
x1(i) = x1(i)+h; 
J(:,i) = (subs(F,findsym(F),x1)-fx)/h; 
end 
     DF=inv(transpose(J)*J)*transpose(J); 
     r=x0-DF*fx;  
     tol=norm(r-x0); 
     x0=r; 
     m=m+1; 
if(m>100000)                                                      
disp('迭代步数太多，可能不收敛！'); 
         return; 
end 
End

%%%
clear
syms x y z;
f=-z - x^2 + x - x*y;
z=solve(f,'z');
for p =1:length(z)
ezmesh(z(p));
axis([-10 10 -10 10 -90 10]);

hold on
zlabel('z');
hold
end   %问题二里的图像。 %13.24。-85.24
mesh(x,y);
hold on  %tu
%%%

%%%
syms x y z;
f=-z+exp(-9*x.^2/(2*a*a));
z=solve(f,'z');
for p=1:length(z)
 mesh (z(p));
 hold on
 end
%%%
[x,y]=meshgrid(-a:0.1:a);
z=exp(-9*x.^2/(2*a*a));
mesh(x,y,z);
hold on
x1=-a+73:0.1:a+73;
z1=exp(-9*x1.^2/(2*a*a));
mesh(x1,y1,z1);
hold on
&&&

 A=[129.8665,-55.2435,1.7436,-297.3908;52.5130,-5.7480,0.7394,-128.6368;59.7245,393.9655,-0.1244,150.0184;-7.0125,34.5045,0.0284,-9.5229;-4.6130,18.3620,0.0113,-0.3924 ];
B=[0.2;0.2;225;1];
C=A * B

%%
syms x y z;
f = 212.7664*(1-x^2/109.8438)^1.3655 * (1-y^2/(47.0812*(1-x^2/109.8438))) -z;
z=solve(f,'z');
for p =1:length(z)
ezmesh(z(p));
%surfl(x,y,z)
hold on
end
zlabel('z');
hold on
xlabel('x');
ylabel('y');
%%. %tu 拱形


surfl(x,y,z)
x(z==max(max(z)))  %z最大值所对应的x坐标；
y(z==max(max(z)))  %z最大值所对应的y坐标；
x(z==min(min(z)))  %z最小值所对应的x坐标；
y(z==min(min(z)))  %z最小值所对应的y坐标；

syms x y;
%%%
ezplot(212.7664*(1-x^2/109.8438)^1.3655 * (1-y^2/(47.0812*(1-x^2/109.8438))),[-12,12,0,8])
hold on
%%%

 A=[129.8665,-55.2435,1.7436,-297.3908;52.5130,-5.7480,0.7394,-128.6368;59.7245,393.9655,-0.1244,150.0184;-7.0125,34.5045,0.0284,-9.5229;-4.6130,18.3620,0.0113,-0.3924 ];
B=[0.2,0.2,175+212.7664*(1-x^2/109.8438)^1.3655 * (1-y^2/(47.0812*(1-x^2/109.8438))),1];
A * B;

%只算第三行的表达式
syms x y z;
f= 175 + 212.7664*(1-x^2/109.8438)^1.3655 * (1-y^2/(47.0812*(1-x^2/109.8438)));
ans = f * A;

B=[0;0;0;0]
for i=1:5
 for j = 1:4
 B(1:j)=vpa(A(i,j)*f);
 end
end


%求积分 

syms x C
 int(175 + 212.7664*(1-x^2/109.8438)^1.3655 * (1-y^2/(47.0812*(1-x^2/109.8438))))
 
 syms x C
 int(  (1-y^2/(47.0812*(1-x^2/109.8438))))
 1-
syms x C
 int(  (1-y^2/(47.0812*(1-x^2/109.8438))))
 syms x C

int ((1-x^2/(47.0812*(1-y^2/109.8438))))
  format short

x - (16777216*7729570261702489^(1/2)*y^2*atanh((8388608*7729570261702489^(1/2)*x)/7729570261702489))/6626089836754869
 ans =
 
x - (16777216*7729570261702489^(1/2)*y^2*atanh((8388608*7729570261702489^(1/2)*x)/7729570261702489))/6626089836754869
 


%
syms y C;
s=0.4286*(12077.0 - 1.0*x^2)^(1/2);
int((1-y^2/(47.0812^2*(1-x^2/109.8438^2)))^3.8999,-s,s);
ans=vpa(ans,4)
%

syms y C;
int((1-y^2/(47.0812^2*(1-x^2/109.8438^2)))^3.8999)


%
syms x y1;
ezplot('exp(-9*r^2/2*a^2)',[-a,a])
hold on
%%%
x=-a:a ;
y=exp(-9*x.^2/(2*a*a))
ylabel('y');
xlabel('r');
hold on
plot(x,y)

x1=-a+73:a+73 ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on

x2=-a+146:a+146;
y2=exp(-9*x2.^2/(2*a*a));
plot(x2,y);
hold on;

y3=y1+y+y2;

%plot(y3);
y4=y3;
plot(1.0*x+73+73,y4);
hold on;
%%%  三条线
x=[0:0.1:2];
y=[0:0.1:2]; 
n=1;
m=2;
x=x*n;
y=y*m;
p=length(x);
q=length(y);
for i=1:p;
    for j=1:q;
    z(i,j)=exp(-(x(i)/a)^2-(y(j)/b)^2);;        %exp(-(x(i)/a)^2-(y(j)/b)^2); 
    X(i,j)=x(i);
    Y(i,j)=y(j);
    end;
end;
plot3(X,Y,z)


q=1;
p=2;
x=[0:0.1:2];
y=[0:0.1:2]; 
x=x*q;y=y*p;
n=length(x);
m=length(y);
for i=1:n;
    for j=1:m;
    z(i,j)=exp(-9*x(i).^2/(2*a*a)); 
    X(i,j)=x(i);
    Y(i,j)=y(j);
    end;
end;
plot3(X,Y,z)

a=1;
b=2;
x=[0:0.1:1];
y=[0:0.1:1]; 
x=x*a;y=y*b;
n=length(x);
m=length(y);
for i=1:n;
    for j=1:m;
    z(i,j)=exp(-(x(i)/a)^2-(y(j)/b)^2); X(i,j)=x(i);Y(i,j)=y(j);
    end;
end;
plot3(X,Y,z)

%%%
clear
a=109.8438;
b=47.0812;
x=[-3:0.2:3];
y=[-3:0.2:3]; 
x=x*a;y=y*b;
n=length(x);
m=length(y);
for i=1:n;
    for j=1:m;
    z(i,j)=exp(-(x(i)/a)^2-(y(j)/b)^2); X(i,j)=x(i);Y(i,j)=y(j);
    end;
end;
surf(X,Y,z)
hold on;
zlabel('z');
ylabel('y');
xlabel('x');
hold on;
%%% 圆锥




a=1;
b=2;
x=[-4:0.1:4];
y=[-4:0.1:4]; 
x=x*a;
y=y*b;
n=length(x);
m=length(y);
for i=1:n;
    for j=1:m;
    z(i,j)=exp(-(x(i)/a)^2-(y(j)/b)^2); X(i,j)=x(i);Y(i,j)=y(j);
    end;
end;
plot3(X,Y,z)

NIND=20; %种群大小
const=29; %客户个数
carload=25; %车的载重限制
MAXGEN=100; %遗传代数
GGAP=0.9; %代沟
PC=0.8; %交叉概率
PM=0.1; %变异概率
trace=[]; %结果存储数组

demand=ceil(rand(29,1)*9);
 save demand
load demand %每个客户点的需求
 distance=109.123;%xlsread('distance.xlsx');
 save distance
load distance %距离矩阵

%-----------------初始化种群-------------------% 
for i=1:NIND
chrom(i,:)=randperm(const);
end

%-----------------计算目标函数-------------------% 
visited=[];
route=ones(NIND,64)*Inf;
% route=[];
for i=1:NIND
temp=0;
j=1;
while j<=const

temp=temp+demand(chrom(i,j));
visited=[visited chrom(i,j)]; %没有超重，则按种群运货
if temp>carload
temp=0;
visited(1,size(visited,2))=0; %如果超重则回到原点
j=j-1;
end 
j=j+1;

if j==const+1
visited(1,size(visited,2)+1)=0; %使最后一点回到原点
end
end

route(i,2:size(visited,2)+1)=visited; %每个种群的行驶路线
visited=[];
end
route(:,1)=0; %使所有路线都出原点出发

%----------------计算目标函数的值---------------------%
length=zeros(NIND,1); %保存路线的长度变量
for i=1:NIND 
temp=0;
updimension=find(route(i,:)<Inf); %每条路线的最高维度
for j=1:updimension(end)-1
if route(i,j)<Inf
temp=temp+distance(route(i,j)+1,route(i,j+1)+1); %计算路线的距离
else
break %跳出本次for循环
end
end
length(i,:)=temp;
end

gen=1;

prob=length./sum(length); %归一化
prob=cumsum(prob);
%迭代开始
%%
a=109.8438;
l1=2/3*a;
l2=sqrt(3)/3*a;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a))
plot(x,y);
ylabel('y');
xlabel('r');
hold on
&一峰

%
a=109.8438;
l1=2/3*a;
l2=sqrt(3)/3*a;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a))
ylabel('y');
xlabel('r');
hold on
plot(x,y)
  
x1=-a+l1:a+l1 ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on
y2=y+y1;
plot(x*1.0+l1,y2);
hold on;
%  一问两峰

%%
a=109.8438;
l1=2/3*a;
l2=sqrt(3)/3*a;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a));
ylabel('y');
xlabel('r');
hold on
plot(x,y)
x1=-a+l1:a+l1 ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on
x2=-a+2*l1:a+l1*2;
y2=exp(-9*x2.^2/(2*a*a));
plot(x2,y);
hold on;
y3=y+y1+y2;
plot(x*1.0+l1*2,y3);
hold on;
%%一问三峰

%%
a=109.8438;
l1=2/3*a;
l2=sqrt(3)/3*a;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a));
ylabel('y');
xlabel('r');
hold on
plot(x,y)
x1=-a+l1:a+l1 ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on
x2=-a+2*l1:a+l1*2;
y2=exp(-9*x2.^2/(2*a*a));
plot(x2,y);
hold on;
x3=-a+3*l2:a+l2*3;
y3=exp(-9*x3.^2/(2*a*a));
plot(x3,y);
y4=y+y1+y2+y3;
plot(x*1.0+l2*3,y4);
hold on;
%%一问四峰



x2=-a+126.8:a+126.8;
y2=exp(-9*x2.^2/(2*a*a));
plot(x2,y);
hold on;

x3=-a+190.2:a+190.2;
y3=exp(-9*x2.^2/(2*a*a));
plot(x3,y);
hold on;


y4=y+y1+y2+y3;
plot(x*1.0+190.2,y4);
hold on;

%%
 A=[129.8665,-55.2435,1.7436,-297.3908;52.5130,-5.7480,0.7394,-128.6368;59.7245,393.9655,-0.1244,150.0184;-7.0125,34.5045,0.0284,-9.5229;-4.6130,18.3620,0.0113,-0.3924 ];
B=[0.2;0.2;275;1];
C=A * B
a=C(1,1);
b=C(2,1);
%
a=197.0238;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a))
ylabel('y');
xlabel('r');
hold on
plot(x,y)
%% 单峰
x1=-a+63.4:a+63.4 ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on

x2=-a+126.8:a+126.8;
y2=exp(-9*x2.^2/(2*a*a));
plot(x2,y);
hold on;

x3=-a+190.2:a+190.2;
y3=exp(-9*x2.^2/(2*a*a));
plot(x3,y);
hold on;


y4=y+y1+y2;
plot((x1+x2+x3)/2.1,y4);
hold on;




% 
a=197.0238;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a))
ylabel('y');
xlabel('r');
hold on
plot(x,y)

x1=-a+131.3:a+131.3 ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on
y2=y+y1;
plot(x*1.0+131,y2);
hold on;  %tu10
%

a=197.0238;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a))
ylabel('y');
xlabel('r');
hold on
plot(x,y)

x1=-a+131.3:a+131.3 ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on
x2=-a+262.6:a+262.6;
y2=exp(-9*x2.^2/(2*a*a))
plot(x2,y);
hold on;
 
y4=y+y1+y2;
plot(x*1.0+262.6,y4);
hold on;
%tu11

%
 l=113.8;
a=197.0238;
x=-a:a ;
y=exp(-9*x.^2/(2*a*a));
ylabel('y');
xlabel('r');
hold on
plot(x,y)

x1=-a+113.8:a+l ;
y1=exp(-9*x1.^2/(2*a*a));
plot(x1,y);
hold on
x2=-a+2*l:a+2*l;
y2=exp(-9*x2.^2/(2*a*a));
plot(x2,y);
hold on;
 
x3=-a+3*l:a+3*l;
y3=exp(-9*x3.^2/(2*a*a));

plot(x3,y);
hold on;
 
 y4=y+y1+y2+y3;
 plot(x*1.0+3*l,y4);
 hold on;
 % tu12






