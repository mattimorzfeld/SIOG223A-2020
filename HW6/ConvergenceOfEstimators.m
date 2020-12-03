clear
close all
clc

%% Gaussian
nos = 1e4;
xi = randn(nos,1);
m = zeros(nos,1);
mo = zeros(nos,1);
for kk=1:nos
    m(kk) = mean(xi(1:kk));
    mo(kk) = median(xi(1:kk));
end
figure
plot(m,'LineWidth',2)
hold on,plot(mo,'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
hold on, plot([1 nos],[0 0],'LineWidth',2);
box off

%% cauchy
nos = 1e4;
xi = trnd(1,nos,1);
m = zeros(nos,1);
mo = zeros(nos,1);
for kk=1:nos
    m(kk) = mean(xi(1:kk));
    mo(kk) = median(xi(1:kk));
end
figure
plot(m,'LineWidth',2)
hold on,plot(mo,'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
hold on, plot([1 nos],[0 0],'LineWidth',2);
box off

