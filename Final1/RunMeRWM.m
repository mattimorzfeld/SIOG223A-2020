%%
clear
close all
clc
Colors

%% Data
data = load('Final1Data.txt');
d = data(:,2);
xobs = data(:,1);
nobs = length(xobs);
%% domain
x = -100:.5:100;
s = ones(nobs,1);

%% Configure sampler
% one fault model
n = 3;
Nsteps = 5e5;
ub = [80 80  50]';
lb = [0   0 -50]';
xo = lb+(ub-lb).*rand(n,1);
sz = [.5 .2 1]';
[AccRatio,X,sRMSE]=myRWM(Nsteps,xo,xobs,d,s,lb,ub,sz);

% two fault model
% n = 6;
% Nsteps = 5e5;
% ub = [80 80  20 80 80 80]';
% lb = [0   0 -20  0  0 30]';
% xo = lb+(ub-lb).*rand(n,1);
% sz = [.5 .2 .5 .5 .2 .5]';
% [AccRatio,X,sRMSE]=myRWM(Nsteps,xo,xobs,d,s,lb,ub,sz);

%% remove burn-in and re-shape
BurnIn = 1e3;
X = X(:,BurnIn:end,:);
sRMSE = sRMSE(BurnIn:end,:);
Xrs = reshape(X,[n,size(X,2)*size(X,3)]);
sRMSErs = reshape(sRMSE,[1,size(sRMSE,1)*size(sRMSE,2)]);

%% Plot results
figure
histogram(sRMSErs,'Normalization','pdf')
xlabel('RMSE (scaled)')
ylabel('Probability')
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

figure
TrianglePlot(Xrs,1)

nos = 500;
D = zeros(length(x),nos);
for kk=1:nos
    params = Xrs(:,randi(length(Xrs),1));
    D(:,kk) = RunModel(params,x);
end
figure
plot(x,D,'Color',[Color(2,:),0.1],'LineWidth',2,'MarkerSize',10)
hold on, errorbar(xobs,d,2*s,'.','Color',Color(1,:),'MarkerSize',15)
xlabel('Location along profile (km)')
ylabel('Velocity (mm/yr)')
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off