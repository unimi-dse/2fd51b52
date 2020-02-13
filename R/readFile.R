#' @title Reading CSV file
#'@description Read CSV file in inst/extdata/co2emission.csv to data.frame variable. This data will be used in this project.
#'@return Data data.frame that contains all .csv file statistics
#'@importFrom utils read.csv
#'@export
#'
readFile <- function(){

  #read data from CSV file
  sf <- system.file("extdata", "co2emission.csv", package = "co2emission")
  Data <- read.csv(sf)

  # Change column name of the data.frame
  Data <- dataRefactor(Data)
  return(Data)
}

#' @title Data refractoring
#'@description Change current column name into new name for easily manipulated
#'@param dataFile data.frame Original data file.
#'
#'@return dataFile data.frame Data file after naming the column name
#'@export
#'
dataRefactor <- function(dataFile){
  #Describe new column name
  newColName <- c("CountryName", "CountryCode", "IndicatorName", "IndicatorCode", 1960:2019)
  colnames(dataFile) <- newColName

  return(dataFile)
}



