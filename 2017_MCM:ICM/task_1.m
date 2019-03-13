clear;                   
[A,map]=imread('/Users/amazingtai/Desktop/chai.png');                
x=rgb2gray(A);  
%画出原始图像  
subplot(1,3,1);imshow(x);
title('原始图像');  
%下面进行图像的去噪处理  
%用小波函数sym4对x进行2层小波分解  
[c,s]=wavedec2(x,2,'sym4');  
%提取小波分解中第一层的低频图像，即实现了低通滤波去噪  
a1=wrcoef2('a',c,s,'sym4');  % a1为 double 型数据；
%画出去噪后的图像  
subplot(1,3,2); imshow(uint8(a1)); % 注意 imshow()和image()显示图像有区别，imshow()不能显示 double 型数据，必须进行转换 uint8(a1)；
title('第一次去噪图像');           % 并且image() 显示图像有坐标；
%提取小波分解中第二层的低频图像，即实现了低通滤波去噪  
%相当于把第一层的低频图像经过再一次的低频滤波处理  
a2=wrcoef2('a',c,s,'sym4',2);  
%画出去噪后的图像  
subplot(1,3,3); imshow(uint8(a2)); %image(a2);
title('第二次去噪图像');