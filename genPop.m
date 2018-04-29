function [pop] = genPop(n)
    nrProducts = 2;
    cols = nrProducts + 1;
    
    pop = zeros(n, cols);
    parfor i = 1:n 
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
%step=0.1;
%individ(1) = (unidrnd(3+1)-1); %qty1 
%individ(2) = (unidrnd(5+1)-1); %qty2 
individ(1) = unifrnd(0,3); %nu pot produce mai mult de min(8/2, 15/5) = 3
individ(2) = unifrnd(0,5); %nu pot produce mai mult de min(8/2, 15/3) = 5
%individ(1) = dRndStep(0, 3, step); 
%individ(2) = dRndStep(0, 5, step); 

end



