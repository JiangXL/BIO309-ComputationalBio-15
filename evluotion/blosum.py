# python3

import numpy as np

"""
Read fasta file and do simple protein alignment

Author: H.F. 
Frist : 10/11/2017
Update: 10/12/2017
"""

### Read the fasta file
fasta = open("alignment-sequence.fasta")
name=[]
seq=[]
for line in fasta:
    line=line.strip('\n') #　remove"\n"
    if(line[0]=='>'): #判断第一个字符是不是 > ,
        id=line.split('|')[1]
        name.append(id)
        seq.append('')
    else:
        seq[len(seq)-1]=seq[len(seq)-1]+line


### calculate the sorce of sequence pair 
def sorce(seq_a,seq_b,m,mis,gap):
    len_a=len(seq_a)
    len_b=len(seq_b)
    sorce=np.zeros((len_a+1,len_b+1),dtype=np.int16)
    sorce[:,0]=gap*np.arange(len_a+1,dtype=np.int16)
    sorce[0,:]=gap*np.arange(len_b+1,dtype=np.int16)
    for i in np.arange(len_a,dtype=np.uint16):
        for j in np.arange(len_b,dtype=np.int16):
            s=0
            if(seq_a[i]==seq_b[j]):
                s=m
            else:
                s=mis
            #if(j<=len_b-1 && i<=len_a-1):
            sorce[i+1,j+1]=max(sorce[i,j+1]+gap,
                        sorce[i,j]+s,
                        sorce[i+1,j]+gap
                        )
            #print(seq_a[i],seq_b[j],"\n")
    return sorce

#print(len(sorce(seq[0],seq[1],2,-1,-2)[0]))
#print(len(seq))
#print(sorce(seq[0],seq[4],2,-1,-2).size)

#result=np.zeros(len(seq),len(seq),dtype=np.int16)
#print(seq)


### Calculate all the geome sequences
result=[]
showname=[' ']+name
result.append(showname) # add the name to column
for (seq_a, id_a)  in zip(seq, name):
    row=[id_a] # add id at the frist coclum	
    for (seq_b, id_b) in zip(seq, name):
       finalsorce=sorce(seq_a,seq_b,2,-1,-2)[len(seq_a),len(seq_b)] # final socre
       row.append(finalsorce) # add to row
      #print(len(row),row)
    result.append(row) # add row to array as a element


### print the result elegantly
def ssprint(str_matrix):
    for i in str_matrix:
        print()
        for j in i:
           print('%-15s'%j,end="|")
    print()

### show the results
ssprint(result)
