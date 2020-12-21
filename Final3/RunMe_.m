%%
clear 
close all
clc
Colors
Color=Color';

%% Define domain of function
dx = 0.01;
x = -3:dx:5;
n = length(x);

%% Actualfunction
FX = zeros(length(x),1);
for kk=1:length(x)
    FX(kk)= funcF(x(kk));
end

%% Accuracy of function evals
s = .2;

%% Define prior
L = 0.7;
sig = 1;
mus = 0;
C = covMatrix(sig,L,dx,n);
mu = mus*ones(size(x))';
[u,l]=getSVD(C,.99);

%% Draw samples from prior
% Ne = 500;
% S = zeros(length(x),Ne);
% [u,l]=getSVD(C,.99);
% for kk=1:Ne
%     S(:,kk) = mu + u*(sqrt(l).*randn(length(l),1));
% end
% figure(8)
% plot(x,S,'Color',Color(:,2))
% box off
% set(gcf,'Color','w')
% set(gca,'FontSize',20)


%% Gaussian process
N1 = 10;
N2 = 10;
inds1 = sort(randi([1 floor(length(x)/3)],N1,1));
inds2 = sort(randi([floor(length(x)*2/3) length(x)],N1,1));
inds = [inds1; inds2];
N = N1+N2;
Xs = zeros(N,1);
Fs = zeros(N,1);
Inds = zeros(N,1);

% %%
% y = FX(inds)+s*randn(length(inds),1);
% figure
% plot(x(inds),y,'.','Color',Color(:,4),'MarkerSize',20)
%     box off
%     set(gcf,'color','w')
%     set(gca,'FontSize',16)

NSamples = 50;
for jj=1:N
    
    [xs,Fxs,S,C,mu] = GPRupdate(inds(jj),x,s,mu,C,NSamples);
    size(S)
    Xs(jj) = xs;
    Fs(jj) = Fxs;
    Inds(jj) = inds(jj);
    
    figure(1)
    plot(x,S,'Color',Color(:,2))
    hold on, plot(x,mu,'Color',Color(:,3),'LineWidth',2)
    hold on, plot(Xs(1:jj),Fs(1:jj),'.','Color',Color(:,4),'MarkerSize',20)
    box off
    set(gcf,'color','w')
    set(gca,'FontSize',20)
    hold off
    drawnow

end

figure(1)
hold on,plot(x,FX,'Color',Color(:,1),'LineWidth',2)

