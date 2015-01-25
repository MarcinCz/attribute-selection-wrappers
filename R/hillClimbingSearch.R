hillClimbSearch <- function(trainData, trainLabels) {
  source("R/modelQuality.R");
  
  data_dimention <- dim(trainData)[2]
  attributeVector <- rep(0, data_dimention)
  firstColumn <- sample(1:data_dimention, 1)
  attributeVector[firstColumn] <- firstColumn
  
  
  bestQuality <- calcModelQuality(trainData[attributeVector], trainLabels)
  bestVector <- attributeVector
  
  foundBest <- FALSE
  while (!foundBest){
    maxQuality <- 0
    maxVector <- attributeVector 
    for(i in 1:data_dimention){
      tmp <- attributeVector[i]
      if (tmp == 0) {
        attributeVector[i] <- i
      }
      else{
        attributeVector[i] <- 0
        if (length(attributeVector[attributeVector > 0]) == 0){
          attributeVector[i] <- i
          next
        }
      }
      tmpQuality = calcModelQuality(trainData[attributeVector], trainLabels)
      if (maxQuality < tmpQuality){
        maxQuality <- tmpQuality
        maxVector <- attributeVector
      }
      attributeVector[i] <- tmp
      
    }
    
    if(bestQuality > maxQuality){
      foundBest <- TRUE
    }
    else {
      attributeVector <- maxVector
      bestQuality <- maxQuality
      bestVector <- maxVector
    }
  }
  bestVector[bestVector>0]
}