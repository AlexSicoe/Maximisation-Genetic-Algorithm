function [O] = crossoverPop(P, pc, alfa)
%%%%%%Input:
%P = parents
%pc = crossover probability

%%%%%%Output:
%O = offspring
O = P;
[nInd,~] = size(P);
perm = randperm(nInd);

if (mod(nInd,2) == 1) %daca ultimul individ nu are pereche
    nInd = nInd-1;
end

for i = 1:2:nInd
    r = unifrnd(0,1);
    if (r <= pc)
        px = P(perm(i),:);
        py = P(perm(i+1),:);
        
        cx = crossoverReal(px, py, alfa);
        cy = crossoverReal(py, px, alfa);
        
        O(perm(i), :) = cx;
        O(perm(i+1), :) = cy;
    end
end


end

function[z] = crossoverReal(x, y, alfa)
%x, y - parents
%z - child

%alfa = unifrnd(0,1);
global n;
z=zeros(1,n);
for i=1:n-1    

        z(i) = alfa*x(i) + (1-alfa)*y(i);
end
z = checkFez_decision(z,x);
end
