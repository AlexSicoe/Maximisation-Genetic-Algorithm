function [fez] = checkFez(qty) 
fez = false;

if(qty(1)==0 && qty(2)==0)
   %fez = false; %e deja false
   return;
end

% if(qty(1)<0 || qty(2)<0)
%     return;
% end

disponibil = zeros(1,2);
disponibil(1) = 8;
disponibil(2) = 15;
req = zeros(2,2);
req(1, 1) = 2; %taiere prod1
req(1, 2) = 5; %rindeluire prod1
req(2, 1) = 2; %taiere prod2
req(2, 2) = 3; %rindeluire prod2

oreNecesareTaiere = qty(1)*req(1, 1) + qty(2)*req(2, 1);
oreNecesareRindeluire = qty(1)*req(1,2) + qty(2)*req(2,2);

if(oreNecesareTaiere < disponibil(1) && oreNecesareRindeluire < disponibil(2))
    fez = true;
    
end