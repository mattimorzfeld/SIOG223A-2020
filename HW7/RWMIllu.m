clear
close all
clc


nos = 1e6;
X = zeros(2,nos);
x = zeros(2,1);
accSteps = 0;

e = 1;
P = (1/e)* [1+e e-1;e-1 1+e];
for kk=1:nos
    xp = x+1.5*randn(2,1);
%     xp = x+3.5*sqrt(e)*randn(2,1);
    a = min(1,exp(-.5*xp'*P*xp+.5*x'*P*x));
    if rand<a
        x = xp;
        accSteps = accSteps + 1;
    end
    X(:,kk) = x;
    fprintf('Acc. ratio: %g\r',accSteps/kk)
end
TrianglePlot(X,1)

X = P\randn(2,nos);
figure
TrianglePlot(X,1)