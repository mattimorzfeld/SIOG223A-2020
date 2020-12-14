function A = makeA(x,o)
A = zeros(length(x),o);
for kk=0:o-1
    A(:,kk+1) = x.^kk;
end