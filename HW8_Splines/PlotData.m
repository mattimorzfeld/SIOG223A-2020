%%
clear
close all
clc
Colors

DHist = load('HawaiiHistorical.txt');
tHist = DHist(:,3);
yHist = DHist(:,5);
sHist = DHist(:,6);

DCarb = load('HawaiiCarbon.txt');
tCarb = DCarb(:,3);
yCarb = DCarb(:,5);
sCarb = DCarb(:,6);

figure
errorbar(tHist,yHist,2*sHist,'.','Color',Color(3,:),'MarkerSize',15)
hold on, errorbar(tCarb,yCarb,2*sCarb,'.','Color',Color(2,:),'MarkerSize',15)
xlabel('Time (years)')
ylabel('Intensity')
set(gcf,'color','w')
set(gca,'FontSize',16)
box off


t = [tCarb; tHist];
y = [yCarb; yHist];
s = [sCarb;sHist];

[t,inds] = sort(t);
s = s(inds);
y = y(inds);
% hold on, errorbar(t,y,2*s,'.','Color',Color(2,:),'MarkerSize',15)

% figure
% plot(t,'.','Color',Color(2,:),'MarkerSize',15)

save('Hawaii.mat','t','y','s')

size(tCarb)
tCarb(end)
size(tHist)