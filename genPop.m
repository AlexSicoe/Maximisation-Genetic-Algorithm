function [pop] = genPop(n)
nrProducts = 2;
cols = nrProducts + 1;

pop = zeros(n, cols);
for i = 1:n
    pop(i, :) = genIndivid(pop(i, :));
end

end


function [individ] = genIndivid(individ)
individ = genAlleles(individ);
while(checkFez(individ) == false)
    individ = genAlleles(individ);
end

individ(3) = fitness(individ);
end

function [individ] = genAlleles(individ)
individ(1) = unifrnd(0,3); %nu pot produce mai mult de min(8/2, 15/5) = 3
individ(2) = unifrnd(0,5); %nu pot produce mai mult de min(8/2, 15/3) = 5
end



