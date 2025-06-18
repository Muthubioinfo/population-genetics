#Inbreeding: Homozygosity, IBD, and Inbreeding Depression

Key Concepts:
- Inbreeding increases the proportion of **homozygous individuals** (AA, aa) at the cost of heterozygotes (Aa).
- Inbreeding coefficient (F) is the probability that two alleles are **identical by descent**.
- Relative Risk** quantifies how inbreeding increases the chance of expressing recessive genetic diseases.
- F_I for an individual in a pedigree is computed by summing over all paths to a common ancestor.
- Inbreeding Depression is the reduction in fitness due to expression of deleterious alleles.

# ----------------------------------------------------------------------------
# 🧬 PART 1: GENOTYPE FREQUENCIES ACROSS GENERATIONS DUE TO INBREEDING
# ----------------------------------------------------------------------------

```python
def simulate_genotype_frequencies(generations=5):
    """
    Simulates change in genotype frequencies over generations due to inbreeding.
    Assumes Hardy-Weinberg starting frequencies (1/4, 1/2, 1/4 for AA, Aa, aa).
    """
    AA = Fraction(1, 4)
    Aa = Fraction(1, 2)
    aa = Fraction(1, 4)

    print("Gen\tAA\t\tAa\t\taa")
    for g in range(generations):
        print(f"G{g+1}\t{float(AA):.4f}\t{float(Aa):.4f}\t{float(aa):.4f}")
        AA += Aa / 4
        aa += Aa / 4
        Aa = Aa / 2

simulate_genotype_frequencies()
```

# ----------------------------------------------------------------------------
# 🧬 PART 2: INBREEDING COEFFICIENT & EFFECT ON GENOTYPE PROPORTIONS
# ----------------------------------------------------------------------------

```python
def inbreeding_coefficient(H_observed, p, q):
    """
    Computes the inbreeding coefficient F based on observed heterozygosity.
    Also returns expected genotype frequencies (AA, Aa, aa) with F.
    """
    H0 = 2 * p * q
    F = (H0 - H_observed) / H0
    AA = p ** 2 + p * q * F
    Aa = 2 * p * q * (1 - F)
    aa = q ** 2 + p * q * F
    return F, AA, Aa, aa

# Example:
F, AA, Aa, aa = inbreeding_coefficient(H=0.1, p=0.6, q=0.4)
print(f"\nInbreeding coefficient F = {F:.3f}")
print(f"Expected with inbreeding: AA = {AA:.3f}, Aa = {Aa:.3f}, aa = {aa:.3f}")
```

# ----------------------------------------------------------------------------
# 🧬 PART 3: RELATIVE RISK OF DISEASE FROM A RECESSIVE ALLELE (INBREEDING DEPRESSION)
# ----------------------------------------------------------------------------

```python
def relative_risk(F, q):
    """
    Estimates the relative risk of being homozygous for a rare recessive allele (aa)
    in an inbreeding population compared to random mating.
    """
    baseline = q ** 2  # Risk under random mating
    inbred_risk = (q ** 2 * (1 - F)) + q * F
    rr = inbred_risk / baseline
    print(f"Relative risk due to inbreeding (F={F}, q={q}): {rr:.2f}")

relative_risk(F=1/16, q=0.01)
```

# ----------------------------------------------------------------------------
# 🧬 PART 4: PEDIGREE-BASED INBREEDING COEFFICIENT (Wright’s path method)
# ----------------------------------------------------------------------------

```python
def pedigree_inbreeding(fa, n):
    """
    Computes the inbreeding coefficient of an individual I (F_I)
    based on the inbreeding coefficient of a common ancestor A (F_A)
    and the number of individuals (n) in the path from one parent to the other through A.
    """
    FI = ((1 / 2) ** n) * (1 + fa)
    print(f"Inbreeding coefficient of individual I (F_I): {FI:.4f}")

# Example: 4 individuals in path, F_A = 0.98
pedigree_inbreeding(fa=0.98, n=4)
```

# ----------------------------------------------------------------------------
# 🧬 PART 5: COUSIN MATING INBREEDING COEFFICIENT
# ----------------------------------------------------------------------------

```python
def cousin_mating_inbreeding(n_generations):
    """
    Calculates F from cousin mating at nth generation using:
    F = 1 / 2^(2n)
    """
    F = Fraction(1, 2 ** (2 * n_generations))
    print(f"Inbreeding coefficient for cousin mating at generation {n_generations}: F = {F} ≈ {float(F):.4f}")

cousin_mating_inbreeding(4)
```








