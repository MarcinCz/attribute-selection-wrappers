\name{MOWAttrSelection}
\alias{MOWAttrSelection}
\alias{MOWAttrSelection}
\docType{package}
\title{
Attribute selection
}
\description{
Attribute selection with wrappers
}
\details{
\tabular{ll}{
Package: \tab MOWAttrSelection\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-01-24\cr
}
Usage example:

#select attributes using test data, and test data labels (results)\cr
attrVector <- selectAttributes(trainData, trainLabels, searchMethod)\cr
#use selected attributes in your train data\cr
predict(model, testData[attrVector])\cr

}
\author{
MCZ PK
}
\keyword{ package }
