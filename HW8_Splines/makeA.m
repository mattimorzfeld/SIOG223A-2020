function A = makeA(x,k)
A = zeros(length(x),length(k));
for kk=1:length(x)              
    for jj=1:length(k)
        A(kk,jj) = lsp(x(kk),k,jj-1);
    end
end