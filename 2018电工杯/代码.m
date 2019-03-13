

a=B(:,1);
b=B(:,2);
%plot(a,b);
subplot(2,3,1)
plot(a,b,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,b,'-r.')
hold on
title("国内生产总值(亿元)") 
hold on
%
a=SS(1,:);
b=SS(2,:);
%plot(a,b);
%subplot(2,3,1)
plot(a,b,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,b,'-r.')
hold on
title("海南省金融利率") 
hold on



%

c=B(:,3)
subplot(2,3,2)
plot(a,c,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,c,'-r.')
hold on
title("年末总人口(万人)") 

d=B(:,4)
subplot(2,3,3)
plot(a,d,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,d,'-r.')
hold on
title("房地产开发投资额(亿元)") 

e=[25761;23668;21926;20001];
year=[2016;2015;2014;2013];
subplot(2,3,4)
plot(year,e,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(year,e,'-r.')
hold on
title("居民可支配收入（元）")


f=[50060;47925;45757;41768;44228;41405;36567];
year2=[2016;2015;2014;2013;2012;2011;2010];
subplot(2,3,5)
plot(year2,f,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(year2,f,'-r.')
hold on
title("高等学校在校学生数")



a=S(:,1);
b=S(:,2);
%plot(a,b);
subplot(2,3,1)
plot(a,b,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,b,'-r.')
hold on
title("国内生产总值(亿元)") 
hold on

c=S(:,3)
subplot(2,3,2)
plot(a,c,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,c,'-r.')
hold on
title("年末总人口(万人)") 

d=S(:,4)
subplot(2,3,3)
plot(a,d,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,d,'-r.')
hold on
title("房地产开发投资额(亿元)") 

e=[26447;24461;	22632;	22331];
year=[2016;2015;2014;2013];
subplot(2,3,4)
plot(year,e,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(year,e,'-r.')
hold on
title("居民可支配收入（元）")


f=[13.2514000000000	;15.0559000000000;18.0565000000000;	14.6231000000000;	11.5496000000000;	12.8589000000000;	10.3855000000000;	9.41530000000000;	9.19730000000000;	9.11520000000000;	6.14870000000000];
year2=[2016;2015;2014;2013;2012;2011;2010;2009;2008;2007;2006];
subplot(2,3,5)
plot(year2,f,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(year2,f,'-r.')
hold on
title("高等学校在校学生数")
%%
%a=Untitled(:,1)
a=linspace(2013,2018,61)
c=Untitled(:,2)
plot(a,c,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,c,'-r.')
hold on
title("三亚住宅商品房平均销售价格(元/平方米)") 

a=linspace(2013,2018,61)
c=Untitled1(:,2)
plot(a,c,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
plot(a,c,'-r.')
hold on
title("海口住宅商品房平均销售价格(元/平方米)") 




% 二次拟合
% https://blog.csdn.net/renxingzhadan/article/details/53711521
figure;
t=B(:,1);
c=B(:,2);
a=polyfit(t,c,2);
ti=2001:1:2016;
ci=polyval(a,ti);
plot(t,c,'go','MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);
hold on
xlabel('年份');
ylabel('相关数据');
axis([2001 2016 20 550])
hold on
plot(ti,ci,'linewidth',2,'markersize',16)
hold on
legend('原始数据点','拟合曲线')
plot(t,c,'-r.')
hold on
sprintf('曲线方程：C=%0.5g*T^2+(%0.5g)*T+(%0.5g)',a(1),a(2),a(3));







%%%


三亚住宅商品房平均销售价格

% Min-max normalize
Xmin = min(b); Xmax = max(b);
b = (b-repmat(Xmin,16,1))./repmat(Xmax-Xmin,16,1);
Xmin = min(c); Xmax = max(c);
c = (c-repmat(Xmin,16,1))./repmat(Xmax-Xmin,16,1);
Xmin = min(d); Xmax = max(d);
d = (d-repmat(Xmin,16,1))./repmat(Xmax-Xmin,16,1);


r1=corr(b,c,'type','pearson');  
r2=corr(b,d,'type','pearson');  
r3=corr(c,d,'type','pearson');  


b=B(:,2);
c=B(:,3);
d=B(:,4);


e=[25761;23668;21926;20001];
b1=b(1:4,1);
c1=c(1:4,1);
d1=d(1:4,1);
f=[50060;47925;45757;41768;44228;41405;36567];
f1=f(1:4,1);

Xmin = min(b1); Xmax = max(b1);
b1 = (b1-repmat(Xmin,4,1))./repmat(Xmax-Xmin,4,1);
Xmin = min(c1); Xmax = max(c1);
c1 = (c1-repmat(Xmin,4,1))./repmat(Xmax-Xmin,4,1);
Xmin = min(d1); Xmax = max(d1);
d1 = (d1-repmat(Xmin,4,1))./repmat(Xmax-Xmin,4,1);
r4=corr(e,b1,'type','pearson');  
r5=corr(e,c1,'type','pearson');  
r6=corr(e,d1,'type','pearson'); 
r7=corr(e,f1,'type','pearson'); 

b=B(:,2);
c=B(:,3);
d=B(:,4);
f=[50060;47925;45757;41768;44228;41405;36567];
b2=b(1:7,1);
c2=c(1:7,1);
d2=d(1:7,1);
Xmin = min(b2); Xmax = max(b2);
b2 = (b2-repmat(Xmin,7,1))./repmat(Xmax-Xmin,7,1);
Xmin = min(c2); Xmax = max(c2);
c2 = (c2-repmat(Xmin,7,1))./repmat(Xmax-Xmin,7,1);
Xmin = min(d2); Xmax = max(d2);
d2 = (d2-repmat(Xmin,7,1))./repmat(Xmax-Xmin,7,1);
r8=corr(b2,f,'type','pearson');  
r9=corr(f,c2,'type','pearson');  
r10=corr(f,d2,'type','pearson'); 
 

%%%%%%%%%%
海口住宅商品房平均销售价格


b=B(:,2);
c=B(:,3);
d=B(:,4);
e=[26447;24461;	22632;	22331];
f=[13.2514000000000	;15.0559000000000	;18.0565000000000	;14.6231000000000	;11.5496000000000	;12.8589000000000	;10.3855000000000	;9.41530000000000	;9.19730000000000	;9.11520000000000	;6.14870000000000];
f1=f(1:4,1);
b1=b(1:4,1);
c1=c(1:4,1);
d1=d(1:4,1);

b2=b(1:11,1);
c2=c(1:11,1);
d2=d(1:11,1);

Xmin = min(b); Xmax = max(b);
b = (b-repmat(Xmin,13,1))./repmat(Xmax-Xmin,13,1);
Xmin = min(c); Xmax = max(c);
c = (c-repmat(Xmin,13,1))./repmat(Xmax-Xmin,13,1);
Xmin = min(d); Xmax = max(d);
d = (d-repmat(Xmin,13,1))./repmat(Xmax-Xmin,13,1);


r1=corr(b,c,'type','pearson');  
r2=corr(b,d,'type','pearson');  
r3=corr(c,d,'type','pearson');  

Xmin = min(b1); Xmax = max(b1);
b1 = (b1-repmat(Xmin,4,1))./repmat(Xmax-Xmin,4,1);
Xmin = min(c1); Xmax = max(c1);
c1 = (c1-repmat(Xmin,4,1))./repmat(Xmax-Xmin,4,1);
Xmin = min(d1); Xmax = max(d1);
d1 = (d1-repmat(Xmin,4,1))./repmat(Xmax-Xmin,4,1);
r4=corr(e,b1,'type','pearson');  
r5=corr(e,c1,'type','pearson');  
r6=corr(e,d1,'type','pearson'); 
r7=corr(e,f1,'type','pearson'); 

Xmin = min(b2); Xmax = max(b2);
b2 = (b2-repmat(Xmin,11,1))./repmat(Xmax-Xmin,11,1);
Xmin = min(c2); Xmax = max(c2);
c2 = (c2-repmat(Xmin,11,1))./repmat(Xmax-Xmin,11,1);
Xmin = min(d2); Xmax = max(d2);
d2 = (d2-repmat(Xmin,11,1))./repmat(Xmax-Xmin,11,1);






%%%%%%%%%%%%%
sqrs = [20.55 22.44 25.37 27.13 29.45 30.1 30.96 34.06 36.42 38.09 39.13 39.99 41.93 44.59 47.30 52.89 55.73 56.76 59.17 60.63];

%人数 单位：万人

sqjdcs = [0.6 0.75 0.85 0.90 1.05 1.35 1.45 1.60 1.70 1.85 2.15 2.20 2.25 2.35 2.50 2.60 2.70 2.85 2.95 3.10];

%机动车数 单位：万辆

sqglmj = [0.09 0.11 0.11 0.14 0.20 0.23 0.23 0.32 0.32 0.34 0.36 0.36  0.38 0.49 0.56 0.59 0.59 0.67 0.69 0.79];

%公路面积 单位：万平方千米

%glkyl = [5126 6217 7730 9145 10460 11387 12353 15750 18304 19836 21024 19490 20433 22598 25107 33442 36836 40548 42927 43462];

%公路客运量 单位：万人

%glhyl = [1237 1379 1385 1399 1663 1714 1834 4322 8132 8936 11099 11203 10524 11115 13320 16762 18673 20724 20803 21804];

%公路货运量 单位：万吨
%sanya1
sqrs=Untitled(2,:);
sqjdcs=Untitled(3,:);
sqglmj=Untitled(4,:);

sqrs=sqrs(end:-1:1);
sqjdcs=sqjdcs(end:-1:1);
sqglmj=sqglmj(end:-1:1);


%tem=[8868	7636 7473 7342	6512.03	6641.27	8069	5293	4435	3402.64	2673.28	2528.81	2215.06	1989 2049 1992];

tem=[19033	18298	17913	19465	20194	19431	19348	11132	8790	6949	5293	4432	3402	2674	2529	2215];
glkyl=tem(end:-1:1);
p = [sqrs;sqjdcs;sqglmj];  %输入数据矩阵

t = [glkyl];      %目标矩阵

%%归一化处理
[pn,minp,maxp,tn,mint,maxt] = premnmx(p,t);  %对pt矩阵进行归一化处理

dx = [-1,1;-1 1;-1,1];            %

%BP网络训练
net = newff(dx,[3,7,1],{'tansig','tansig','purelin'},'traingdx');

%%建立模型，并用梯度下降法训练

net.trainParam.show = 1000;     % 100 00轮回显示一次

net.trainParam.Lr = 0.05;       %学习速率

net.trainParam.epochs = 50000;    %最大训练轮回

net.trainParam.goal = 0.65*10^(-3);  %均方误差

net = train(net,pn,tn);        %开始训练

%%利用原始数据对BP网络仿真

an = sim(net,pn);           %用训练好的模型进行仿真

a = postmnmx(an,mint,maxt);      %把仿真到的数据还原到原始的数量级

%%对比测试
x = 2001:2016;
newk = a(1,:);
 % newh = a(2,:);
figure(1);
%subplot(2,1,1);

plot(x,newk,'r-o',x,glkyl);

legend('网络输出房价','实际房价');

xlabel('年份');

ylabel('房价');

title('运用数据学习和测试对比图');
hold on

%subplot(2,1,2);

%plot(x,newh,'r-o',x,glhyl);

%legend('网络输出货运量','实际货运量');

%xlabel('年份');

%ylabel('货运量/万吨');

%title('运用数据箱货运量学习和测试对比图');
hold on
%利用训练好的网络进行预测

%


pnew = [677.1	887.1	1014.9;
606000	693700	701500;
1047	1304	2625];

pnewn = tramnmx(pnew,minp,maxp);

%利用原始输入数据的归一化参数对新参数进行归一化

anewn = sim(net,pnewn);

%利用归一化后的数据进行仿真

anew = postmnmx(anewn,mint,maxt)+10000

%%%
%海口住宅商品房平均销售价格
sqrs=Untitled(2,:);
sqjdcs=Untitled(3,:);
sqglmj=Untitled(4,:);

sqrs=sqrs(end:-1:1);
sqjdcs=sqjdcs(end:-1:1);
sqglmj=sqglmj(end:-1:1);


tem=[8868	7636 7473 7342	6512.03	6641.27	8069	5293	4435	3402.64	2673.28	2528.81	2215.06];

%tem=[19033	18298	17913	19465	20194	19431	19348	11132	8790	6949	5293	4432	3402	2674	2529	2215];
glkyl=tem(end:-1:1);
p = [sqrs;sqjdcs;sqglmj];  %输入数据矩阵

t = [glkyl];      %目标矩阵

%%归一化处理
[pn,minp,maxp,tn,mint,maxt] = premnmx(p,t);  %对pt矩阵进行归一化处理

dx = [-1,1;-1 1;-1,1];            %

%BP网络训练
net = newff(dx,[3,7,1],{'tansig','tansig','purelin'},'traingdx');

%%建立模型，并用梯度下降法训练

net.trainParam.show = 1000;     % 100 00轮回显示一次

net.trainParam.Lr = 0.05;       %学习速率

net.trainParam.epochs = 50000;    %最大训练轮回

net.trainParam.goal = 0.65*10^(-3);  %均方误差

net = train(net,pn,tn);        %开始训练

%%利用原始数据对BP网络仿真

an = sim(net,pn);           %用训练好的模型进行仿真

a = postmnmx(an,mint,maxt);      %把仿真到的数据还原到原始的数量级

%%对比测试
x = 2004:2016;
newk = a(1,:);
 % newh = a(2,:);
figure(1);
%subplot(2,1,1);

plot(x,newk,'r-o',x,glkyl);

legend('网络输出房价','实际房价');

xlabel('年份');

ylabel('房价');

title('运用数据学习和测试对比图');
hold on

%

pnew = [1516	1726	1969;
170.2	172	173.8;
578.3	753.3	981.3];

pnewn = tramnmx(pnew,minp,maxp);

%利用原始输入数据的归一化参数对新参数进行归一化

anewn = sim(net,pnewn);

%利用归一化后的数据进行仿真

anew = postmnmx(anewn,mint,maxt)




%%灰度预测

% 
%tem=[8868	7636 7473 7342	6512.03	6641.27	8069	5293	4435	3402.64	2673.28	2528.81	2215.06];

tem=[19033	18298	17913	19465	20194	19431	19348	11132	8790	6949	5293	4432	3402	2674	2529	2215];
A=tem(end:-1:1);
%A=Untitled(2,:);
%A=Untitled(3,:);
%A=Untitled(4,:);
%A=A(end:-1:1);
B=cumsum(A);  %原始数据累加
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2; %生成累加矩阵
end
%计算待定参数的值
D=A;D(1)=[];
D=D';
E=[-C;ones(1,n-1)];
c=inv(E*E')*E*D;
c=c';
a=c(1);b=c(2);
%预测后续数据
F=[];F(1)=A(1);
for i=2:(n+10)  %只推测后10个数据，可以从此修改
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a;
end
G=[];G(1)=A(1);
for i=2:(n+3)  %只推测后10个数据，可以从此修改
    G(i)=F(i)-F(i-1);  %得到预测出来的数据
end
t1=2001:2016;
t2=2001:2019;  %多10组数据
G;
h=plot(t1,A,'o',t2,G,'-'); %原始数据与预测数据的比较
set(h,'LineWidth',1.5); 


