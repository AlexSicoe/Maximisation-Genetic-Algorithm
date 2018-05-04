function [MO] = mutatePop(O, pm, sigma)
[nInd,~] = size(O);

MO = O;
for i=1:nInd
    r = unifrnd(0,1);
    if (r <= pm)
        MO(i,:) = mutationCreep(O(i, :), sigma);
    end
end
end

function [mIndivid] = mutationCreep(individ, sigma)
global n;
minVal = 0;
global maxValues;   %maxValues = [3,5];
mIndivid = zeros(1,n);
for i=1:n-1
    %R has mean 0 and deviation sigma
    R = normrnd(0,sigma);
    mIndivid(i) = individ(i) + R;
   
        if(mIndivid(i) < minVal)
            mIndivid(i) = minVal;
        elseif(mIndivid(i) > maxValues(i))
            mIndivid(i) = maxValues(i);
        end
end
mIndivid = checkFez_decision(mIndivid,individ);
end


