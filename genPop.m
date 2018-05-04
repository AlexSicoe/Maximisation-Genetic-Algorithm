function [pop] = genPop(nInd)
global n;



pop = zeros(nInd, n);
for i = 1:nInd
    pop(i, :) = genIndivid(pop(i, :));
end

end


function [individ] = genIndivid(individ)
global n;

%do while loop
individ = genAlleles(individ);
while(checkFez(individ) == false)
    individ = genAlleles(individ);
end

individ(n) = fitness(individ);
end

function [individ] = genAlleles(individ)
global n, global maxValues;

%individ(1) = unifrnd(0,3); %nu pot produce mai mult de min(8/2, 15/5) = 3
%individ(2) = unifrnd(0,5); %nu pot produce mai mult de min(8/2, 15/3) = 5
for i = 1:n-1
    individ(i) = unifrnd(0, maxValues(i));
end

end



