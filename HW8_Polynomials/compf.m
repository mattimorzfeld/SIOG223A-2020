function fls = compf(x,xls)
o = length(xls);
fls = zeros(length(x),1);
for kk=0:o-1
    fls = fls+xls(kk+1)*x.^kk;
end