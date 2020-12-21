%%
clear
close all
clc
Colors


dt = 5e-2;
xo = [-0.8028    1.1398   -0.0672];
[t,x] = ode45(@f,0:dt:100,xo); 
xo = x(end,:);

T = 1000;
[t,x] = ode45(@f,0:dt:T,xo); 
figure
subplot(311)
plot(t,x(:,1))
subplot(312)
plot(t,x(:,2))
subplot(313)
plot(t,x(:,3))

figure
plot3(x(:,1),x(:,2),x(:,3))


dlmwrite('Final2_t.txt',t)
dlmwrite('Final2_x.txt',x(:,1))
dlmwrite('Final2_y.txt',x(:,2))
dlmwrite('Final2_z.txt',x(:,3))

for kk=1:3
    x(:,kk) = x(:,kk)+(sqrt(.05)*mean(abs(x(:,kk)))*randn(size(x(:,kk))));
end
figure
plot3(x(:,1),x(:,2),x(:,3))

dlmwrite('Final2_noisy_t.txt',t)
dlmwrite('Final2_noisy_x.txt',x(:,1))
dlmwrite('Final2_noisy_y.txt',x(:,2))
dlmwrite('Final2_noisy_z.txt',x(:,3))