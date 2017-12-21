#!/usr/bin/python3
'''
Python programe to stimuilate genetic drift in constant population size based on
The Neutral Theory of Molecular Evolution.
'''

import numpy as np
import random

size = 100; # size of population
generation =100; # number of generation

# Allele
a = 0.5
b = 0.5
genekind = 4

# Array to store the gene type of each generation
result=np.zeros((generation,size, genekind),dtype=np.int8)
#[Aa,Aa,Bb,Bb] A->1, a->0,B->1,b->0
# Initate first genetation
result[0,0:(int)(a*size),0]=np.ones((int)(a*size))
result[0,0:(int)(a*size),1]=np.ones((int)(a*size))
result[0,0:(int)(a*size),2]=np.ones((int)(a*size))
result[0,0:(int)(a*size),3]=np.ones((int)(a*size))

#print(result[0,:,:])
print(sum(result[0,:,:]))

print("Start Simulation to confirm Neutral Theory")

j=1
for p in result[:,1,1]: #scan the generation
  
  j=j+1
  select = random.randint(0, size-1)
  #print(select)


#print(result[1,:,:])
