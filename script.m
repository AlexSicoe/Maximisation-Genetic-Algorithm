generations = 50;
individuals = 70;
pc = 0.75;
pcg= 1;
alfa = 0.65;
pm = 0.25;
pmg = 1;
sigma = 0.07;
pop = genPop(individuals);


findBestCandidate(pop, "initial population");

[bestFitIni, ~] = findBestCandidate(pop);
vectorBestFit = zeros(1, generations);

for t = 1:generations   
disp(t);
pop = selectionTournament(pop,3);
%pop = selectionSimpleRoulette(pop);
%pop = selectionSUS(pop);

O = crossoverPop(pop, pc, pcg, alfa);
%findBestCandidate(O, "offspring");

MO = mutationPop(O, pm, pmg, sigma);

%findBestCandidate(MO, "mutated offspring");

pop = selectionElitist(pop, MO);
%findBestCandidate(pop, "survivors");

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
%plot(vectorBestFit);
title('Population history');
xlabel('t (Generations)');
ylabel('Fitness (Profit in Lei)');

findBestCandidate(pop, "final population");
