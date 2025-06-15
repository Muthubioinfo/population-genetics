
# Forward-time simulation - Wright-Fisher model

Wright-Fisher model: Randomly select 2N individuals chosen at random and undergo reproduction/mating to produce successive generations.


In Ancestral Recombination Graph, the parents are chosen randomnly and children are successive generation.

```python
import tskit
import numpy as np

random_seed = 2
random = np.random.default_rng(random_seed)
L = 50000 #Population of 50,000 individuals

# For visualising unsimplified tree sequences, it can help to flag all nodes as samples
default_node_flags = tskit.NODE_IS_SAMPLE

#Create a new diploid individual (child) by add a row to table
def make_diploid(tables, time, parent_individual) -> tuple[int, tuple[int, int]]:
    individual_id = tables.individual.add.row(parent_individual)
    return individual_id, (
        tables.nodes.add.row(default_node_flags, time, individual=individual_id),
        tables.nodes.add.row(default_node_flags, time, individual=individual_id)
    )


#Inheritance without recombination
def add_inheritance_paths(tables, parent_nodes, child_node, recombination_rate):
    "Add inheritance paths from a randomly chosen parent genome to the child genome."
    assert recombination_rate == 0
    left, right = [20_000, 21_000]  # only define inheritance in this focal region
    inherit_from = random.integers(2)  # randomly choose the 1st or the 2nd parent node
    tables.edges.add_row(left, right, parent_nodes[inherit_from], child_node)

#Inheritance with recombination
def add_inheritance_paths_recomb(tables, parent_genomes, child_genome, recombination_rate):
    "Add paths from parent genomes to the child genome, with crossover recombination."
    L = tables.sequence_length
    num_recombinations = random.poisson(recombination_rate * L)
    breakpoints = random.uniform(0, L, size=num_recombinations)
    breakpoints = np.concatenate(([0], np.unique(breakpoints), [L]))
    inherit_from = random.integers(2)  # starting parental genome

    # iterate over pairs of ([0, b1], [b1, b2], [b2, b3], ... [bN, L])
    for left, right in zip(breakpoints[:-1], breakpoints[1:]):
        tables.edges.add_row(
            left, right, parent_genomes[inherit_from], child_genome)
        inherit_from = 1 - inherit_from  # switch to other parent genome


def new_population(tables, time, prev_pop, recombination_rate) -> dict[int, tuple[int, int]]:
    pop = {}  # fill with individual_ID: (maternal_genome_ID, paternal_genome_ID)

    # Cache the list of individual IDs in the previous population, for efficiency
    prev_individuals = np.array([i for i in prev_pop.keys()], dtype=np.int32)

    for _ in range(len(prev_pop)):
        # 1. Pick two individual parent IDs at random, `replace=True` allows selfing, i.e., the same parent be as mother or father. 
        mother_and_father = random.choice(prev_individuals, 2, replace=True) 

        # 2. Get 1 new individual ID + 2 new node IDs
        child_id, child_genomes = make_diploid(tables, time, mother_and_father)
        pop[child_id] = child_genomes  # store the genome IDs
        
        # 3. Add inheritance paths to both child genomes
        for child_genome, parent_individual in zip(child_genomes, mother_and_father):
            parent_genomes = prev_pop[parent_individual]
            add_inheritance_paths(tables, parent_genomes, child_genome, recombination_rate)
    return pop

def initialise_population(tables, time, size) -> dict[int, tuple[int, int]]:
    # Just return a dictionary by repeating step 2 above
    return dict(make_diploid(tables, time) for _ in range(size))
```
