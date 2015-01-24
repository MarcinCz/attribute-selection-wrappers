calcModelQuality <- function(trainData, trainResult, testData, testResult) {
  classifier <- naiveBayes(trainData, as.factor(trainResult[,]))
  predicted <- predict(classifier, testData)
  resultsSame <- predicted == as.factor(testResult[,])
  quality <- sum(resultsSame == TRUE) / length(resultsSame)
  quality
}