%%
clear
close all
clc
Colors


dt = 1e-2;
xo = [1.0950   -1.7066   -0.8047];
[t,x] = ode45(@f,0:dt:200,xo); 
xo = x(end,:);

T = 50;
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


dlmwrite('HW2_CodingProblem_LS_t.txt',t)
dlmwrite('HW2_CodingProblem_LS_x.txt',x(:,1))
dlmwrite('HW2_CodingProblem_LS_y.txt',x(:,2))
dlmwrite('HW2_CodingProblem_LS_z.txt',x(:,3))

for kk=1:3
    x(:,kk) = x(:,kk)+(sqrt(.05)*mean(abs(x(:,kk)))*randn(size(x(:,kk))));
end
figure
plot3(x(:,1),x(:,2),x(:,3))

dlmwrite('HW2_CodingProblem_LS_noisy_t.txt',t)
dlmwrite('HW2_CodingProblem_LS_noisy_x.txt',x(:,1))
dlmwrite('HW2_CodingProblem_LS_noisy_y.txt',x(:,2))
dlmwrite('HW2_CodingProblem_LS_noisy_z.txt',x(:,3))