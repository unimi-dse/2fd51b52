#'@title Data plotting
#'@description  Plot data
#'@param tsdata time Series object. Object contains year observations and statistics about CO2 emission worldwide.
#'@param forecastData forecasting time series. This data are calculated by forecast. NULL by default
#'@param plotTit character string The title of the plot that can be changed by selecting different country uiSelectInput
#'@param fc boolean. Passing argument TRUE if user check to checkbox for forecasting, else FALSE
#'@return plotly
#'
#'@importFrom dplyr %>%
#'@importFrom stats time
#'@export
#'
plotData <- function(tsdata, forecastData = NULL, plotTit, fc){

  if(fc){
    f <- plotly::plot_ly() %>%
      plotly::add_lines(x = time(tsdata), y = tsdata,
                        color = I("black"), name = "observed")  %>%
      plotly::add_ribbons(x = time(forecastData$mean), ymin = forecastData$lower[, 2], ymax = forecastData$upper[, 2],
                          color = I("gray95"), name = "95% confidence") %>%
      plotly::add_ribbons(x = time(forecastData$mean), ymin = forecastData$lower[, 1], ymax = forecastData$upper[, 1],
                          color = I("gray80"), name = "80% confidence") %>%
      plotly::add_lines(x = time(forecastData$mean), y = forecastData$mean, color = I("blue"), name = "forecasting") %>%
      plotly::layout(title = plotTit ,xaxis = list(title = 'Year'),yaxis = list(title = 'Kiloton'))


  } else{
    f <- plotly::plot_ly() %>%
      plotly::add_lines(x = time(tsdata), y = tsdata,
                        color = I("black"), name = "observed")  %>%
      plotly::layout(title = plotTit ,xaxis = list(title = 'Year'),yaxis = list(title = 'Kiloton'))
  }

  return(f)
}
