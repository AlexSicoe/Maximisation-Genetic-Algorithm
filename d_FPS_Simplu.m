function [p , q] = FPS_Simplu(pop)
%distributia de probabilitate de selectie tip FPS simpla
% I: pop- pop curenta (daca e vorba de selectia parintilor e doar populatia
% generata
%daca e vorba de selectia generatiei urmatoare... avem 
%populatia curenta + descendentii

%E: p - vector de probabilitati de selectie
% q - vector cu probabilitati cumulate succesiv

[m,n] = size(pop);
p = pop(:,n);
s = sum(p);
p = p/s;

q = zeros(1,m);
q(1) = p(1);
    for i = 2:m
        q(i) = q(i-1) + p(i); %suma celor anterioare plus elementul curent
    end
end


