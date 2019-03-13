u=zeros(16,90);
%t=1x=pi20行100列横坐标为x纵坐标为t
%s=(1/100)/(pi/20)^2;
s=0.37

fprintf('稳定性系数S为:\n');
disp(s);
for i=1:16
u(i,1)=i*pi+15;
end; 
for j=1:90
u(1,j)=0;
end
for j=1:89
 for i=2:15
u(i,j+1)=s*u(i+1,j)+(1-2*s)*u(i,j)+s*u(i-1,j);
end
end
for j=1:90
u(16,j)=u(15,j);
end;
%disp(u);
[x,t]=meshgrid(1:90, 1:16);
%set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
U=u;
surf(x,t,U);
set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
xlabel('t'),ylabel('x' ),zlabel('T');
title('有限差分法解-第二层');
%disp(t)
UU=U;
for ii = 1:16
	for jj = 1:90
		if(UU(ii,jj)<36)
			UU(ii,jj)=0;
		end
	end
end
UUU=rot90(UU);

for ii = 1:16
	for jj = 1:90
		if(U(ii,jj)<37)
			UU(ii,jj)=37;
		end
	end
end

X=t(1:6,1:90);
for i = 1:6
 for j = 1:90
 	X(1,j)=0.6;X(2,j)=0.8;X(3,j)=1;X(4,j)=4;X(5,j)=8;X(6,j)=10;
 end
 end


O=U(7:13,1:25);
Y=t(1:16,1:90);
surf(O);
set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
xlabel('t'),ylabel('x' ),zlabel('T');
title('有限差分法解-第二层');
