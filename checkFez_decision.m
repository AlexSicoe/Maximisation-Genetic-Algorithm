function [changedIndivid] = checkFez_decision(changedIndivid,initIndivid)
if (checkFez(changedIndivid) == false)
    changedIndivid = initIndivid; %nicio schimbare
end
end

