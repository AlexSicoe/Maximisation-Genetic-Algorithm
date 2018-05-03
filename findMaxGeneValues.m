function [maxVal] = findMaxGeneValues()
global date, global m, global n;

% i - current product
% j - current operation 

maxVal = zeros(1, n-1);
ratios = zeros(1, m-1);
for i = 1:n-1
   for j = 1:m-1
       ratios(j) = date(j,n) / date(j,i);
   end
   maxVal(i) = min(ratios);
end

end

