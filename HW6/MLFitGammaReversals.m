function MLFitGammaReversals
clear
close all
clc
Colors

x = load('reversals_1');
x = -x;
LoI = -diff(x);

y = -ones(size([0; x]));
y(2:2:end) = 1;

figure
stairs([0;x],y,'k')
set(gcf,'Color','w')
set(gca,'FontSize',16)
xlabel('Time (Myr)')
ylabel('Polarity')
box off


figure
histogram(LoI,100,'Normalization','pdf')
set(gcf,'Color','w')
set(gca,'FontSize',16)
set(gca,'YScale','log')
set(gca,'XScale','log')
xlabel('Length of interval')
box off

%% Maximum likelihood
pd = fitdist(LoI,'gamma')
x = logspace(-1,1.5,500);
y1 = gampdf(x,pd.a,pd.b);
figure(2)
hold on,plot(x,y1,'LineWidth',2)

N = length(LoI);
k = .01:.005:1;
theta = .01:.005:1;
[K,Theta]=meshgrid(k,theta);
L = zeros(length(k),length(theta));
for kk=1:length(k)
    for jj=1:length(theta)
        L(kk,jj) = logpi(LoI,k(kk),theta(jj),N);
    end
end

figure
surf(K,Theta,L)
shading interp
view([0 90])



[tmp,inds]=max(L);
[maxL,inds2] = max(tmp);
L(inds(inds2),inds2);
kopt = k(inds(inds2));
thetaopt = theta(inds2);
x = logspace(-1,1.5,500);
y1 = gampdf(x,kopt,thetaopt);
figure(2)
hold on,plot(x,y1,'--','LineWidth',2)

%% now fit an exponential
lam = 1/mean(LoI);
x = logspace(-1,1.5,500);
pexp = lam*exp(-lam*x);
hold on, plot(x,pexp,'LineWidth',2)



end

function out = logpi(x,k,theta,N)
    out = (k-1)*sum(log(x))-N*k*log(theta)-1/theta*sum(x)-N*log(gamma(k));
end

