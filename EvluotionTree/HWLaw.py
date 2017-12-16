#!/usr/bin/python3
import numpy as np
import random

size = 100; # size of population
generation =100; # number of generation

# Gene Type
a = 0.5
b = 0.5
genekind = 4

# array to store the gene type of each generation
result=np.zeros((generation,size, genekind),dtype=np.int8)
#[Aa,Aa,Bb,Bb] A->1, a->0,B->1,b->0
# initate first genetation
result[0,0:(int)(a*size),0]=np.ones((int)(a*size))
result[0,0:(int)(a*size),1]=np.ones((int)(a*size))
result[0,0:(int)(a*size),2]=np.ones((int)(a*size))
result[0,0:(int)(a*size),3]=np.ones((int)(a*size))

#print(result[0,:,:])
print(sum(result[0,:,:]))

# phenotype matrix (it maybe be done by matrix calculate)
phenotype_num = 3*2;
pheno_num = np.zeros((generation,phenotype_num),dtype=np.int8)
gnrt=0

for phe in result[gnrt,:,0]+result[gnrt,:,1]:
  if(phe==2):
   # print("AA")
    pheno_num[gnrt,2]=pheno_num[gnrt,2]+1
  elif(phe==1):
   # print("Aa")
    pheno_num[gnrt,1]=pheno_num[gnrt,1]+1
  elif(phe==0):
    pheno_num[gnrt,0] = pheno_num[gnrt,0]+1
print(pheno_num[gnrt,2], pheno_num[gnrt,0])

print("Start Simulation to confirm H-W Lab")

j=1
for p in result[:,1,1]: #scan the generation
  #Assue the  every one can prodeuce the child, and two of the genetype of child is independent
  
  j=j+1
  select = random.randint(0, size-1)
  #print(select)


#print(result[1,:,:])
