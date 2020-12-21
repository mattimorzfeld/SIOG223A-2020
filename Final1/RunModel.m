function v = RunModel(theta,x)
if length(theta)==3
    v = screw(theta(1),theta(2),theta(3),x);
elseif length(theta)==6
    vSAF = screw(theta(1),theta(2),theta(3),x);
    vCF = screw(theta(4),theta(5),theta(6),x);
    v = vSAF+vCF;
end