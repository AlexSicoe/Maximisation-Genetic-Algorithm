function [parinti] = selectTournament(pop, k)
%selectia de tip turneu pt alegerea parintilor
%input:
%pop - populatia curenta
%k - numarul de participanti la fiecare turneu
%output:
%parinti - multisetul de parinti selectati
global n;
[nInd, ~] = size(pop);
parinti = zeros(nInd,n);
for i = 1:nInd
    turneu = unidrnd(nInd,1,k);
    valori = zeros (1, k);
    for j = 1:k
        valori(j) = pop (turneu(j), n);
    end
    [~, p] = max(valori); %p = pozitia la care se gaseste maximul
    parinti(i,:) = pop(turneu(p),:);
end

end
