grabAMLdata = function(){
  library(utils)
  download.file('http://leelab-data.cs.washington.edu/combMetzelerWoutersTomassonNKAML.tar.gz','./data.tar.gz')
  system('tar -xzvf data.tar.gz')
  library(data.table)
  #cat(',',file='data.csv')
  #cat(',',file='combMetzlerWoutersTomassonNKAML.csv',append=T)
  foo <- fread('combMetzlerWoutersTomassonNKAML.csv',data.table=F)
  bar <- scan('combMetzlerWoutersTomassonNKAML.csv',nlines=1,what='character',sep=',')
  colnames(foo) <- c('gene',bar)
  return(foo)
}
