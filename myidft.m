function y = myidft(z)

N = length(z);
omega = exp (2*pi*i/N)

for n = 1:N
    y(n) = 0;
    for j = 1:N
        y(n) = y(n) + z(j)*omega^((n-1)*(j-1));
    end
    
end
end