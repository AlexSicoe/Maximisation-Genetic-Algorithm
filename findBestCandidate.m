function [bestFitness, bestCandidate] = findBestCandidate(varargin)
if nargin == 1
    Pop = varargin{1};
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [~,n] = size(Pop);

    [bestFitness, candidateIndex] = max(Pop(:,n));
    bestCandidate = Pop(candidateIndex, 1:n-1);
elseif nargin == 2
    Pop = varargin{1};
    populationType = varargin{2};
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [~,n] = size(Pop);

    [bestFitness, candidateIndex] = max(Pop(:,n));
    bestCandidate = Pop(candidateIndex, 1:n-1);
          
    disp('Best candidate from ' + populationType + ':' );
    disp(bestCandidate);
    disp("Fitness: " + bestFitness);
            
else
    error('Function accepts up to 2 arguments!');
end