# Population-genetics
This repo contains tutorials on basic important concepts in population genetics such as Random genetic drift, Inbreeding coefficient, Coalescent (Backward simulation using ancestral recombination graph), and Forward simulation using Wright-Fisher model.
I provide R and Python scripts to showcase these concepts. I aim to improve this repo furthermore.

I constructed a R package called 'genedriftsim', that has two cases to study Random genetic drift -

### Case: 1 - Individual-level allele sampling (no replicates)
This involves simulating the selection of alleles from a population, one individual at a time, using allele frequencies. This process mimics drawing alleles randomly from a gene pool, where the probability of selecting each allele (A or a) is determined by its frequency in the population. 

For example, assuming the allele frequency of A and a are both equal to 0.5 in a population of size, _N_ = 100 and number of generations = 20

```r
simulate_drift_sample(allele_freq = c(0.5, 0.5), pop_size = 100, num_generations = 20)
```

<img width="959" alt="image" src="https://github.com/user-attachments/assets/a5b506f3-7029-4ee0-9cb7-78ef20a6fc7b" />


### Case: 2 - Random drift and Wright–Fisher model (Binomial sampling of allele counts)

- Models the change in allele frequency across generations and replicates.
- Use binomial sampling to simulate the number of copies of allele A1 in each generation.
- Tracks multiple simulation replicates (nsim).

Output:
A data.frame of shape (G generations × nsim replicates). Each column is a simulation; each row is a generation.

For example: 
Consider a population size, _N_ = 1000 individuals with initial allele frequency, _p_ = 0.2 for _G_ = 50 generations.
The number of simulated replicates, nsim = 20.

```r
genedriftsim::simulate_drift_matrix(N = 100, p = 0.2, G = 50, nsim = 20)
```

Use ```genedriftsim::plot_drift_matrix()``` to plot Generations vs Allele frequency

<img width="991" alt="image" src="https://github.com/user-attachments/assets/28010f88-6e61-4ae2-b5e3-e5bc1a9884ac" />


