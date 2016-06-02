angularDistance <- function(x){
  library(dplyr)
  angularDist <- function(x){ return(asin(x)/(pi/2))}
  foo <- cor(t(x)) %>%
      angularDist


  return(foo)
}
