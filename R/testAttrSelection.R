testAttrSelection <- function(trainData, trainLabels, testData, testLabels, searchMethod) {
  source("R/MOWAttrSelection.R")
  source("R/modelQuality.R")
  
  cat("Model quality for all atributes: ", calcModelQuality(trainData, trainLabels), "\n")
  
  timeStarted <- Sys.time()
  attrVector <- selectAttributes(trainData, trainLabels, searchMethod)
  timeEnded <- Sys.time()
  
  cat("Attributes selected: ", attrVector, "\n")
  cat("Execution time: ", timeEnded - timeStarted, "\n")
  cat("Model quality for train data: ", calcModelQuality(trainData[attrVector], trainLabels), "\n")
  cat("Model quality for test data: ", calcModelQuality(testData[attrVector], testLabels), "\n")
}