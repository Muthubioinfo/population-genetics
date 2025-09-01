# Coalescence theory

A simple python code to demonstrate probability of coalescence using a simple simulation of Kingman’s coalescent process.

```python
import numpy as np
import matplotlib.pyplot as plt

#### Algorithm 1
n = 50 # Number of tmax
N = 5 # Population size
tmax = list(range(n))
new_internal_node = n

# Initialise
k = n
waiting_times = []
coalescent_events = []
current_time = 0.0
node_times = {i: 0.0 for i in tmax}  # Time = 0 for all leaves
tree = {}  # Dictionary to store tree: key = node, value = (child1, child2)
tmax = list(range(n))
new_internal_node = n

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

The below plot shows the geometric (discrete exponential) distribution of probabilities, ```p(t)```, over ```t``` generations 
(probabilitiy denoted as pt in the code). It represents the probability that two tmax coalesce exactly at generation 
```t``` back to their most recent common ancestor (MRCA). 

<img width="959" alt="image" src="https://github.com/Muthubioinfo/population-genetics/blob/main/coalescence_probabilities.png" />





