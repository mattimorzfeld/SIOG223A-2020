%%
clear
close all
clc



w = load('Weights.txt');
X = load('Samples.txt');

%% weighted histogram
[xrs, bins]=whist(X,w,100);
figure
hold on, plot(xrs,bins,'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
xlabel('x')
ylabel('Probability')
box off


%% unweighted histogram of the samples
figure
histogram(X,'Normalization','pdf')
set(gcf,'Color','w')
set(gca,'FontSize',16)
xlabel('x')
ylabel('Probability')
box off

% or use weighted histogram code with all weights sed to 1/number of
% samples
what = 1/length(X)*ones(length(X),1);
[xrs, bins]=whist(X,what,100);
figure
hold on, plot(xrs,bins,'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
xlabel('x')
ylabel('Probability')
box off
