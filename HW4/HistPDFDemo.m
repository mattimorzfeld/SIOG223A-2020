clear
close all
clc

% nos = 1e2;
% x = -.5+rand(nos,1);
% dlmwrite('Data_HW4_P2a.txt',x,'newline','pc')

x = load('Data_HW4_P2a.txt');
nos = length(x);
[Fi,xi] = ecdf(x);

subplot(211)
histogram(x,10,'Normalization','pdf')
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

subplot(212)
plot(xi,Fi)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off



% x =randn(nos,1);
% dlmwrite('Data_HW4_P2b.txt',x,'newline','pc')

x = load('Data_HW4_P2b.txt');
nos = length(x);
[Fi,xi] = ecdf(x);

figure(2)
subplot(211)
histogram(x,10,'Normalization','pdf')
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

figure(2)
subplot(212)
plot(xi,Fi)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off


