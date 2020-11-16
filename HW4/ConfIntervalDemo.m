clear
close all
clc
Colors
%% 
x = randn(1e3,1);
plot(x,'.','MarkerSize',20)
hold on, plot([1 length(x)],[2 2],'Color',Color(2,:),'LineWidth',2)
hold on, plot([1 length(x)],-[2 2],'Color',Color(2,:),'LineWidth',2)
set(gcf,'Color','w')
set(gca,'FontSize',12)

[a,b]=find(abs(x)<2);
length(a)/length(x)


noe = 1e4;
X = zeros(noe,1);
for kk=1:noe
    x = randn(1e3,1);
    [a,b]=find(abs(x)<2);
    X(kk) = length(a)/length(x);
end
figure
histogram(X,'Normalization','pdf')