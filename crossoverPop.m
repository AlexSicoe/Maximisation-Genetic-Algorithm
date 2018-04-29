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
