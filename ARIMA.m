function yF=ARIMA(data)
t = 1:length(data);
y = data;
figure
plot( t, y )
%% ARIMA ģ��
Mdl = arima(2,2,2);
EstMdl = estimate(Mdl,y);
res = infer(EstMdl,y);
% ģ����֤
figure
plot(y+res./sqrt(EstMdl.Variance))
title('ƽ����ͼ��')
