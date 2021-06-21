function l_r=linear_regression(data,alpha)
x=data(:,1);
y=data(:,2);
figure
plot(x,y,'r*') %作散点图(制定横纵坐标)
xlabel('确诊病例数','fontsize',12)
ylabel('治愈病例数','fontsize',12)
set(gca,'linewidth',2)
%采用最小二乘拟合
Lxx=sum((x-mean(x)).^2);       %X均方差
Lxy=sum((x-mean(x)).*(y-mean(y)));     %协方差
b1=Lxy/Lxx;
b0=mean(y)-b1*mean(x);
y1=b1*x+b0;     %拟合直线
fprintf('y=%fx+%f',b1,b0);
hold on
plot(x,y1,'linewidth',2);
m2=LinearModel.fit(x,y);%函数进行线性回归;

%F检验
Fe=1;     %分子自由度
Fr=length(x)-2;    %分母自由度
F=finv(0.95,Fe,Fr);     %F检验
f=(Fr-2)*corrcoef(x,y)*corrcoef(x,y);
if F<=f
    fprintf('SUCCESS!')
end

%置信区间
S=sqrt(sum((y1-y).^2)/Fr)
z=norminv(1-0.05/2,0,1)    %标准正态分布百分位点
dis=S*z;
for i=1:length(x)
    fprintf('置信区间下届%6.2f\n',y1(i)-dis)
    fprintf('置信区间上届%6.2f\n',y1(i)+dis)
end
%绘图
l_r=dis;
plot(x,(y1+dis),'linewidth',2);    %置信区间上届
plot(x,(y1-dis),'linewidth',2);    %置信区间下届
leg=char('原始数据','一元回归拟合直线','置信区间上届','置信区间下届');
legend(leg)
end