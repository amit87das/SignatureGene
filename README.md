# SignatureGene
Identification of Signature Genes based on Expression Comparison

#Aim:
Identify Genes (features) that exhibit highest degree of standard deviations (SD) across different cell types (7 types in this dataset).

#Approach:
Based on each sample annotated type, for each gene, map the median per cell type. calculated the standard deviations across medians. Identify genes that exhibit SD above certain fixed value (for example, 1000 used here) or use the 3rd quantile value as cut-off.

#Input data:
Gene experssion matrix or any feature-sample matrix with each sample type annotated.

#Output:
*Genes that exhibit signficant SD per cell type
*Plot for individual genes
*Plot for all signficant genes in one frame

#Source Sample Data
