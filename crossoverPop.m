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
        px = P(perm(i),:);
        py = P(perm(i+1),:);
        
        cx = crossoverReal(px, py, col, pcg, alfa);
        cy = crossoverReal(py, px, col, pcg, alfa);
        
        %cx = crossoverSimplu(px, py);
        %cy = crossoverSimplu(py, px);
        
        O(perm(i), :) = cx;
        O(perm(i+1), :) = cy;
    end
end


end

function[z] = crossoverReal(x, y, col, pcg, alfa)
%x, y - parents
%z - child
z=zeros(1,col);
for i=1:col-1
    r = unifrnd(0,1);
    if (r < pcg)
        z(i) = alfa*x(i) + (1-alfa)*y(i);
    end
end
z = checkFez_decision(z,x);
end


function[z] = crossoverSimplu(x, y)
z(1) = x(1);
z(2) = y(2);
z = checkFez_decision(z,x);
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

