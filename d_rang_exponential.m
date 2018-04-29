function [p, q] = d_rang_exponential(m)
% m - dimensiune populatie

p = zeros(1,m);
for i = 1:m
    p(i) = 1 - exp(-i);
end

c = sum(p);
p = p/c;


q = zeros(1,m);
q(1) = p(1);
    for i = 2:m
        q(i) = q(i-1) + p(i); %suma celor anterioare plus elementul curent
    end
end