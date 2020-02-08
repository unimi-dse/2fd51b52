#'
#'Read
#'
#'@return data.frame
#'@export

readFile <- function(){
  sf <- system.file("extdata", "co2emission.csv", package = "midterm")
  Data <- read.csv(sf)
  Data <- dataRefactor(Data)
  return(Data)
}

dataRefactor <- function(dataFile){
  cn <- c("CountryName", "CountryCode", "IndicatorName", "IndicatorCode", 1960:2019)
  colnames(dataFile) <- cn

  return(dataFile)
}


