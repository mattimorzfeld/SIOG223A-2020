clear
close all
clc


nos = 1e3;

%% BAD sampling
theta = 2*pi*rand(nos,1);
phi = pi*rand(nos,1);
x = sin(phi).*cos(theta);
y = sin(phi).*sin(theta);
z = cos(phi);

figure
plot3(x,y,z,'.','MarkerSize',10)

%% Ok sampling
d=zeros(3,nos);
for kk=1:nos
    v = randn(3,1); 
    d(:,kk) = v/norm(v);
end
figure
plot3(d(1,:),d(2,:),d(3,:),'.','MarkerSize',10)



%% Ok sampling
d=zeros(3,nos);
for kk=1:nos
    go = 1;
    while go==1
        u1 = -1+2*rand;
        u2 = -1+2*rand;
        S = u1^2+u2^2;
        if S<=1
            go=0;
        end
    end
    
    x1 = 2*u1*sqrt(1-S);
    x2 = 2*u2*sqrt(1-S);
    if rand<0.5
        x3 = sqrt(1-x1^2-x2^2);
    else
        x3 = -sqrt(1-x1^2-x2^2);
    end
    d(:,kk) = [x1;x2;x3];
end
figure
plot3(d(1,:),d(2,:),d(3,:),'.','MarkerSize',10)