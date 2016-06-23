angularDistance <- function(x){
  library(dplyr)
  angularDist <- function(x){ return(asin(x)/(pi/2))}
  foo <- cor(t(x)) %>%
      angularDist


  return(foo)
}

angularDistanceVectorized <- function(inds,MAT){
  ad         <- asin(cor(t(MAT),t(MAT[inds,])))/(pi/2)
  ad[ad < 0] <- 0
  return(ad)
}

tomNumeratorVectorized <- function(inds,MAT){
  print(paste0("working on inds ",min(inds),":",max(inds)))
  num <- t(crossprod(MAT[,inds], MAT) + MAT[inds,])
  return(num)
}


tomDenominatorVectorized <- function(MAT){
  dTemp <- matrix(colSums(MAT), nrow(MAT), ncol(MAT))
  denom <- pmin(as.dist(dTemp),as.dist(t(dTemp))) + as.dist(1-MAT)
  return(denom)
}

