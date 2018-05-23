function [bestFitness, bestCandidate] = findBestCandidate(varargin)
global n;
if nargin == 1
    Pop = varargin{1};
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
    
    [bestFitness, candidateIndex] = max(Pop(:,n));
    bestCandidate = Pop(candidateIndex, 1:n-1);
elseif nargin == 2
    Pop = varargin{1};
    populationName = varargin{2};
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    [bestFitness, candidateIndex] = max(Pop(:,n));
    bestCandidate = Pop(candidateIndex, 1:n-1);
    
    disp('Best candidate from ' + populationName + ':' );
    disp(bestCandidate);
    disp("Fitness: " + bestFitness);
    
else
    error('Function accepts up to 2 arguments!');
end