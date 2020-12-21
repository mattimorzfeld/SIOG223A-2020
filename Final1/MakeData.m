%%
clear
close all
clc
Colors

%% domain
x = -100:.5:100;

%% true parameters
vSAF = 25;
DSAF = 16;
vCF = 13;
DCF = 10;
thetat = [vSAF;DSAF;vCF;DCF];
vt = RunModel(thetat,x);

%% observations
nobs = 200;
xobs = x(1) + (x(end)-x(1))*rand(nobs,1);
s = ones(nobs,1);
d = RunModel(thetat,xobs)+s.*randn(nobs,1);
data = [xobs,d];
dlmwrite('Final1.txt',data)
