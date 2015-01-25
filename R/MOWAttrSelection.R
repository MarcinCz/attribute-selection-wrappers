source("R/hillClimbingSearch.R");
source("R/bestFirstSearch.R");


selectAttributes <- function(trainData, trainLabels,  searchMethod='hill') {

  if(searchMethod=='hill') {
    hillClimbSearch(trainData, trainLabels)
  } else if(searchMethod=='bestFirst') {
    bestFirstSearch(trainData, trainLabels, k=4, eps=0.05)
  }
}

