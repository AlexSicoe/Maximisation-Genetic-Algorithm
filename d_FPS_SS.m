function [g , q] = FPS_SS (pop, c)
%distributia de probabilitate de selectie tip FPS cu sigma scalare
% I: pop- pop curenta (daca e vorba de selectia parintilor e doar populatia
% generata
    
%daca e vorba de selectia generatiei urmatoare... avem 
%populatia curenta + descendentii

%c - constanta pentru ajustare

%E: g - vector de probabilitati de selectie
% q - vector cu probabilitati cumulate succesiv

[m,n] = size(pop);
medie = mean(pop(:,n));
sigma = std(pop(:,n));
val = medie-c*sigma;

g = zeros (1, m);
for i = 1:m
    g(i) = max( [0 pop(i,n)-val]); %maxim dintre 0 si val ajustata. Ca sa nu ai prob negative, si sa nu scrii ifuri...
end

s=sum(g);
g = g/s;




q = zeros(1,m);
q(1) = g(1);
    for i = 2:m
        q(i) = q(i-1) + g(i); %suma celor anterioare plus elementul curent
    end
end

