#'
#'@description  Plot data
#'@param tsdata Time Series object. Object contain year observations and statistics about CO2 emission worldwide.
#'@param forecastData Forecasting time series. This data are calculated by forecast
#'@param plotTit Characters.
#'@return plotly
#'
#'@importFrom dplyr mutate %>%
#'@importFrom stats time
#'

plotData <- function(tsdata, forecastData, plotTit){

  f <- plotly::plot_ly() %>%
    plotly::add_lines(x = time(tsdata), y = tsdata,
                      color = I("black"), name = "observed")  %>%
    plotly::add_ribbons(x = time(forecastData$mean), ymin = forecastData$lower[, 2], ymax = forecastData$upper[, 2],
                        color = I("gray95"), name = "95% confidence") %>%
    plotly::add_ribbons(x = time(forecastData$mean), ymin = forecastData$lower[, 1], ymax = forecastData$upper[, 1],
                        color = I("gray80"), name = "80% confidence") %>%
    plotly::add_lines(x = time(forecastData$mean), y = forecastData$mean, color = I("blue"), name = "prediction") %>%
    plotly::layout(title = plotTit ,xaxis = list(title = 'Year'),yaxis = list(title = 'Kiloton'))

  return(f)
}
