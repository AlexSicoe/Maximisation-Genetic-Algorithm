function [value] = dRndStep(min, max, step)
value = (unidrnd((1/step)*max+1)-1+min)*step;
end
