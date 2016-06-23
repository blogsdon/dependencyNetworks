makeTranches <- function(x,k=10)
{
  tranches  <- list()
  tranSize  <- ceiling(length(x)/k)
  tranStart <- 1
  for(i in 1:k)
  {
    tranches[[i]] <- tranStart:min(tranSize+tranStart-1, length(x))
    tranStart     <- tranSize*i+1
  }
  return(tranches)
}
