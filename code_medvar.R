#load rquired packages
library(ggplot2)
library(reshape)
library(plyr)

#load data  and matrix manipulation
setwd("D:/Amit_Data/E Drive/Amit/Work_18_19/projects/client/abbvie/Brain_RNA_SEQ2")
x=read.csv("data.txt", quote="")
x=t(x)
celltypes=c(NA,rep(rownames(x)[2],2),rep(rownames(x)[4],4),rep(rownames(x)[8],2),rep(rownames(x)[10],6),rep(rownames(x)[16],2),rep(rownames(x)[18],2),rep(rownames(x)[20],3))
y=data.frame(x,celltypes)
z=t(y)
colnames(z) <- celltypes
colnames(z)[1] <- "Gene"
z=z[-nrow(z),]
rownames(z) <- z[,1]
z=z[,-1]

exprs=melt(z)
exprs$value=as.numeric(as.character((exprs$value)))

#search space volume reduction - find genes with maximum variations in median value
#find sd of median values of each gene - THIS STEP TAKES THE LONGEST TIME, WORKS ON ALL 23223 GENES
genemedsd <- data.frame()
for (i in 1:length(row.names(z))) {
  gene=row.names(z)[i]
  e=exprs[which(exprs$X1==gene),]
  medval <- ddply(e, .(X2), summarize, "median" = median(value))
  medvalsd <- sd(medval$median)
  print(paste(gene,medvalsd), sep="\t")
  genemedsd <- rbind(genemedsd, data.frame(x = gene, y = medvalsd))
}
 #show sd of median values and plot as boxplot
fivenum(genemedsd$y)
boxplot(genemedsd$y)
boxplot(genemedsd$y, horizontal = TRUE, axes = FALSE, staplewex = 1)
text(x=fivenum(genemedsd$y), labels =round(fivenum(genemedsd$y),2), y=1.25)
#find genes with sd > x (user defined value of x)
topgene <- which(genemedsd$y > 1000)

celltypegene <- data.frame()
for ( j in 1:length(topgene)) {
  gene=row.names(z)[topgene[j]]
  print(gene)
  e=exprs[which(exprs$X1==gene),]
  medval <- ddply(e, .(X2), summarize, "median" = median(value))
  tx <- medval[which.max(medval$median),]
  celltypegene <- rbind(celltypegene, data.frame(x = gene, y = tx))
}

#print signature genes for each cell type
celltypes <- unique(celltypegene$y.X2)
for ( p in 1:length(celltypes)) {
  print(p)
  cb <- as.character(celltypes[p])
  print(cb)
  eachcelltypegen <- as.character(celltypegene[celltypegene[, "y.X2"] == cb,]$x)
  print(eachcelltypegen)
  paste(cb,paste(eachcelltypegen, collapse=","), sep ="|")  
}


#plot and show data for ALL gene
e=exprs[which(exprs$X1%in%as.character(celltypegene$x)),]
g <- ggplot(e,aes(X2,value)) +
  geom_boxplot(aes(X2,value,fill=X2)) +
  geom_point(aes(X2,value)) +
  facet_wrap(~X1,scales = "free") +
  theme(axis.text.x = element_blank())
g
png("Top_Genes.png",width = 8000,height = 8000,res = 300)
g
dev.off()

#plot and show data for each gene
gene="Bsg"
e=exprs[which(exprs$X1==gene),]
g <- ggplot(e,aes(X2,value)) +
  geom_boxplot(aes(X2,value,fill=X2)) +
  geom_point(aes(X2,value)) +
  theme(axis.text.x = element_text(angle = 90,vjust = 0.7))

g + ggtitle(gene)

medval <- ddply(e, .(X2), summarize, "median" = median(value))
medval
sd(medval$median)
medval[which.max(medval$median),]