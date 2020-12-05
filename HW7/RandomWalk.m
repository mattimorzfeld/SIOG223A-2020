%%
clear 
close all
clc


nsteps = 1e5;
x = zeros(3,1);
X = zeros(3,nsteps);

for kk=1:nsteps
    x = x+randn(3,1);
    X(:,kk)=x;
end
plot3(X(1,:),X(2,:),X(3,:))



nos = 1e3;
nsteps = 200;
X = zeros(3,nos);
for kk = 1:nos
    x = zeros(3,1);
    for jj=1:nsteps
        x = x+randn(3,1);
    end
    X(:,kk) = x;
end

x = -nsteps:.1:nsteps;
f = 1/sqrt(2*pi*nsteps)*exp(-(x.^2/2/nsteps));
figure
subplot(131)
histogram(X(1,:),'Normalization','pdf')
hold on, plot(x,f)
subplot(132)
histogram(X(2,:),'Normalization','pdf')
hold on, plot(x,f)
subplot(133)
histogram(X(3,:),'Normalization','pdf')
hold on, plot(x,f)
