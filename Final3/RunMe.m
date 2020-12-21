%%
clear 
close all
clc
Colors

load('Final3Data.txt')
Xs = Final3Data(:,1);
Fs = Final3Data(:,2);
inds = Final3Data(:,3);
clear Final3Data

%% Error model
s = .95;

%% Domain 
dx = 0.01;
x = -3:dx:5;
n = length(x);
N = length(inds);

%% Covariance
L = 0.5;
sig = 1.5;
mus = 0;
C = covMatrix(sig,L,dx,n);
mu = mus*ones(size(x))';

%% Draw samples from prior
Ne = 500;
S = zeros(length(x),Ne);
[u,l]=getSVD(C,.99);
for kk=1:Ne
    S(:,kk) = mu + u*(sqrt(l).*randn(length(l),1));
end
figure(8)
hold on, plot(x,S,'Color',[Color(2,:) 0.4])
hold on, errorbar(Xs,Fs, 2*s*ones(length(Xs),1), 'ro'); 
box off
set(gcf,'Color','w')
set(gca,'FontSize',20)

%% Gaussian process regression
Cpost = C;
for jj=1:N 
    [Cpost,mu] = GPRupdate(inds(jj),Fs(jj),s,mu,Cpost);
end
% [Cpost,mu] = GPRupdate(inds,Fs,s,mu,C);
Ne = 500;
S = zeros(length(x),Ne);
[u,l]=getSVD(Cpost,.99);
for kk=1:Ne
    S(:,kk) = mu + u*(sqrt(l).*randn(length(l),1));
end

figure(2)
plot(x,S,'Color',Color(2,:))
hold on, plot(x,mu,'Color',Color(3,:),'LineWidth',2)
hold on, errorbar(Xs,Fs, 2*s*ones(length(Xs),1), 'ro'); 
box off
set(gcf,'color','w')
set(gca,'FontSize',20)
hold off
drawnow

figure
subplot(121), imagesc(C),caxis([min(min(Cpost)) 2.25])
subplot(122), imagesc(Cpost),caxis([min(min(Cpost)) 2.25]),colorbar

%% Actualfunction
FX = zeros(length(x),1);
for kk=1:length(x)
    FX(kk)= funcF(x(kk));
end
figure(2)
hold on, plot(x,FX,'Color',Color(1,:),'LineWidth',2)

