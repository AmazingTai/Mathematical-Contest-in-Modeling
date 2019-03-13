u=zeros(16,110);
%t=1x=pi20行100列横坐标为x纵坐标为t
%s=(1/100)/(pi/20)^2;
s=0.37

fprintf('稳定性系数S为:\n');
disp(s);
for i=1:16
u(i,1)=i*pi+15;
end; 
for j=1:110
u(1,j)=0;
end
for j=1:109
 for i=2:15
u(i,j+1)=s*u(i+1,j)+(1-2*s)*u(i,j)+s*u(i-1,j);
end
end
for j=1:110
u(16,j)=u(15,j);
end;
%disp(u);
[x,t]=meshgrid(1:110, 1:16);
%set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
U=u;
surf(x,t,U);
set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
xlabel('t'),ylabel('x' ),zlabel('T');
title('有限差分法解-第二层');
%disp(t)
UU=U;
for ii = 1:16
	for jj = 1:110
		if(UU(ii,jj)<36)
			UU(ii,jj)=0;
		end
	end
end
UUU=rot90(UU);