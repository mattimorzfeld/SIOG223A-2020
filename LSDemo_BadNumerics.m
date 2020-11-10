%%
clear
close all
clc
Colors

%% Make up some data
rng(262017)
x =  linspace(2,4,20)';
y = 1+x+x.^2+x.^3+x.^4+x.^5+x.^6+x.^7;


%% Fit a 7th order polynomial (bad numerics)
A = [ones(20,1) x x.^2 x.^3 x.^4 x.^5 x.^6 x.^7];
AtA = A'*A;
xLS1 = AtA\(A'*y)


%% Fit a 7th order polynomial (better numerics)
[Q,R]= qr(A);
xLS2 = R\(Q'*y)

s = 2:.01:4;
tp = 1+s+s.^2+s.^3+s.^4+s.^5+s.^6+s.^7;
ta1 = xLS1(1)+xLS1(2)+s+xLS1(3)*s.^2+xLS1(4)*s.^3+xLS1(5)*s.^4+xLS1(6)*s.^5+xLS1(7)*s.^6+xLS1(8)*s.^7;
ta2 = xLS2(1)+xLS2(2)+s+xLS2(3)*s.^2+xLS2(4)*s.^3+xLS2(5)*s.^4+xLS2(6)*s.^5+xLS2(7)*s.^6+xLS2(8)*s.^7;

figure
plot(s,tp,'Color',Color(1,:),'LineWidth',2);
hold on,plot(s,ta1,'Color',Color(2,:),'LineWidth',2);
hold on,plot(s,ta2,'Color',Color(3,:),'LineWidth',2);
hold on, plot(x,y,'.','Color',Color(4,:),'MarkerSize',20)
set(gcf,'Color','w')
set(gca,'FontSize',16)
box off
xlabel('x')
ylabel('y')

legend('truth','bad numerics','better numerics','data','Location','NorthWest')
