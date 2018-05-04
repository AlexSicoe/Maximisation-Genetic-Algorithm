function [f] = fitness(qty)
%profit1 = 120; %lei pt k unitati
%profit2 = 100;
%f = profit1 * qty(1) + profit2 * qty(2);

global data, global m, global n;

f = 0;
for i = 1:n-1
    %data(m,i) is profit(i)
    f = f + data(m, i) * qty(i);
end

end

