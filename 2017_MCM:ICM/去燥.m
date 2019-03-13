clear
[A,B]=imread('/Users/amazingtai/Desktop/chai.png');
X=imnoise(A,'gaussian',0.001);
subplot(1,3,1),imshow(A,B),title('原图')  
subplot(1,3,2),imshow(X,B),title('高斯白燥')
X=double(X);
[ii,jj,zz]=size(X);
if zz==3
for i=1:ii
for j=1:jj
 X(i,j)=0.3*X(i,j,1)+0.59*X(i,j,2)+0.11*X(i,j,3);
end
end
end
for i=2:ii-1
for j=2:jj-1
temp=[X(i-1,j-1) X(i-1,j) X(i-1,j+1) X(i,j-1) X(i,j) X(i,j+1) X(i+1,j-1) X(i+1,j) X(i+1,j+1)];
X_filter(i,j)=mean(mean(temp));
end
end
X_filter=uint8(X_filter);
subplot(1,3,3);imshow(X_filter),title(' 去除噪声 二值灰质') 

%%

[A,B]=imread('/Users/amazingtai/Desktop/chai.png');
X = A;
subplot(1,2,1),imshow(A,B),title('原图')  
X=double(X);
[ii,jj,zz]=size(X);
if zz==3
for i=1:ii
for j=1:jj
 X(i,j)=0.3*X(i,j,1)+0.59*X(i,j,2)+0.11*X(i,j,3);
end
end
end
for i=2:ii-1
for j=2:jj-1
temp=[X(i-1,j-1) X(i-1,j) X(i-1,j+1) X(i,j-1) X(i,j) X(i,j+1) X(i+1,j-1) X(i+1,j) X(i+1,j+1)];
X_filter(i,j)=mean(mean(temp));
end
end
X_filter=uint8(X_filter);
subplot(1,2,2);imshow(X_filter),title(' 去除噪声 二值灰质') 



