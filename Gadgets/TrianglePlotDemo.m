%%
clear
close all
clc


%% Make a 6-dimensional Gaussian and draw a larger number of samples
% n = 6;
% C = 2*diag(ones(n,1))-diag(ones(n-1,1),-1)-diag(ones(n-1,1),1);
% sqrtC = sqrtm(C);
% nos = 1e5;
% X = zeros(n,nos);
% for kk=1:nos
%     X(:,kk)=sqrtC*randn(n,1);
% end
% dlmwrite('ABunchOfSamples.txt',X)

X = load('ABunchOfSamples.txt');
%% Plot the samples using the triangle plotter
%% The second argument controls the number of bins in your 2D histograms.
%% 1 is the default number, use values less than 1 if you have only a few samples
figure
TrianglePlot(X,.1)

figure
TrianglePlot(X,1)