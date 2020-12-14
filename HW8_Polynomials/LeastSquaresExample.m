clear
close all
clc
Colors

% rng(262017)
% xmin = -5; xmax = 5;
% x = sort(xmin + (xmax-xmin)*rand(50,1));
% xt = [4 1 -0.2 -.05 .02];               
% s = 1+2*rand(length(x),1); 
% y  = compf(x,xt) + s.*randn(length(x),1);
% dlmwrite('Data_HW8_LS.txt',[x y s],'newline','pc')

load('Data_HW8_LS.txt')
x = Data_HW8_LS(:,1);
y = Data_HW8_LS(:,2);
s = Data_HW8_LS(:,3);

xhr = linspace(min(x),max(x),100)';


figure
errorbar(x,y,2*s,'.','Color',Color(1,:),'MarkerSize',15)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

o = 5;
A = s.\makeA(x,o);
xhat = A\(s.\y);

yhat=compf(x,xhat);
yhathr = compf(xhr,xhat);
figure(1)
hold on, plot(xhr,yhathr,'Color',Color(2,:),'LineWidth',2)

figure(2)
plot(y-yhat,'.','MarkerSize',20)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

figure(3)
histogram(y-yhat)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off

rmse = sqrt(mean((s.\(y-yhat)).^2))


O = 1:20;
rmse=zeros(length(O),1);
Yhr = zeros(length(xhr),length(O));
for kk=1:length(O)
    o = O(kk);
    A = s.\makeA(x,o);
    
    xhat = A\(s.\y);
    yhat=compf(x,xhat);
    rmse(kk) = sqrt(mean((s.\(y-yhat)).^2));
    Yhr(:,kk) = compf(xhr,xhat);
end

figure(10)
errorbar(x,y,2*s,'.','Color',Color(1,:),'MarkerSize',15)
hold on, plot(xhr,Yhr,'Color',Color(2,:),'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off


figure(11)
plot(O,rmse,'.','Color',Color(3,:),'MarkerSize',20)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off


    