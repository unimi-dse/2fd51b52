#'
#'dfd
#'
#'@export

readFile <- function(){
  sf <- system.file("extdata/co2emission.csv", package = "midterm")
  Data <- read.csv(sf)
  cn <- c("CountryName", "CountryCode", "IndicatorName", "IndicatorCode", 1960:2019)
  colnames(Data) <- cn
  return(Data)
}


