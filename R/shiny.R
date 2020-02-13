#' @title Graphical User Interface
#'
#'@description Runs a Graphical User Interface to evaluate the projects for Global CO2 emission analysis app. This app is presented the amount of worldwide CO2 emission of from 1960 to 2020. It is possible to select different countries to see the details. Besides, the prediction for the next few years is also provided. The data set is collected from Data World Bank.
#' By moving the Year slidebar, it will change the number of observations year by year.
#' @examples
#' \dontrun{
#' appGUI()
#' }
#' @return shiny app
#'
#' @export
#'
appGUI <- function(){
  sf <- system.file("co2emission", package = "co2emission")
  shiny::runApp(sf, display.mode = "normal", launch.browser = T)

}

