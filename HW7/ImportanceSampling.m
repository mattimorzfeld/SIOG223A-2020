clear
close all
clc
Colors


%% Problem setup
% x \sim N(0,1)
% y = x^3+xi, xi \sim N(0,1)
y = -2;

%% MCMC
nos = 1e6;
X = zeros(1,nos);
x = 0;
accSteps = 0;

for kk=1:nos
    xp = x+2*randn;
    logpi_xp = -.5*(y-xp^3)^2-.5*xp^2;
    logpi_x  = -.5*(y- x^3)^2-.5* x^2;
    
    a = min(1,exp(logpi_xp-logpi_x));
    if rand<a
        x = xp;
        accSteps = accSteps + 1;
    end
    X(kk) = x;
    fprintf('Acc. ratio: %g\r',accSteps/kk)
end

histogram(X,100,'Normalization','pdf')
set(gcf,'Color','w')
set(gca,'FontSize',12)
box off

%% Importance sampling
X = zeros(1,nos);
w = zeros(1,nos);
for kk=1:nos
    x = randn;
    w(kk) = .5*(y-x^3)^2;
    X(kk) = x;
end

w = w-mean(w);
w = exp(-w);
w = w/sum(w);
% histogram(w,'Normalization','pdf')
% set(gcf,'Color','w')
% set(gca,'FontSize',12)
% box off


[xrs, bins]=whist(X,w,100);
hold on, plot(xrs,bins,'Color',Color(1,:),'LineWidth',2)

% dlmwrite('Weights.txt',w)
% dlmwrite('Samples.txt',X)

