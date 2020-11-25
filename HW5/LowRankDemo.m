%%
clear
close all
clc
Colors

n = 100;
ds = 1/n;
s = ds:ds:1;
l = 0.1;

C = zeros(n);
for kk=1:n
    for jj=kk:n
        C(kk,jj) = exp(-.5*(abs(kk-jj)*ds/l)^2);
    end
end
C = C+C'-diag(diag(C));

figure(1)
imagesc(C)

[v,l]=eig(C);
l = diag(l);
[l,inds] = sort(l,'descend');
v = v(:,inds);

figure
plot(abs(l))
set(gca,'YScale','log')

norm(C - v*diag(l)*v') 

hmtk = 0;
go = 1;
while go == 1
    hmtk = hmtk +1;
    if sum(l(1:hmtk))>.99*sum(l)
        go = 0;
    end
end
va = v(:,1:hmtk);
la = l(1:hmtk);
Ca = va*diag(la)*va';

norm(Ca-C)

figure
imagesc(Ca)

nos = 10;
X = zeros(n,nos);
Xa = zeros(n,nos);
sC = sqrtm(C);
for kk=1:nos
    xi = randn(n,1);
    Xa(:,kk) = va*(sqrt(la).*xi(1:hmtk));
    X(:,kk) = v*(sqrt(abs(l)).*xi);
end

figure
plot(s,X,'Color',Color(1,:))
% figure
hold on, plot(s,Xa,'Color',Color(2,:))
    
