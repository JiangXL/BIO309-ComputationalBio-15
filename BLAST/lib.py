# python 3

"""
Author: H.F.
Frist :
"""

##Read the fasta file
lambda_fasta = open("lambda_virus.fa")
print(lambda_fasta)
name = []
seq = []
for line in lambda_fasta:
	line = line.strip('\n')
	if(line[0] == '>'):
		id = line.split('|')[1]
		name.append(id)
		seq.append('')
	else:
		seq[len(seq)-1]=seq[len(seq)-1]+line

print(seq)

