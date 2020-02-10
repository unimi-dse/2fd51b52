# ----- Define server logic ----
library(dplyr)
server <- function(input, output) {

  # import data from CSV file
  fileData <- readFile()

  #rendering Select Input widget and Country name list for user.
  output$var <- renderUI({
    countryNameList <- fileData$CountryName

    countryCodeList <- fileData$CountryCode
    names(countryCodeList) <- countryNameList
    selectInput(
      "var",
      label = "Select country",
      choices = countryCodeList,
      selected = "WLD"
    )
  })

  output$plot <- plotly::renderPlotly({

    countryCode <- input$var

    if(is.null(countryCode)){

      #assigning default value for country
      countryCode <- "WLD"
    }

    yearFrom <- input$range[1]
    yearTo <- input$range[2]
    dataRow <- fileData[fileData[, "CountryCode"] == countryCode,]
    countryName <- dataRow[,1]

    numberOfLag <- input$lag

    year <- as.numeric(colnames(fileData)[(5+(yearFrom-1960)):(64-(2019-yearTo))])
    co2emission <- c(as.numeric(dataRow[(5+(yearFrom-1960)):(64-(2019-yearTo))]))


    dataShow <- data.frame(year, co2emission)

    #Forecast
    tsdata <- ts(data = dataShow$co2emission, frequency = 1, start = c(dataShow$year[1], 1), end = c(tail(dataShow$year, n=1), 1))

    autoarima1 <- forecast::auto.arima(tsdata)

    forecast1 <- forecast::forecast(autoarima1, h=numberOfLag)

    plotTitle <- paste("CO2 EMISSION ", toupper(countryName))

    f <- plotly::plot_ly() %>%
      plotly::add_lines(x = time(tsdata), y = tsdata,
                color = I("black"), name = "observed") %>%
      plotly::add_ribbons(x = time(forecast1$mean), ymin = forecast1$lower[, 2], ymax = forecast1$upper[, 2],
                  color = I("gray95"), name = "95% confidence") %>%
      plotly::add_ribbons(x = time(forecast1$mean), ymin = forecast1$lower[, 1], ymax = forecast1$upper[, 1],
                  color = I("gray80"), name = "80% confidence") %>%
      plotly::add_lines(x = time(forecast1$mean), y = forecast1$mean, color = I("blue"), name = "prediction") %>%
      plotly::layout(title = plotTitle ,xaxis = list(title = 'Year'),yaxis = list(title = 'Kiloton'))

    f

  })

}

