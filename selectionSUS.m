function [pop] = selectionSUS(pop)
% selectia de tip ruleta multi-brat
% I: pop - multisetul din care se face selectia

% poate fi pop curenta (pt selectia parintilor)
% sau pop curenta + descendenti ( pt selectia generatiei urmatoare) 

% E: parinti - multisetul cu indivizii selectati
[m,n] = size(pop);
%[~,q] = d_FPS_Simplu(pop);
%[~,q] = d_FPS_SS(pop, 2);
[~,q] = d_rang_liniar(m,1.5); sortrows(pop,n);
%[~,q] = d_rang_exponential(m); sortrows(pop,n);

parinti = zeros(m,n);
%incepem cu primul individ si primul sector
k = 1;
i = 1;
r = unifrnd(0,1/m);  %valoare random intre 0 si primul brat, adica 1/m. 
    while k<=m
        while r<q(i)
            parinti(k, :) = pop(i,:);
            r = r + 1/m; %merg la urmatorul brat
            k = k + 1;
        end
        i = i+1;
    end
end
