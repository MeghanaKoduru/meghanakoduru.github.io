library(datasets)
library(ISLR)
arrest = USArrests
states = row.names(USArrests)
#Get Names 
names(USArrests)
# Get means and variances of variables
apply(USArrests, 2, mean)
apply(USArrests, 2, var)
# PCA with scaling 
pr.out = prcomp(USArrests, scale = TRUE)
names(pr.out)

#the centering and scaling used (means)
pr.out$center
# the matrix of variable loadings (eigenvectors)
pr.out$scale
pr.out$rotation
dim(pr.out$x)

pr.out$rotation = -pr.out$rotation
pr.out$x = -pr.out$x
biplot(pr.out, scale=0)
#Standard deviation
pr.out$sdev
pr.var = pr.out$sdev^2
pr.var
pve = pr.var / sum(pr.var)
pve
plot(pve, xlab = "Principal Compnent", ylab = "Proportion of Variance Explained",
     ylim = c(0,1), type = 'b')

plot(cumsum(pve), xlab = "Principal Component", ylab = "Cumulative Proportion ", 
     ylim = c(0,1), type = 'b')
# Use factoextra package
library(factoextra)
fviz(pr.out, "ind", geom = "auto", mean.point = TRUE, font.family = "Georgia")
fviz_pca_biplot(pr.out, font.family = "Georgia", col.var = "firebrick1")

