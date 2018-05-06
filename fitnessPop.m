function [pop] = fitnessPop(pop)
global n;
[nInd,~] = size(pop);
for i = 1:nInd
    pop(i, n) = fitness(pop(i, :));
end

end