# Coalescence theory

Coalescent theory is a retrospective model in population genetics that traces the genealogical history of a sample of alleles backward in time to their most recent common ancestor (MRCA). Instead of modeling how alleles evolve forward through generations, the coalescent focuses on how lineages merge ("coalesce") as we go back in time.

# Coalescent Simulation and Ancestral Analysis
- Simulating ancestry
- Plotting tree topologies
- Estimating Time to Most Recent Common Ancestor (TMRCA)
- Simulating TMRCA


## Step 1: Set Working Directory
```python
import os
print(os.getcwd())
os.chdir("/path-working-directory")
```

## Step 2: Import Required Libraries

```
import msprime
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sb
from IPython.display import display

sb.set(style="whitegrid")
```

```msprime``` – for simulating tree sequences using coalescent theory.
```seaborn``` & ```matplotlib``` – for plotting histograms of TMRCA values.
```IPython.display``` – optional, for showing output in notebooks.


### Step 3: Simulate a Simple Coalescent Ancestry
*Simulates ancestry for 10 sampled haploid genomes from a population of size, Ne = 10,000. The sequence length of each genome is 10,000, assuming no recombination, so only one tree.
The result is a TreeSequence object (ts), which contains one ancestral tree.

```python
N = 1000
ts = msprime.sim_ancestry(samples=10, population_size=1e4, sequence_length=1e4,recombination_rate=0, random_seed=42) #No recombination

tree = ts.first()
svg = tree.draw_svg()
with open("tree.svg", "w") as f:
    f.write(svg)
print("Tree SVG saved to 'tree.svg'")
```

## Step 5: Replicate the Simulation to Estimate TMRCA Distribution

```python
def tmrca_distribution_sim(samples=10,Ne=1e4, replicates=1000):
    tmrca_list = []
    for _ in range(replicates):
        ts = msprime.sim_ancestry(samples=samples, population_size=Ne, sequence_length=1e4, recombination_rate=0)
        tree = ts.first()
        tmrca = tree.time(tree.root)
        tmrca_list.append(tmrca)
    return tmrca_list

tmrca_list = tmrca_distribution_sim()
```

Step 6: Plot Histogram of TMRCA Values
Plots the distribution of TMRCA over all replicates
kde=True overlays a smoothed density curve.
Shows how coalescent times vary even with the same population parameters.

```python
sb.histplot(tmrca_list, bins=30, kde=True)
plt.xlabel("tMRCA generations")
plt.ylabel("Frequency")
plt.title("Distribution of TMRCA for n = 10")
plt.show()
```

  
![tmrca_distribution](https://github.com/user-attachments/assets/5b1d51f8-adbd-48f8-a412-30e808f23baf)
