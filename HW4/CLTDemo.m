clear
close all
clc

%% Summing normal random variables
mu = 20;
s = 2;
nos = 1e4;
n = 1e5;
xi = zeros(nos,1);
for kk=1:nos
    xi(kk) =sqrt(n)*(mean(mu+s*randn(n,1))-mu)/s;
end
xn = -4:.1:4;
yn = normpdf(xn,0,1);
figure
histogram(xi,'Normalization','pdf')
hold on, plot(xn,yn,'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

%% Summing uniform random variables
a = -1;
b = 3;
mu = 0.5*(a+b);
s = 1/sqrt(12) * (b-a);

nos = 1e4;
n = 1e5;
xi = zeros(nos,1);
for kk=1:nos
    u = a+(b-a)*rand(n,1);
    xi(kk) =sqrt(n)*(mean(u)-mu)/s;
end
xn = -4:.1:4;
yn = normpdf(xn,0,1);
figure
histogram(xi,'Normalization','pdf')
hold on, plot(xn,yn,'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off





% mu = 3;
% s = 2;
% nos = 1e4;
% xi = zeros(nos,1);
% for kk=1:nos
%     xi(kk) =mu+s*randn;
% end
% 
% xn = -10:.1:10;
% yn = normpdf(xn,mu,s);
% histogram(xi,'Normalization','pdf')
% hold on, plot(xn,yn,'LineWidth',2)
% set(gcf,'Color','w')
% set(gca,'FontSize',16)
% box off


