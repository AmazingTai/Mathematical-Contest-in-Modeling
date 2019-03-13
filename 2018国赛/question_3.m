u=zeros(16,90);
%t=1x=pi20行100列横坐标为x纵坐标为t
%s=(1/100)/(pi/20)^2;
s=0.028

fprintf('稳定性系数S为:\n');
disp(s);
for i=1:16
u(i,1)=i*pi+3;
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
%surf(x,t,U);
%set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
%xlabel('t'),ylabel('x' ),zlabel('T');
title('有限差分法解-第四层');
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

X=t(1:7,1:90);
for i = 1:6
 for j = 1:90
 	X(1,j)=0.6;X(2,j)=0.8;X(3,j)=1;X(4,j)=4;X(5,j)=8;X(6,j)=10;
 end
 end


O=U(10:16,1:90);
%surf(O);
%set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
%xlabel('t'),ylabel('x' ),zlabel('T');
%title('有限差分法解-第四层');

z=zeros(16,90);
%t=1x=pi20行100列横坐标为x纵坐标为t
%s=(1/100)/(pi/20)^2;
s=0.37

fprintf('稳定性系数S为:\n');
disp(s);
for i=1:16
z(i,1)=i*pi+15;
end; 
for j=1:90
z(1,j)=0;
end
for j=1:89
 for i=2:15
z(i,j+1)=s*z(i+1,j)+(1-2*s)*z(i,j)+s*z(i-1,j);
end
end
for j=1:90
z(16,j)=z(15,j);
end;
%disp(u);

%[x,t]=meshgrid(1:90, 1:16);
%set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
Z=z;
%surf(x,t,Z);
%set(gca,'xtick',[],'ytick',[]) %同时去掉x轴和y轴的刻度
%xlabel('t'),ylabel('x' ),zlabel('T');
%title('有限差分法解-第二层');
%disp(t)
ZZ=Z;
for ii = 1:16
	for jj = 1:90
		if(ZZ(ii,jj)<36)
			ZZ(ii,jj)=0;
		end
	end
end
ZZZ=rot90(ZZ);

for ii = 1:16
	for jj = 1:90
		if(Z(ii,jj)<37)
			ZZ(ii,jj)=37;
		end
	end
end


M=Z(7:13,1:90);

%N=t(1:16,1:90);

N=t(1:7,1:90);
for i = 1:6
 for j = 1:90
 	N(1,j)=1;N(2,j)=2.5;N(3,j)=3.5;N(4,j)=5;N(5,j)=5.5;N(6,j)=6.2;
 end
 end



surf(X,N,O);
xlabel('x2'),ylabel('x4' ),zlabel('T');
title('有限差分法解-第2,4层');