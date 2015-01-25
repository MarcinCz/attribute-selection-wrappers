source("R/modelQuality.R");

bestFirstSearch <- function(trainData, trainLabels, k = 5, eps = 0) {
#  bestFirstSearch <- function(trainData, trainLabels) {
 # k <- 5 
  #eps <- 0
  data_dimention <- dim(trainData)[2]
  attributeVector <- rep(0, data_dimention)
  firstColumn <- sample(1:data_dimention, 1)
  #poczatkowy zbior atrybutow
  attributeVector[firstColumn] <- firstColumn
  
  
  bestQuality <- calcModelQuality(trainData[attributeVector], trainLabels)
  bestVector <- attributeVector
  OPEN <- list(bestVector)
  CHECKED <- list(bestQuality)
  CLOSED <- list()
  
  iterationsNotChanged <- 0
  while (iterationsNotChanged <= k & length(OPEN)>0){
    iterationsNotChanged <- iterationsNotChanged + 1
    #przeszukanie OPEN w celu znalezienia max
    maxQuality <- 0
    maxVector <- attributeVector
    positionOfMax <- 0
    for(i in 1:length(OPEN)){
     if(CHECKED[i] == 0){
       CHECKED[[i]] <- calcModelQuality(trainData[OPEN[i]], trainLabels)
     }
     if(CHECKED[i] > maxQuality){
       maxQuality <- CHECKED[i]
       positionOfMax <- i
       maxVector <- OPEN[i]
     }
    }
    #dodanie i usuniecie z list zbioru atrybutow o maksymalnej wartości
    OPEN[[positionOfMax]] <- NULL
    CHECKED[[positionOfMax]] <- NULL
    CLOSED[[length(CLOSED)+1]] <- maxVector
    
    if(bestQuality < as.numeric(maxQuality) - eps){
      bestQuality <- maxQuality
      bestVector <- maxVector
      iterationsNotChanged <- 0
    }
    
    #expand maxVector
    for(i in 1:data_dimention){
      attributeVector <- bestVector
      tmp <- attributeVector[i]
      if (tmp == 0) {
        attributeVector[i] <- i
      }
      else{
        attributeVector[i] <- 0
      }
      alreadyExists <- FALSE
      for(j in 1:length(OPEN)){
        if(vectorEquals(OPEN[j],attributeVector)){
          alreadyExists <- TRUE
        }
      }
      if(alreadyExists) next
      for(j in 1:length(CLOSED)){
        if(vectorEquals(CLOSED[j],attributeVector)){
          alreadyExists <- TRUE
        }
      }
      if(alreadyExists) next
      
      OPEN[[length(OPEN)+1]] <- attributeVector
      CHECKED[[length(CHECKED)+1]] = calcModelQuality(trainData[attributeVector], trainLabels)
    }
  }
  bestVector[bestVector>0]
}

vectorEquals <- function(v1, v2){
  equals <- OPEN[i] == attributeVector #porownywanie sekwencji
  if(length(equals[equals == FALSE]) == 0)
    TRUE
  else
    FALSE
}