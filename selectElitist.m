function [ nextGeneration ] = selectElitist(parents, children)
global n;
nextGeneration = children;
[fParentLeader, indexParentLeader] = max(parents(:,n));
[fChildLeader, ~] = max(children(:,n));
if fParentLeader > fChildLeader
    [~, indexWeakestChild] = min(children(:,n)); %we have to get rid of the weakest child
    nextGeneration(indexWeakestChild, :) = parents(indexParentLeader,:);
end
end

