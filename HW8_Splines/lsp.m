function out = lsp(x,k,j)
if j==0
    if x<k(1)
        out = 0;
    elseif x>=k(1) && x<=k(2)
        out = (k(2)-x)/(k(2)-k(1));
    elseif x>=k(2)
        out = 0;
    end
elseif j==length(k)-1
    if x>k(end)
        out = 0;
    elseif x<=k(end-1)
        out = 0;
    elseif k(end-1)<=x && x<=k(end)
        out = (x-k(end-1))/(k(end)-k(end-1));
    end
else
    if x<=k(j)
        out = 0;
    elseif x>=k(j) && x<=k(j+1)
        out = (x-k(j))/(k(j+1)-k(j));
    elseif x>=k(j+1) && x<=k(j+2)
        out = (k(j+2)-x)/(k(j+2)-k(j+1));
    else
        out = 0;
    end
end