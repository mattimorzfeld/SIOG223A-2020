%%
clear
close all
clc
Colors

x = load('MyTripodsSetup.txt');

figure
histogram(x(:,2),50,'Normalization','pdf')
set(gcf,'Color','w')
set(gca,'FontSize',16)
xlabel('Vertical antenna height, m')
box off

[Fi,xi] = ecdf(x(:,2));
figure
plot(xi,Fi,'Color',Color(3,:),'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off
xlabel('Vertical antenna height, m')

em = mean(x(:,2));
estd = std(x(:,2));
xn = -1:.1:4;
pn = normpdf(xn,em,estd);
Pn = normcdf(xn,em,estd);
figure(1)
hold on,plot(xn,pn,'Color',Color(2,:),'LineWidth',2)
figure(2)
hold on,plot(xn,Pn,'Color',Color(2,:),'LineWidth',2)


%% bootstrapping
N = length(x(:,2)); % number of data
noe = 1e3;
m = zeros(noe,1);
s = zeros(noe,1);
for kk=1:noe
    randinds = randi([1 N],N,1);
    xf = x(randinds,2);
    m(kk) = mean(xf);
    s(kk) = std(xf);
end

figure
histogram(m,'Normalization','Probability')

figure
histogram(s,'Normalization','Probability')


