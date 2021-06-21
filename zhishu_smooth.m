function ph=zhishu_smooth(data)
x=data';
p=input('指数');      %输入指数
n=length(x);
s1_0=mean(x(1:3));
s2_0=s1_0;
s3_0=s1_0;
s1(1)=p*x(1)+(1-p)*s1_0;
s2(1)=p*s1(1)+(1-p)*s2_0;
s3(1)=p*s2(1)+(1-p)*s3_0;       %平滑指数
for t=2:n
    s1(t)=p*x(t)+(1-p)*s1(t-1);
    s2(t)=p*s1(t)+(1-p)*s2(t-1);
    s3(t)=p*s2(t)+(1-p)*s3(t-1);
end
s1=[s1_0,s1];
s2=[s2_0,s2];
s3=[s3_0,s3];
a=3*s1-3*s2+s3;
b=p/(2*(1-p)^2)*((6-5*p)*s1-2*(5-4*p)*s2+(4-3*p)*s3);
c=p^2/(2*(1-p)^2)*(s1-2*s2+s3);
y=a+b+c;
keshihua(y)
title('a=0.2流量变化')
xishu=[c(n+1),b(n+1),a(n+1)];
yt=polyval(xishu,2);
sum=0;
for i=1:n
   sum=sum+((y(1,i)-x(1,i))./(850*4)).^2;
end
r1=(1-sqrt(sum/n))*100;
sum0=0;
for i=1:n
    B=1-(x(1,i)-y(1,i))/(850*4);
    if B>=0.75
        Bk=1;
    else
        Bk=0;
    end
    sum0=sum0+Bk;
end
r2=(sum0/n)*100
ph=r2
end