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
n = 10:30;
RMSE = zeros(length(n),1);
for kk=1:length(n)
    k = linspace(min(tCarb),max(tCarb),n(kk));
    A = makeA(tCarb,k);
    W = diag(1./sCarb);
    A = W*A;
    xhat = A\(sCarb.\yCarb);
    yhat = A*xhat;
    yhat = sCarb.*yhat;
    hold on, plot(tCarb,yhat,'Color',Color(3,:),'LineWidth',2)

    RMSE(kk) = sqrt(mean(((yCarb-yhat)./sCarb).^2));
    fprintf('RMSE = %g\n',RMSE(kk))
end

figure
plot(n,RMSE,'.','Color',Color(3,:),'MarkerSize',20)

%% pick best one
[~,nopt]=min(RMSE);
nopt=nopt+9;
disp(' ')
fprintf('Optimal number of knots: %g\n',nopt)
k = linspace(min(tCarb),max(tCarb),nopt);
A = makeA(tCarb,k);
W = diag(1./sCarb);
A = W*A;
xhat = A\(sCarb.\yCarb);
yhat = A*xhat;
yhat = sCarb.*yhat;
figure
hold on, errorbar(tCarb,yCarb,2*sCarb,'k.','Color',Color(2,:),'MarkerSize',15)
hold on, plot(tCarb,yhat,'Color',Color(1,:),'LineWidth',2)
xlabel('Time (years)')
ylabel('Intensity')
set(gcf,'color','w')
set(gca,'FontSize',16)
box off

RMSEOpt = sqrt(mean(((yCarb-yhat)./sCarb).^2));
fprintf('RMSE = %g\n',RMSEOpt)

