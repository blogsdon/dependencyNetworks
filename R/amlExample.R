rm(list = ls()); gc()
library(parallel)
library(igraph)
library(feather)
foo      <- grabAMLdata()
#SD       <- apply(foo[,-1], 1, sd)
#SDinds   <- rank(-SD) < 4000
#foo      <- foo[SDinds,]

indList  <- makeTranches(1:nrow(foo),k=30) # tranches uses as chunks for faster computing of adjacency matrix and TOMdis

cl       <- makeCluster(3,outfile = "~/Desktop/SageCode/dependencyNetworks/progressFile.txt")
ad       <- as.matrix(as.data.frame((parLapply(cl, indList, angularDistanceVectorized, MAT = as.matrix(foo[,2:ncol(foo)])))))
diag(ad) <- 0
date()
tomNumerator   <- as.dist(as.matrix(as.data.frame((parLapply(cl, indList, tomNumeratorVectorized, MAT = ad)))))
tomDenominator <- tomDenominatorVectorized(ad)
tom            <- tomNumerator/tomDenominator
date()
stopCluster(cl)

write_feather(as.data.frame(as.matrix(tom)),"./TOM.feather")

