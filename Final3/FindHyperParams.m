clear
close all
clc
Colors

load('Final3Data.txt')
Xs = Final3Data(:,1);
Fs = Final3Data(:,2);
inds = Final3Data(:,3);
clear Final3Data

%% Domain 
dx = 0.01;
x = -3:dx:5;
n = length(x);
N = length(inds);

sig = 1.5;
s = 0.05:.05:2;
L = 0.1:.1:.7;
ML = zeros(length(L),length(s));
for kk=1:length(L)
    for jj=1:length(s)
        C = covMatrix(sig,L(kk),dx,n);
        Kxx = C(inds,inds);
        M = Kxx+s(jj)^2*eye(length(inds));
        ML(kk,jj) = -.5*Fs'*(M\Fs) - .5*log(det(M)) - N/2*log(2*pi);
    end
end


[S,L] =meshgrid(s,L);
surf(L,S,ML)
xlabel('L')
ylabel('\sigma')

maximum = max(max(ML));
[x,y]=find(ML==maximum);
fprintf('sigma opt = %g\n',s(y))
fprintf('L opt = %g\n',L(x))