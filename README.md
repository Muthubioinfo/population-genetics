# Population-genetics
This repo contains brief tutorial of the important concepts in population genetics such as Random genetic drift, Inbreeding coefficient (see ```Inbreeding.py```), Coalescence (Backward simulation, see ```coalescent-simulation.md```) , and Forward simulation using Wright-Fisher model based on ancestral recombination graph (see ```Forward-simulation-ARG.md```). I provide R and Python scripts to showcase these concepts and aim to improve this repo furthermore.

## Random genetic drift
For simulating under random genetic drift, I constructed a R package called 'genedriftsim'. Here, I study two cases of random genetic drift -

```r
devtools::install_github("Muthubioinfo/population-genetics/genedriftsim")
```

### Case: 1 - Individual-level allele sampling (no replicates)
This simulation models the process of genetic drift by randomly sampling alleles for each individual in the population, based on current allele frequencies. It mimics drawing alleles from a gene pool, where the probability of selecting each allele (e.g., A or a) corresponds to its frequency in the population.

For example, assuming the initial frequencies of alleles A and a are both 0.5, in a population of size _N_ = 100 over 20 generations:

```r
simulate_drift_sample(allele_freq = c(0.5, 0.5), pop_size = 100, num_generations = 20)
```

<img width="959" alt="image" src="https://github.com/user-attachments/assets/a5b506f3-7029-4ee0-9cb7-78ef20a6fc7b" />


### Case: 2 - Random drift and Wright–Fisher model (Binomial sampling of allele counts)
This simulation models genetic drift using the Wright–Fisher model, where allele frequencies change across generations due to random binomial sampling of alleles from the previous generation. Instead of tracking individuals, this approach simulates the total count of a specific allele in the population over time, assuming a fixed population size.

Unlike Case 1, this method supports multiple replicates, making it useful for analyzing the variability of drift trajectories under identical starting conditions.

For example, to simulate 10 replicate trajectories of allele A (initial frequency = 0.2) in a population of 200 diploid individuals over 100 generations:

```r
genedriftsim::simulate_drift_matrix(N = 100, p = 0.2, G = 50, nsim = 20)
```

Use ```genedriftsim::plot_drift_matrix()``` to plot Generations vs Allele frequency

<img width="991" alt="image" src="https://github.com/user-attachments/assets/28010f88-6e61-4ae2-b5e3-e5bc1a9884ac" />


