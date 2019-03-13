syms x1 x2;
f=32.83+7.815*sin(0.1151*pi*x1*x2) + (-5.67)*exp(-(-6.649*x2)^2);
x=[5;6]
e=10^(-20)
[k ender]=steepest(f,x,e)

%steepest()函数在question_3_search.m