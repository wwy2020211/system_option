function yF=ARIMA(data)
t = 1:length(data);
y = data;
figure
plot( t, y )
%% ARIMA 模型
Mdl = arima(2,2,2);
EstMdl = estimate(Mdl,y);
res = infer(EstMdl,y);
% 模型验证
figure
plot(y+res./sqrt(EstMdl.Variance))
title('平滑后图像')
