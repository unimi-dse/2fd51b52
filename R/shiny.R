#' Graphical User Interface
#'
#' Runs a Graphical User Interface to evaluate the projects for Global CO2 emission analysis app
#'
#' @return shiny app
#'
#' @export
#'
appGUI <- function(){
  sf <- system.file("co2emission", package = "midterm")
  print(sf)
  shiny::runApp(sf, display.mode = "normal", launch.browser = T)

}

