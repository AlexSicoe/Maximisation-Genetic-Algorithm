generations = 50;
individuals = 70;
pc = 0.75;
pcg= 1;
alfa = 0.65;
pm = 0.25;
pmg = 1;
sigma = 0.07;
tournamentParticipants = 3;

pop = genPop(individuals);

[bestFitIni, ~] = findBestCandidate(pop, "initial population");
vectorBestFit = zeros(1, generations);

for t = 1:generations
    pop = selectTournament(pop,tournamentParticipants);
    O = crossoverPop(pop, pc, pcg, alfa);
    MO = mutatePop(O, pm, pmg, sigma);
    pop = selectElitist(pop, MO);
    
    
    [bestFitness, ~] = findBestCandidate(pop);
    vectorBestFit(t) = bestFitness;
end

[~,n]=size(pop);
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
