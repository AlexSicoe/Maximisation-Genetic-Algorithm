function [MO] = mutatePop(O, pm, sigma)
[n,m] = size(O);
minVal = 0;
maxVal = [3,5]; %todo
MO = O;
for i=1:n
    r = unifrnd(0,1);
    if (r < pm)
        MO(i,:) = mutationCreep(O(i, :), m, minVal, maxVal, sigma);
    end
end
end

function [mIndivid] = mutationCreep(individ, m, minVal, maxVal, sigma)
%pmg - probability to mutate a gene
%%%%%%%%%%%%%%%%%
mIndivid = zeros(1,m);
for i=1:m-1
    %R has mean 0 and deviation sigma
    R = normrnd(0,sigma);
    mIndivid(i) = individ(i) + R;
    switch mIndivid(i)
        case mIndivid(i) < minVal
            mIndivid(i) = minVal;
        case mIndivid(i) > maxVal(i)
            mIndivid(i) = maxVal(i);
    end
end
mIndivid = checkFez_decision(mIndivid,individ);
end


