function [x,t]=MyG12(xo,T,dt)
% uses geological time scaling:
% 1 time unit = 1 kyr (see MFH17)
%
% input is initial condition xo
% and time in Myr
[t,x] = ode45(@f,[0:dt:T],xo); 
% output time in kyr
% time increment is 0.1 kyr