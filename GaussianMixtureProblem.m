%%
clear
close all
clc


m1 = 1;
s1 = .1;
m2 = -1;
s2 = .1;

x = -6:.05:6;
p = .5*(1/sqrt(2*pi)/s1)*exp(-.5*((x-m1)/s1).^2) ...
   +.5*(1/sqrt(2*pi)/s2)*exp(-.5*((x-m2)/s2).^2);


plot(x,p,'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

%% draw samples
nos = 1e4; 
X = zeros(nos,1);
for kk=1:nos
    if rand<0.5
        tmp = m1+s1*randn;
    else
        tmp = m2+s2*randn;
    end
    X(kk) = tmp;
end

figure
histogram(X,'Normalization','pdf')
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

%% mode
[pmax,ind] = max(p);
ModeOfX = x(ind)

%% mean and standard deviation
EOfX = .5*m1+.5*m2
StandDev = .5*(m1^2+s1^2)+.5*(m2^2+s2^2)
