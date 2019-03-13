function [D,R]=floyd(a)
n=size(a,1); 
D=a; 
for i=1:n 
    for j=1:n 
        R{i,j}=[num2str(i), num2str(j)]; 
    end 
end 
for k=1:n 
    for i=1:n 
        for j=1:n 
            if D(i,k)+D(k,j)<D(i,j) 
                D(i,j)=D(i,k)+D(k,j); 
                l=length(R{i,k})-length(num2str(k));
                R{i,j}=[R{i,k}(1:l),R{k,j}]; 
            end 
        end 
    end 

end

p=xlsread('/Users/amazingtai/Desktop/城区A数据.xlsx');
x=p(:,1);
y=p(:,2);
i=p(:,3);
j=p(:,4);
A=zeros(92,92);
for k=1:140
    a=i(k);
    b=j(k);
    A(a,b)=1;
    A(b,a)=1;
end  
AA=zeros(92,92);
for k=1:140
    a=i(k);
    b=j(k);
    AA(a,b)=1;
    AA(b,a)=1;
end  
%A连通图
%A=zeros(92,92);
for m=1:92
    for n=1:92
        if(A(m,n)==1)
            A(m,n)=sqrt((x(m)-x(n))^2+(y(m)-y(n))^2);   
           
        else
            A(m,n)=9999;
            
        end
    end
end
[D,path]=floyd(A);






for ii=1:20 
    B=[x(1:ii),y(1:ii)]
end
for jj=1:92
    C=[x(1:jj),y(1:jj)]
end

Q=zeros(92,92);


for m=1:20
    for n=1:92
        if(AA(m,n)==1 & sqrt((B(m,1)-C(n,1))^2 + (B(m,2)-C(n,2))^2) < 30)
        %Q(m,1)=m;
        Q(m,n)=n;
        %else
        %Q(m,1)=m;
        %AA(m,n)=9999;
        end
    end
 end   



x3=[1 2 40 43 44 67 68 69 70 71 72 74 75 76 78 89]; 
B=xlsread('/Users/amazingtai/Desktop/城区A数据.xlsx','Sheet1','A','B'); 
C=xlsread('/Users/amazingtai/Desktop/城区A数据.xlsx','Sheet2');  %计算x3中各点之间的邻接矩阵 
A1=zeros(92,92)+inf; 
for i=1:92    
    A1(i,i)=0; 
end 
[m n]=size(C);
 for i=1:m    
  if find(C(i,1)==x3)&find(C(i,2)==x3)         
    A1(C(i,1),C(i,2))=sqrt((B(C(i,1),2)-B(C(i,2),2))^2+(B(C(i,1),3)-B(C(i,2),3))^2); 
    A1(C(i,2),C(i,1))=A1(C(i,1),C(i,2));   
  end 
 end   
    %a3=dijkf2(A1)/10; %增设服务平台的计算 
     s=size(x3,2); 
  for tt=3:s     

    t=x3(tt);     
[m n]=size(a3);     
D3=triu(a3);     
for i=1:m        
 for j=1:n          
   if i>=j             
    D3(i,j)=inf;          
   end         
  end    
 end     
       for i=1:m         
        for j=1:n             
            if i~=1&i~=2&i~=t                 
                D3(i,j)=inf;             
            end         
         end     
       end    
             F3=zeros(m,n);   
               for j=21:n       
                k=1;       
                 if min(D3(:,j))~=inf           
                   [r,c]=find(D3==min(D3(:,j)));             
                   r=r(find(c==j));            
                   c=j;             
                while 1              
                   if F3(r,k)~=0;                  
                      k=k+1;                
                   else                 
                      break;              
                        end            
                    end           
              F3(r,k)=c;     
                 end    
               end    
   %  xlswrite('A1增设服务平台.xlsx',F3,[num2str(t)]);    
      [m n]=size(F3);     
      d3=zeros(1,t)';     
       for i=1:m 
            if F3(i,j)~=0            
                 d3(i)=d3(i)+a3(i,F3(i,j));         
                     end         
                     end   
                       end    
                   %     xlswrite('A1增设服务平台.xlsx',d3,[num2str(t)],'L1'); 
                        end    













