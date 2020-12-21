function C = covMatrix(sig,L,dx,n)
C = zeros(n);
for kk =1:n
    for ii=kk:n
        C(ii,kk) = sig^2*exp(-0.5*((ii-kk)*dx/L)^2);
        C(kk,ii) = C(ii,kk);
    end
end



