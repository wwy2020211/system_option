function mov=move_age(data)
y=data;
m=length(y);   %�������ݳ���
n=5; %n Ϊ�ƶ�ƽ��������������������������5����30

for i=1:length(n)
    %����n ��ȡֵ��ͬ��yhat �ĳ��Ȳ�һ�£�����ʹ����ϸ������
    for j=1:m-n(i)+1
        yhat{i}(j)=sum(y(j:j+n(i)-1))/n(i); 
    end
    y12(i)=yhat{i}(end);
    keshihua(yhat{i});   %���ӻ�����
end

mov=y12;