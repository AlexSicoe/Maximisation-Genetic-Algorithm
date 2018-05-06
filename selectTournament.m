function [selPop] = selectTournament(pop, k)
global n;
[nInd, ~] = size(pop);
selPop = zeros(nInd,n);
for i = 1:nInd
    tournament = unidrnd(nInd,1,k);
    fValues = zeros (1, k);
    for j = 1:k
        fValues(j) = pop(tournament(j), n);
    end
    [~, fMaxIndex] = max(fValues);
    selPop(i,:) = pop(tournament(fMaxIndex),:);
end
end
    