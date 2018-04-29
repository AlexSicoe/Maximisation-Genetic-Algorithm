function [O] = crossoverPop(P, pc, pcg, alfa)
%%%%%%Input:
%P = parents
%pc = crossover probability

%%%%%%Output:
%O = offspring
O = P;
[m,col] = size(P);
perm = randperm(m);

if (mod(m,2) == 1) %daca ultimul individ nu are pereche
    m = m-1;
end

for i = 1:2:m
    r = unifrnd(0,1);
    if (r < pc)
        O(perm(i:i+1), :)  = crossoverSimpluReal(P(perm(i:i+1),:), col, pcg, alfa);
    end
end


end

function[children] = crossoverSimpluReal(parents, col, pcg, alfa)
%children = parents; %test

        children(1,:) = crossoverFormula(parents(1, :), parents(2, :), col, pcg, alfa);
        children(2,:) = crossoverFormula(parents(2, :), parents(1, :), col, pcg, alfa);
    

children(1,:) = checkFez_decision(children(1,:),parents(1,:));
children(2,:) = checkFez_decision(children(2,:),parents(1,:));
end

function[z] = crossoverFormula(x,y, col, pcg, alfa)
%x, y - parents
%z - child
z=zeros(1,col);
for i=1:col-1
   r = unifrnd(0,1);
   if (r < pcg)
       z(i) = alfa*x(i) + (1-alfa)*y(i);
   end
end

end


function[children] = crossoverSimplu(parents, col)
children = parents;
    children(2,1) = parents(1, 1);
    children(1,1) = parents(2, 1);
    %children(1,2) = parents(1, 2); %redundant
    %children(2,2) = parents(2, 2);

children(1,:) = checkFez_decision(children(1,:),parents(1,:));
children(2,:) = checkFez_decision(children(2,:),parents(1,:));
end


function[children] = crossoverMultipct(parents, col, pcg)
children = parents;
for i=1:col-1
   r = unifrnd(0,1);
   if(r < pcg)
       children(1,i) = parents(2, i);
       children(2,i) = parents(1, i);
%    else
%        children(1,i) = parents(1, i);
%        children(2,i) = parents(2, i);
   end
end
children(1,:) = checkFez_decision(children(1,:),parents(1,:));
children(2,:) = checkFez_decision(children(2,:),parents(1,:));
end

