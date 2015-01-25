source("R/MOWAttrSelection.R")
source("R/modelQuality.R")

testAttrSelection <- function(trainData, trainLabels, testData, testLabels, searchMethod) {
  cat("Model quality for all atributes: ", calcModelQuality(trainData, trainLabels), "\n")
  
  timeStarted <- Sys.time()
  attrVector <- selectAttributes(trainData, testLabels, searchMethod)
  timeEnded <- Sys.time()
  
  cat("Attributes selected: ", attrVector, "\n")
  cat("Execution time: ", timeEnded - timeStarted, "\n")
  cat("Model quality for train data: ", calcModelQuality(trainData[attrVector], trainLabels), "\n")
  cat("Model quality for test data: ", calcModelQuality(testData[attrVector], testLabels), "\n")
}