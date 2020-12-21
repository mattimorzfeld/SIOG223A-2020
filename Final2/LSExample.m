%%
clear
close all
clc
Colors

t = load('HW2_CodingProblem_LS_t.txt');
x = load('HW2_CodingProblem_LS_x.txt');
y = load('HW2_CodingProblem_LS_y.txt');
z = load('HW2_CodingProblem_LS_z.txt');

% t = load('HW2_CodingProblem_LS_noisy_t.txt');
% x = load('HW2_CodingProblem_LS_noisy_x.txt');
% y = load('HW2_CodingProblem_LS_noisy_y.txt');
% z = load('HW2_CodingProblem_LS_noisy_z.txt');

dt = t(2)-t(1);

figure
subplot(311)
plot(t,x)
set(gca,'FontSize',16)
box off
subplot(312)
plot(t,y)
set(gca,'FontSize',16)
box off
subplot(313)
plot(t,z)
xlabel('Time')
box off
set(gca,'FontSize',16)
set(gcf,'Color','w')

figure
plot3(x,y,z)
set(gca,'FontSize',16)
set(gcf,'Color','w')

%% Make A matrix
A = [ ones(length(x),1) ...
      x y z ...
      x.*y x.*z y.*z];
b = gradient(x,dt);
xcoefs = A\b;
b = gradient(y,dt);
ycoefs = A\b;
b = gradient(z,dt);
zcoefs = A\b;


%% Simulate the system
xo = [x(1);y(1);z(1)];
[T,sol] = ode45(@(t,y) myEstODE(t,y,xcoefs,ycoefs,zcoefs),t,xo);

figure
plot3(sol(:,1),sol(:,2),sol(:,3))

%% Sparse regression
del = 1e-1;
numit = 100;
b = gradient(x,dt);
xsreg = sreg(A,b,numit,del);

b = gradient(y,dt);
ysreg = sreg(A,b,numit,del);

b = gradient(z,dt);
zsreg = sreg(A,b,numit,del);

[T,sol] = ode45(@(t,y) myEstODE(t,y,xsreg,ysreg,zsreg),t,xo);

figure
plot3(sol(:,1),sol(:,2),sol(:,3))

