function [changedIndivid] = checkFez_decision(changedIndivid,initIndivid)

if (checkFez(changedIndivid) == false)
    changedIndivid = initIndivid; %nicio schimbare
else
    changedIndivid(3) = fitness(changedIndivid);
    
end
end

