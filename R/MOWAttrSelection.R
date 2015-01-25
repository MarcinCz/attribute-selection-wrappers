source("R/hillClimbingSearch.R");
source("R/bestFirstSearch.R");

install.packages("cvTools", repos="http://cran.rstudio.com/")
install.packages('e1071', dependencies = TRUE, repos="http://cran.rstudio.com/")

library(cvTools)
library(class)
library(e1071)

selectAttributes <- function(testData, testResults,  searchMethod) {
  
}