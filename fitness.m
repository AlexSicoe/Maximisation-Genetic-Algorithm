function [f] = fitness(qty)
%profit1 = 120; %lei pt k unitati
%profit2 = 100;
%f = profit1 * qty(1) + profit2 * qty(2);

global date, global m, global n;

f = 0;
for i = 1:n-1
    %profit(i) este date(m, i);
    f = f + date(m, i) * qty(i);
end

end

