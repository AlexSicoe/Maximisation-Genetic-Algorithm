function [changedIndivid] = checkFez_decision(changedIndivid,initIndivid)
global n;
if (checkFez(changedIndivid) == false)
    changedIndivid = initIndivid; %nicio schimbare
else
    changedIndivid(n) = fitness(changedIndivid);
    
end
end

