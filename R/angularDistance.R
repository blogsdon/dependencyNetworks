angularDistance <- function(x){
  library(dplyr)
  angularDist <- function(x){ return(asin(x)/(pi/2))}
  foo <- cor(x) %>%
      angularDist


  return(foo)
}
