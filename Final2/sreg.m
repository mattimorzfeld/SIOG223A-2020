function xsreg = sreg(A,b,numit,del)

xsreg = A\b;
xsOld = xsreg;
kk = 1;
go = 1;
while go == 1
    smallinds = (abs(xsreg)<del);
    xsreg(smallinds) = 0;
    biginds = ~smallinds;
    xsreg(biginds) = A(:,biginds)\b;
    if norm(xsreg-xsOld)<1e-6
        go = 0;
    elseif kk>numit
        go = 0;
    end 
    xsOld = xsreg;
    kk = kk+1;
end
