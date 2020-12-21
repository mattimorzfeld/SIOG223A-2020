function [C,mu] = GPRupdate(ind,Fxs,s,mu,C)
f = Fxs-mu(ind);
Kxsx = C(:,ind);
Kxx = C(ind,ind);
sI = s^2*eye(length(ind));

mu = mu + Kxsx*((Kxx+sI)\f);
C = C-(Kxsx*((Kxx+sI)\Kxsx'));
C = .5*(C+C');