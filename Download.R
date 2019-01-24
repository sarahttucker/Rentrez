#load in rentrez package
library(rentrez)

#assign specific NCBI database identities (of 3 different sequences of the 16s gene) to ncbi_ids
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

#download data from NCBI database using identities assigned to ncbi_ids
#It contains 3 different sequences of the 16S gene of Borrelia (aka Borreliella) burgdorferi
#which is a bacteria that causes lyme disease.
#in fasta format, db = name of the database 
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#Use the strsplit() function in combination with others to create a vector of 3 components, one for each sequence. 
#Output this vector to a file called Sequences.csv.

split<-strsplit(Bburg, "\n\n", fixed = FALSE)
split
####>.+?\\n
write.csv(split, file = "Sequences.csv")

Seqs<-read.csv("Sequences.csv", header=T)

#source("http://bioconductor.org/biocLite.R")
#biocLite("Biostrings")

#library(Biostrings)

