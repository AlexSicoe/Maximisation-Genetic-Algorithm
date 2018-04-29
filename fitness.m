function [f] = fitness(qty)
profit1 = 120; %lei pt k unitati
profit2 = 100;
f = profit1 * qty(1) + profit2 * qty(2);
end

