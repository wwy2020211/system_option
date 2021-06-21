function mov=move_age(data)
y=data;
m=length(y);   %输入数据长度
n=5; %n 为移动平均的项数，可以依照条件设置5或者30

for i=1:length(n)
    %由于n 的取值不同，yhat 的长度不一致，下面使用了细胞数组
    for j=1:m-n(i)+1
        yhat{i}(j)=sum(y(j:j+n(i)-1))/n(i); 
    end
    y12(i)=yhat{i}(end);
    keshihua(yhat{i});   %可视化数据
end

mov=y12;