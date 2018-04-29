function [bestFitness, bestCandidate] = findBestCandidate(Pop, populationType)
[~,n] = size(Pop);

[bestFitness, candidateIndex] = max(Pop(:,n));
bestCandidate = Pop(candidateIndex, 1:n-1);
    if (populationType ~= 0)
    disp('Best candidate from ' + populationType + ':' );
    disp(bestCandidate);
    disp("Fitness: " + bestFitness);
    end
end
