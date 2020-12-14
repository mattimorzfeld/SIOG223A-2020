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
nStep = 21;
RMSE = zeros(nStep,1);
k = [min(tCarb),median(tCarb),max(tCarb)];
lastknot = median(tCarb);
for kk=1:nStep
    A = makeA(tCarb,k);
    W = diag(1./sCarb);
    A = W*A;
    xhat = A\(sCarb.\yCarb);
    yhat = A*xhat;
    yhat = sCarb.*yhat;

    RMSE(kk) = sqrt(mean(((yCarb-yhat)./sCarb).^2));
    fprintf('RMSE = %g\n',RMSE(kk))

    %% make new knot
    ind = find(tCarb>=lastknot);
    ind = ind(1);
    y1 = yCarb(1:ind);
    y2 = yCarb(ind+1:end);
    s1 = sCarb(1:ind);
    s2 = sCarb(ind+1:end);
    yhat1 = yhat(1:ind);
    yhat2 = yhat(ind+1:end);
    rmse1 = sqrt(mean(((y1-yhat1)./s1).^2));
    rmse2 = sqrt(mean(((y2-yhat2)./s2).^2));
    if rmse1>rmse2
        lastknot = median(tCarb(1:ind));
    else
        lastknot = median(tCarb(ind+1:end));
    end
    k = sort([k lastknot]);   
end

figure
plot(RMSE,'.','Color',Color(3,:),'MarkerSize',20)



disp(' ')
fprintf('Optimal number of knots: %g\n',length(k))
figure(1)
hold on, plot(tCarb,yhat,'Color',Color(1,:),'LineWidth',2)
xlabel('Time (years)')
ylabel('Intensity')
set(gcf,'color','w')
set(gca,'FontSize',16)
box off

RMSEOpt = sqrt(mean(((yCarb-yhat)./sCarb).^2));
fprintf('RMSE = %g\n',RMSEOpt)