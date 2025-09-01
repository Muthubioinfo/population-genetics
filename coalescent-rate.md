# Coalescence theory

In population genetics, coalescence refers to the process of tracing lineages of sampled alleles backwards in time until they merge at a common ancestor. For example, if we take two alleles from a diploid population, at some point in the past they must have descended from the same ancestral copy — this is called their most recent common ancestor (MRCA).

In a diploid population of size `N`, the probability that two lineages coalesce in a single generation is:

$$
p = \frac{1}{2N}
$$

This leads to a **geometric distribution** for the waiting time (in generations) until coalescence:

$$
P(T = t) = \left(1 - \frac{1}{2N}\right)^{t-1} \cdot \frac{1}{2N}, \quad t = 1, 2, 3, \dots
$$


In discrete generations, the waiting time follows a geometric distribution, where the probability that two lineages coalesce exactly at generation ```t``` is:
   
$$
p(t) = \left(1 - \frac{1}{2N}\right)^{t-1} \cdot \frac{1}{2N}
$$

The following Python code demonstrates the discrete-time probability of coalescence using a simple simulation of Kingman’s coalescent process. The coalescent waiting time between two lineages follows a geometric distribution in discrete generations (which is the discrete analogue of the exponential distribution in continuous time).

```python
import numpy as np
import matplotlib.pyplot as plt

#### Algorithm 1
n = 50 # Number of generations
N = 5 # Population size
tmax = list(range(n))

#Define function to calculate the probability that two lineages coalesce
def func(tmax, N):
    p = {}
    for t in range(1, (max(tmax) + 1)):
        p[t] = (1 - (1 / (2*N)))**(t-1) * (1 / (2*N))
    return p

pt = func(tmax, N)

# Extract keys and values properly
t = list(pt.keys())
p = list(pt.values())

# Plot
plt.plot(t, p, marker='o', linestyle='-')
plt.xlabel("t (generations)")
plt.ylabel("p(t)")
plt.title("Probability of Coalescence at t generation")
plt.grid(True)
plt.show()
```

The below plot shows the geometric (discrete exponential) distribution of probabilities, ```p(t)```, over ```t``` generations. It represents the probability that two lineage coalesce exactly at generation ```t``` back to their MRCA. 

<img width="959" alt="image" src="https://github.com/Muthubioinfo/population-genetics/blob/main/coalescence_probabilities.png" />





