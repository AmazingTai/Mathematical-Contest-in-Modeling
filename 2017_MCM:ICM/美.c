figure()
X = [-1.5 3.2; 1.8 3.3; -3.7 1.5; -1.5 1.3; ...
      0.8 1.2; 3.3 1.5; -4.0 -1.0;-2.3 -0.7; ...
      0 -0.5; 2.0 -1.5; 3.7 -0.8; -3.5 -2.9; ...
     -0.9 -3.9; 2.0 -3.5; 3.5 -2.25];
 
voronoi(X(:,1),X(:,2))

% Assign labels to the points.
nump = size(X,1);
plabels = arrayfun(@(n) {sprintf('X%d', n)}, (1:nump)');
hold on
Hpl = text(X(:,1), X(:,2), plabels, 'FontWeight', ...
      'bold', 'HorizontalAlignment','center', ...
      'BackgroundColor', 'none');

% Add a query point, P, at (0, -1.5).
P = [0 -1];
plot(P(1),P(2), '*r');
text(P(1), P(2), 'P', 'FontWeight', 'bold', ...
     'HorizontalAlignment','center', ...
     'BackgroundColor', 'none');
hold off

%%
imagesc(aierlan)
hold on
figure()
X = [166 634; 389 731; 423 668; 487 438; ...
      498 596; 532 372; 611 512; 656 367; ...
      667 594; 684 286; 718 334; 761 326; ...
     793 314; 799 291; 825 370; 327 163; ...
     317 245; 287 342; 477 290; 292 561; ...
     334 571; 443 568; 406 734; 565 214;...
     577 171; 578 333; 780 104; 654 170; ...
     765 628];
%%flipud(X);
%%set(gca,'XDir','reverse');
voronoi(X(:,1),X(:,2))

% Assign labels to the points.
nump = size(X,1);
plabels = arrayfun(@(n) {sprintf('X%d', n)}, (1:nump)');
hold on
set(gca,'YDir','reverse');
set(gca,'color','none');

%%
imagesc(cdata)
hold on
figure()
X = [85 514; 133 454; 159 357; 238 219; ...
      259 111; 334 514; 336 401; 357 502; ...
      367 311; 411 422; 405 566; 461 451; ...
      526 290; 528 587; 546 53; 567 214; ...
      612 564];
%%flipud(X);
%%set(gca,'XDir','reverse');
voronoi(X(:,1),X(:,2))

% Assign labels to the points.
nump = size(X,1);
plabels = arrayfun(@(n) {sprintf('X%d', n)}, (1:nump)');
hold on
%%set(gca,'YDir','reverse');
set(gca,'color','none');


Hpl = text(X(:,1), X(:,2), plabels, 'FontWeight', ...
      'bold', 'HorizontalAlignment','center', ...
      'BackgroundColor', 'none');

% Add a query point, P, at (0, -1.5).
P = [0 -1];
plot(P(1),P(2), '*r');
text(P(1), P(2), 'P', 'FontWeight', 'bold', ...
     'HorizontalAlignment','center', ...
     'BackgroundColor', 'none');
hold off


k=20; 
x=rand(k,1); 
y=rand(k,1); 
z=rand(k,1); 
figure('Color','w') 
plot3(x,y,z,'Marker','.','MarkerEdgeColor','r','MarkerSize',10, 'LineStyle', 'none') 
xlabel('X'); 
ylabel('Y'); 
zlabel('Z');
axis([0 1.5 0 1.5 0 1.5])
axis vis3d
X=[x y z]; 
[V,C]=voronoin(X); 
V; 
for k=1:20 
    disp(C{k})
end 
for k=1:length(C) 
    if all(C{k}~=1) 
       VertCell = V(C{k},:); 
                KVert = convhulln(VertCell); 
                patch('Vertices',VertCell,'Faces',KVert,'FaceColor','g','FaceAlpha',0.5) 
            end 
end

function Y = bzh1(X)
[a,b]=size(X);
C=max(X);
D=min(X);
Y=zeros(a,b);
for i=1:a
 for j=1:b
  Y(i,j)=(X(i,j)-D(j))/(C(j)-D(j));
 end
end
fprintf('The standardized matrix is as follows：Y=\n');
disp(Y)
end
%%
function R=biaod2(Y,c)
[a,b]=size(Y);
Z=zeros(a);
R=zeros(a);
for i=1:a 
  for j=1:a
    for k=1:b
      Z(i,j)=abs(Y(i,k)-Y(j,k))+Z(i,j);
      R(i,j)=1-c*Z(i,j);
      %%oushijuli. mohuxiangsijuzhen
     end
   end
 end
 fprintf('The fuzzy similarity matrix is ​​as follows：R=\n');
 disp(R)
 end     
&&
function B=cd3(R)
a=size(R);
B=zeros(a);
amtai=0;
while amtai==0
 for i=1:a
   for j=1:a
     for k=1:a
     B(i,j)=max(min(R(i,k),R(k,j)),B(i,j));
   %%R R neiji,xian quxiao zaiquda
   end
  end
end
if B==R
 amtai=1;
else
  R=B; %xunhuan
end
end

%%%
function [D,k]=jjz4(B)
L=unique(B)';
a=size(B);
D=zeros(a);
for m=length(L):-1:1
  k=L(m);
  for i=1:a
    for j=1:a
      if B(i,j)>=k
        D(i,j)=1;
      else
        D(i,j)=0;
      end
     end
    end
 fprintf('When the classification coefficient k =:\n');
 disp (L(m));
 fprintf('The resulting intercept array is:\n');
 disp(D);
 end

 %%




X=[56135.42 24.764 1.67 0.11;
   8582.94 1390.85 20 0.36;
   3858.69 261.989 2 0.20;
   20957.21 32.377 0.4 0.10;
   53880.13 5.675 0.06 1.7168];
%yuanshi juzhen

Y=bzh1(X);
R=biaod2(Y,0.1);
B=cd3(R);
jjz4(B)


t=S1(:,1);
c=S1(:,2)*1000;
[p,S]=polyfit(t,c,2);
Y=polyconf(p,t,S);
plot(t,c,'K+',t,Y,'r')


t=1/30:1/30:14/30;
s=[11.86 15.67 20.60 26.69 33.71 41.93 51.13 61.49 72.90 85.44 99.08 113.77 129.54 146.48];
[p,S]=polyfit(t,s,2)



