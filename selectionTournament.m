function [parinti] = selectionTournament(pop, k)
%selectia de tip turneu pt alegerea parintilor 
%input:
%pop - populatia curenta
%k - numarul de participanti la fiecare turneu
%output: 
%parinti - multisetul de parinti selectati

[m, n] = size(pop);
parinti = zeros(m,n);
    for i = 1:m
        turneu = unidrnd(m,1,k);
        valori = zeros (1, k);
        for j = 1:k
            valori(j) = pop (turneu(j), n);
        end
        [~, p] = max(valori); %p = pozitia la care se gaseste maximul
        parinti(i,:) = pop(turneu(p),:);
    end

end
