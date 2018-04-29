function [parinti] = selectionSimpleRoulette(pop)
 % selectia tip ruleta simpla
 % I: pop - populatia curenta
 % E: parinti - multisetul indivizilor selectati
 
 [m, n]  = size(pop);
 

%[~,q] = d_FPS_Simplu(pop);  %daca vreau alta distributie, inlocuiesc apelul de aici
%[~,q] = d_FPS_SS(pop, 2);
[~,q] = d_rang_liniar(m,1.5); sortrows(pop,n);
%[~,q] = d_rang_exponential(m); sortrows(pop,n);
 
parinti = zeros(m,n);
    for k = 1:m
        r = unifrnd(0,1);
        i = 1;
        while i<m && r>q(i)
           i = i+1;
        end
        parinti(k, :) = pop(i,:);
    end
end

