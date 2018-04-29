function [pop] = fitnessPop(pop)
[individuals,~] = size(pop);
for i = 1:individuals
    pop(i, 3) = fitness(pop(i, :));
end

end