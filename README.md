# SignatureGene
Identification of Signature Genes based on Expression Comparison

## Aim
Identify Genes (features) that exhibit highest degree of standard deviations (SD) across different cell types (7 types in this dataset).

## Approach
Based on each sample annotated type, for each gene, map the median per cell type. calculated the standard deviations across medians. Identify genes that exhibit SD above certain fixed value (for example, 1000 used here) or use the 3rd quantile value as cut-off.

## Input
Gene experssion matrix or any feature-sample matrix with each sample type annotated.

## Output
* Genes that exhibit signficant SD per cell type
* Plot for individual genes
* Plot for all signficant genes in one frame

## Source of Sample Data
https://www.brainrnaseq.org/

## Reference
* Mouse data: Ye Zhang, Kenian Chen, Steven A Sloan, Mariko L Bennett, Anja R Scholze, Sean O'Keefe, Hemali P Phatnani, Paolo Guarnieri, Christine Caneda, Nadine Ruderisch, Shuyun Deng, Shane A Liddelow, Chaolin Zhang, Richard Daneman, Tom Maniatis, Ben A Barres, Jia Qian Wu. "An RNA-Seq transcriptome and splicing database of glia, neurons, and vascular cells of the cerebral cortex.: Journal of Neuroscience. 2014.

* Human data: Ye Zhang, Steven A. Sloan, Laura E. Clarke, Christine Caneda, Melanie Hayden-Gephart, Gerald A. Grant, Samuel H. Cheshier, Michael S. Edwards, Edward F. Chang, Gordon Li, Gary K. Steinberg, Hannes Vogel, Paul D. Blumenthal, Ben A. Barres. Purification and Functional Characterization of Human Astrocytes. Neuron. 2016.
