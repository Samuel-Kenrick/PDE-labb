function [p] = h(x)% you could define h(x) at the end of the script
n=length(x);% defining h so that h accepts a vector of x-values could simplify calling h
for i=1:n
    if (x(i)==0 || x(i)==pi || x(i)==2*pi)
        p(i) = 0;
    elseif (x(i)>0 && x(i)<pi)
        p(i) = 1;
    else
        p(i) = -1;
    end
end
end