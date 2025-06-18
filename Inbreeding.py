
from fractions import Fraction
import numpy as np

###Inbreeding is one of the important factors that changes the
#trajectory of heterzygocity to individuals of homozygous genotypes.
#Also known as self-fertilisation process. Occurs within population
# subpopulations generally after admixture. The results leads to
#a population of increased homozygosity.


#The genotype frequencies of Aa decreases, while the genotype frequencies of AA, aa increases.

#Normally, in the Hardy-Weinberg equilibrium, the first generation, we have 1:2:1 ratio of AA, Aa and aa.
#Thus, (1/4) of AA, (1/2) of Aa, and (1/4) of aa.


#Define values - 
#Generations: G1, G2, G3, G4, G5
#In generation you add consequent half of genotype frequency, since two chromosomes are shared from mother and father

pAA = 1/4
pAa = 1/2
paa = 1/4

#In second generation, 

g2AA = Fraction( pAA + ( (1/2) *  pAA ) )
G2Aa = Fraction( (pAa * pAa * pAa) )
G2aa = Fraction( (paa * 1) + ( (1/2) * paa ) )

#In third generation, 
g3AA = Fraction( g2AA + (1/4) * pAA )

n1 = Fraction(1/4)
print(n1)
n2 = Fraction(n1 + n1/2)
print(n2)
n3 = Fraction(n2 + n1/4)
print(n3)


gfreq_dom = Fraction(1, 4)
new_fract_dom = Fraction(0)

gfreq_het = Fraction(1, 2)
new_fract_het = Fraction(0)

gfreq_rec = Fraction(1, 4)
new_fract_rec = Fraction(0)


for i in range(5):
    new_fract_dom += gfreq_dom
    gfreq_dom /= 2
    
    new_fract_het = gfreq_het
    gfreq_het /= 2
    
    new_fract_rec += gfreq_rec
    gfreq_rec /= 2
    
    print([new_fract_dom, new_fract_het, new_fract_rec])



###Mean, Variance, Covariance
a = [-2, -1, 0, 1, 2]
b = [-4, 2, 0, -2, 4]
N = len(a)
a_mean = np.mean(a)
print(a_mean)
a_var = np.var(a)
print(a_var)
a_se = np.std(a)
print(a_se)
a_cov = np.cov(a,b)
print(a_cov)


a = [-2, -1, 0, 1, 2]
b = [-4, 2, 0, -2, 4]
m1 = np.matrix([a, b])
m2 = m1.T
m = 1/4 * (m1 @ m2)




