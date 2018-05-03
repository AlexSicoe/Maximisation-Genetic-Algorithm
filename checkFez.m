function [fez] = checkFez(qty)
fez = false;
global date, global m, global n;


disponibil = zeros(1,m-1);
for i = 1:m-1
    disponibil(i) = date(i,n);
end

op = zeros(1, m-1);
for i = 1:m-1
    for j = 1:n-1
        op(i) = op(i) + qty(j)*date(i, j);
    end
end

flag = 0;
for i=1:m-1
    if(op(i) > disponibil(i))
        flag = 1;
    end
end

if(flag == 0)
    fez = true;
end

end