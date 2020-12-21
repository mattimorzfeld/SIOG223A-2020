function out = f(t,x)
mu  = 0.119;  % Model parameters
nu  = 0.1;
G   = 0.9;
out = [mu*x(1)-x(2)*x(3);
            -nu*x(2)+x(1)*x(3);
              G-x(3)+x(1)*x(2)];