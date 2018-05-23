function [fez] = checkFez(qty)
global data, global m, global n;

%op - vector in care fiecare element reprezinta costul total al operatiei respective
%Nicio operatie nu trebuie sa depaseasca timpul disponibil operatiei (luat din fisier)


disponibil = data(1:m-1, n);

op = zeros(1, m-1);
for i = 1:m-1
    for j = 1:n-1
        op(i) = op(i) + qty(j)*data(i, j);
    end
end    

%pornesc de la prezumptia ca avem un individ fezabil
fez = true;
for i=1:m-1
    if(op(i) > disponibil(i))
        fez = false;
        break;
    end
end

end