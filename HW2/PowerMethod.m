clear
close all
clc

%% 
n = 3;
A = -(-2*eye(n) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1));

x = randn(n,1);
x = x/norm(x);
ROld = x'*(A*x);
tol = 1e-6;
nmax = 5000;
go = 1;
Rs = zeros(1,nmax);
Rs(1) = ROld;
counter = 1;
while go == 1
    x = A*x;
    x = x/norm(x);
    RNew = x'*(A*x);
    if abs(RNew-ROld) < tol
        go = 0;
    elseif counter > nmax 
        go = 0;
    end
    counter = counter +1;
    Rs(counter) = RNew;
    ROld = RNew;
end

figure
plot(Rs(1:counter))


Rs(counter)
max(abs(eig(A)))


