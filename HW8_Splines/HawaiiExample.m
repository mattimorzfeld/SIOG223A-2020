clear
close all
clc
Colors

DCarb = load('HawaiiCarbon.txt');
tCarb = DCarb(:,3);
yCarb = DCarb(:,5);
sCarb = DCarb(:,6);

[tCarb,inds] = sort(tCarb);
yCarb=yCarb(inds);
sCarb=sCarb(inds);


hold on, errorbar(tCarb,yCarb,2*sCarb,'k.','Color',Color(2,:),'MarkerSize',15)
xlabel('Time (years)')
ylabel('Intensity')
set(gcf,'color','w')
set(gca,'FontSize',16)
box off

%% knots
k = linspace(min(tCarb),max(tCarb),25);
A = makeA(tCarb,k);
W = diag(1./sCarb);
A = W*A;
xhat = A\(sCarb.\yCarb);
yhat = A*xhat;
yhat = sCarb.*yhat;
hold on, plot(tCarb,yhat,'Color',Color(3,:),'LineWidth',2)

RMSE = sqrt(mean(((yCarb-yhat)./sCarb).^2));

fprintf('RMSE = %g\n',RMSE)