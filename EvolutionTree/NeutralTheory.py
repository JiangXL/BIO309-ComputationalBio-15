#!/usr/bin/python3
'''
Python programe to simulation genetic drift in constant population size based on
The Neutral Theory of Molecular Evolution.
'''

import numpy as np
import random

# Number of generation
generation =100;
# Different genes with same gene freq.
gene_a = np.array([0.5,0.5, 0.5])
# Different genes with different gene freq.
gene_b = np.array([0.5, 0.2, 0.8])
# Gene drift varies on generation
population = np.array([10, 100, 2000])

# Array to store the gene type of each generation
result=np.zeros((generation,population[0]),dtype=np.int8)

# Initate first genetation
result[0,0:(int)(gene_a[0]*population[0]),0]=np.ones((int)(gene_a[0]*population[0]))
#result[0,0:(int)(a*size),1]=np.ones((int)(a*size))
#result[0,0:(int)(a*size),2]=np.ones((int)(a*size))
#result[0,0:(int)(a*size),3]=np.ones((int)(a*size))

#print(result[0,:,:])
print(sum(result[0,:,:]))

print("Start Simulation to confirm Neutral Theory")

j=1
for p in result[:,1,1]: #scan the generation

  j=j+1
  #select = random.randint(0, size-1)
  #print(select)


#print(result[1,:,:])
