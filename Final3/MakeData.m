clear
close all
clc
Colors

dx = 0.01;
x = -3:dx:5;
s = 1;

N1 = 8;
N2 = 3;
N3 = 12;
inds1 = sort(randi([1 floor(length(x)/3)],N1,1));
inds2 = sort(randi([ceil(length(x)*1/3) floor(length(x)*2/3)],N2,1));
inds3 = sort(randi([ceil(length(x)*2/3) length(x)],N3,1));
inds = [inds1; inds2; inds3];
N = length(inds);

Xs = zeros(N,1);
Fs = zeros(N,1);
for kk=1:N
    Xs(kk) = x(inds(kk));
    Fs(kk) = funcF(Xs(kk))+s*randn;
end

% plot(Xs,Fs,'.','Color',Color(3,:),'MarkerSize',20)
errorbar(Xs,Fs, 2*s*ones(N,1), 'ro'); 
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

dlmwrite('Data_HW10_GPR.txt',[Xs Fs inds],'newline','pc')

%% True function
dx = 0.01;
x = -3:dx:5;
n = length(x);

%% Actualfunction
FX = zeros(length(x),1);
for kk=1:length(x)
    FX(kk)= funcF(x(kk));
end
hold on, plot(x,FX,'Color',Color(3,:),'LineWidth',2)