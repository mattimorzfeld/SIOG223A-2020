function out = myEstODE(t,y,xcoefs,ycoefs,zcoefs)
X = y(1);
Y = y(2);
Z = y(3);

tmp = [1;X;Y;Z;X*Y;X*Z;Y*Z];
dxdt = xcoefs'*tmp;
dydt = ycoefs'*tmp;
dzdt = zcoefs'*tmp;
out = [dxdt;dydt;dzdt];
