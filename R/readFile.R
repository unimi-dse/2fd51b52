#'Reading CSV file
#'@description Read CSV file in inst/extdata/co2emission.csv to data.frame variable. This data will be used in this project.
#'@return data.frame
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

#'Data refractoring
#'@description Change current column name into new name for easily manipulated
#'@param dataFile data.frame. Original data file.
#'
#'@return data.frame
#'@export
#'
dataRefactor <- function(dataFile){
  #Describe new column name
  newColName <- c("CountryName", "CountryCode", "IndicatorName", "IndicatorCode", 1960:2019)
  colnames(dataFile) <- newColName

  return(dataFile)
}



