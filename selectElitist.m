function [ generatie ] = selectElitist(pop, desc)
% selectia elitista
% I: pop - generatia curenta
%     desc - descendentii calculati din pop
% (desc - multisetul indivizilor deja selectati pt supravietuire) .. pt
% varianta in care selectia elitista e aplicata suplimentar dupa un alt
% mecanism de selectie
% E: generatie - noua generatie (supravietuitorii)

global n;
generatie = desc;
[max1, i] = max(pop(:,n));
[max2, ~] = max(desc(:,n));
if max1 > max2
    %trebuie sa scapam de cel mai slab
    [~, k] = min(desc(:,n));
    generatie(k, :) = pop(i,:);
end

end

