clear
close all
clc

%% 
% dx = 0.1;
% s = (0:dx:2*pi)';
% n = length(s);
% 
% b = sin(s);
% dlmwrite('HW1_CodingProblem_b.txt',b)
% 
% A = (1/dx^2)*(-2*eye(n) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1));

% dlmwrite('HW1_CodingProblem_A.txt',A)

A = load('HW1_CodingProblem_A.txt');
b = load('HW1_CodingProblem_b.txt');

x = A\b;
hold on, plot(x)
hold on, plot(b)

L = tril(A);
U = triu(A,1);

n = length(b);
x = randn(n,1);
normOld = norm(A*x-b);
tol = 1/n;
nmax = 5000;
go = 1;
Norms = zeros(1,nmax);
Norms(1) = normOld;
counter = 1;
while go == 1
    disp(counter)
    x = L\(b-U*x);
    normNew = norm(A*x-b);
    if normNew < tol
        go = 0;
    elseif counter > nmax 
        go = 0;
    end
    counter = counter +1;
    Norms(counter) = normNew;
    normOld = normNew;
end
hold on, plot(x)

figure
plot(Norms)
set(gca,'YScale','log')



