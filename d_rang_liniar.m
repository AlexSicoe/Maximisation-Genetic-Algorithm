function [p, q] = d_rang_liniar(m, s)
% m - dimensiune populatie
% s - constanta intre 1 si 2.. ca sa nu avem valori negative


p = zeros(1,m);
for i = 1:m
    p(i) = (2-s) / m + 2*i*(s-1) / (m*(m+1));
end

s = sum(p);
p = p/s;


q = zeros(1,m);
q(1) = p(1);
    for i = 2:m
        q(i) = q(i-1) + p(i); %suma celor anterioare plus elementul curent
    end
end


