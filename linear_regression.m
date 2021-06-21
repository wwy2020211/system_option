function l_r=linear_regression(data,alpha)
x=data(:,1);
y=data(:,2);
figure
plot(x,y,'r*') %��ɢ��ͼ(�ƶ���������)
xlabel('ȷ�ﲡ����','fontsize',12)
ylabel('����������','fontsize',12)
set(gca,'linewidth',2)
%������С�������
Lxx=sum((x-mean(x)).^2);       %X������
Lxy=sum((x-mean(x)).*(y-mean(y)));     %Э����
b1=Lxy/Lxx;
b0=mean(y)-b1*mean(x);
y1=b1*x+b0;     %���ֱ��
fprintf('y=%fx+%f',b1,b0);
hold on
plot(x,y1,'linewidth',2);
m2=LinearModel.fit(x,y);%�����������Իع�;

%F����
Fe=1;     %�������ɶ�
Fr=length(x)-2;    %��ĸ���ɶ�
F=finv(0.95,Fe,Fr);     %F����
f=(Fr-2)*corrcoef(x,y)*corrcoef(x,y);
if F<=f
    fprintf('SUCCESS!')
end

%��������
S=sqrt(sum((y1-y).^2)/Fr)
z=norminv(1-0.05/2,0,1)    %��׼��̬�ֲ��ٷ�λ��
dis=S*z;
for i=1:length(x)
    fprintf('���������½�%6.2f\n',y1(i)-dis)
    fprintf('���������Ͻ�%6.2f\n',y1(i)+dis)
end
%��ͼ
l_r=dis;
plot(x,(y1+dis),'linewidth',2);    %���������Ͻ�
plot(x,(y1-dis),'linewidth',2);    %���������½�
leg=char('ԭʼ����','һԪ�ع����ֱ��','���������Ͻ�','���������½�');
legend(leg)
end