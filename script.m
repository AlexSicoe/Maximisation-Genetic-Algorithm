individuals = 50;
generations = 200;
pc = 0.8;
alfa = 0.5;
pm = 0.2;
sigma = 0.07;
tournamentParticipants = 3;

global data, global m, global n;
global maxValues;
data = load("data.txt");
[m,n] = size(data);

maxValues = findMaxGeneValues();

pop = genPop(individuals);

[bestFitIni, ~] = findBestCandidate(pop, "initial population");
vectorBestFit = zeros(1, generations);

for t = 1:generations
    selPop = selectTournament(pop,tournamentParticipants);
    O = crossoverPop(selPop, pc, alfa);
    MO = mutatePop(O, pm, sigma);
    MO = fitnessPop(MO);
    pop = selectElitist(pop, MO);
    
    [bestFitness, ~] = findBestCandidate(pop);
    vectorBestFit(t) = bestFitness;
end


figure();
hist(pop(:,n));
title('Distribution of Final Population');
xlabel('Fitness (Profit in Lei)');
ylabel('Individuals');

figure();
plot(0:generations, [bestFitIni vectorBestFit]);
title('Population history');
xlabel('t (Generations)');
ylabel('Fitness (Profit in Lei)');

findBestCandidate(pop, "final population");
