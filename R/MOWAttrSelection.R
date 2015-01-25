#'Select attributes based on train data and train data labels (results)
#'
#'@param trainData Train data. Must be a data-frame.
#'@param trainLabels Train labels (results). Must be a data-frame.
#'@param searchMethod Search method used in attributes selections. Possible choices are 'hill'
#' for hill climbing search (default option) and 'bestFirst' for best first search
#'@return Vector with selected attributes
#'@export
#'@examples
#'#select attributes using test data, and test data labels (results)
#'attrVector <- selectAttributes(trainData, trainLabels, searchMethod)
#'use selected attributes in your train data
#'#predict(model, testData[attrVector])
selectAttributes <- function(trainData, trainLabels,  searchMethod='hill') {
  source("R/hillClimbingSearch.R");
  source("R/bestFirstSearch.R");
  
  if(searchMethod=='hill') {
    hillClimbSearch(trainData, trainLabels)
  } else if(searchMethod=='bestFirst') {
    bestFirstSearch(trainData, trainLabels, k=4, eps=0.05)
  }
}

