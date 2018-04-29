function [fez] = checkFez(qty) 
fez = false;

if(qty(1)==0 && qty(2)==0)
   %fez = false; %e deja false
   return;
end

% if(qty(1)<0 || qty(2)<0)
%     return;
% end

date = load("date.txt");
[m,n] = size(date);


disponibil = zeros(1,n-1);
for i = 1:n-1
    disponibil(i) = date(m,i);
end

% req = zeros(m-1,n-1);
% for i=1:m-1
%     for j=1:n-1
%         req(i,j) = date(i,j);
%     end
% end

% 
% req(1, 1) = 2; %taiere prod1
% req(1, 2) = 5; %rindeluire prod1
% req(2, 1) = 2; %taiere prod2
% req(2, 2) = 3; %rindeluire prod2


op = zeros(1, m-1);
for i = 1:n-1
    for j = 1:m-1
        op(i) = op(i) + qty(j)*date(j, i);
    end
end

flag = 0;
for i=1:n-1
    if(op(i) > disponibil(i))
        flag = 1;
    end
end

if(flag == 0)
fez = true;
end


    
end