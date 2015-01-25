calcModelQuality <- function(trainData, trainLabels) {
 
  if(!require(cvTools)) {
    install.packages("cvTools")
    require(cvTools)
  }
  if(!require(e1071)) {
    install.packages('e1071', dependencies = TRUE)
    require(class)
    require(e1071)    
  }
  
  k <- 5
  qualitySum = 0
  
  folds <- cvFolds(NROW(trainData), K=k)
  
  for(i in 1:k){
    train <- trainData[as.vector(folds$subsets[folds$which != i]), ]
    trainResult <- trainLabels[as.vector(folds$subsets[folds$which != i]), ]
    validation <- trainData[as.vector(folds$subsets[folds$which == i]), ]
    validationResult <- trainLabels[as.vector(folds$subsets[folds$which == i]), ]
    
    validationResultLevelsCount = length(levels(as.factor(validationResult)))
    trainResultLevelsCount = length(levels(as.factor(trainResult)))
    if(validationResultLevelsCount == 1 || trainResultLevelsCount == 1
       || validationResultLevelsCount != trainResultLevelsCount) {
      next
    }
      
    classifier <- naiveBayes(train, as.factor(trainResult))
    predicted <- predict(classifier, validation)

    resultsSame <- as.vector(predicted) == validationResult
    quality <- sum(resultsSame == TRUE) / length(resultsSame)
    qualitySum <- qualitySum + quality
    
  }

  qualitySum/k
}