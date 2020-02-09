#' Graphical User Interface
#'
#' Runs a Graphical User Interface to evaluate the projects for Global CO2 emission analysis app.
#'
#' By moving the Year slidebar, it will
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

