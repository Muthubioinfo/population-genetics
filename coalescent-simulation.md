# Coalescence theory

```python

# Coalescence - tracing back to ancestry

# 1) Simulating ancestry
# 2) Plotting tree topologies
# 3) Estimating Time to Most Recent Common Ancestor (TMRCA)
# 4) Creating visualizations


import os
print(os.getcwd())
os.chdir("/Users/muthukumaranpanchaksaram/Documents/coding/popgen")
import msprime
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sb
from IPython.display import display

sb.set(style="whitegrid")

#Simulating a simple ancestry without assumption of recombination.
N = 1000
ts = msprime.sim_ancestry(samples=10, population_size=1e4, sequence_length=1e4,recombination_rate=0, random_seed=42) #No recombination

tree = ts.first()
svg = tree.draw_svg()
with open("tree.svg", "w") as f:
    f.write(svg)
print("Tree SVG saved to 'tree.svg'")


def tmrca_distribution_sim(samples=10,Ne=1e4, replicates=1000):
    tmrca_list = []
    for _ in range(replicates):
        ts = msprime.sim_ancestry(samples=samples, population_size=Ne, sequence_length=1e4, recombination_rate=0)
        tree = ts.first()
        tmrca = tree.time(tree.root)
        tmrca_list.append(tmrca)
    return tmrca_list

tmrca_list = tmrca_distribution_sim()


sb.histplot(tmrca_list, bins=30, kde=True)
plt.xlabel("tMRCA generations")
plt.ylabel("Frequency")
plt.title("Distribution of TMRCA for n = 10")
plt.show()


  
```
