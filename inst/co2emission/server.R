# Define server logic ----
server <- function(input, output) {

  fileData <- readFile()

  # makeGlobalEnv()
  output$var <- renderUI({
    countryNameList <- fileData$CountryName

    countryCodeList <<- fileData$CountryCode
    names(countryCodeList) <- countryNameList
    selectInput(
      "var",
      label = "Select country",
      choices = countryCodeList,
      selected = "WLD"
    )
  })

  output$plot <- renderPlotly({

    countryCode <- input$var

    if(is.null(countryCode)){
      countryCode <- "WLD"
    }

    yearFrom <- input$range[1]
    yearTo <- input$range[2]
    dataRow <- fileData[fileData[, "CountryCode"] == countryCode,]

    numberOfLag <- input$lag

    year <- as.numeric(colnames(fileData)[(5+(yearFrom-1960)):(64-(2019-yearTo))])
    co2emission <- c(as.numeric(dataRow[(5+(yearFrom-1960)):(64-(2019-yearTo))]))


    dataShow <- data.frame(year, co2emission)

    #Forecast
    tsdata <- ts(data = dataShow$co2emission, frequency = 1, start = c(dataShow$year[1], 1), end = c(tail(dataShow$year, n=1), 1))

    autoarima1 <- auto.arima(tsdata)

    forecast1 <- forecast(autoarima1, h=numberOfLag)
    yearFc <- c(2020)
    co2Fc <-(autoarima1)

    f <- plot_ly() %>%
      add_lines(x = time(tsdata), y = tsdata,
                color = I("black"), name = "observed") %>%
      add_ribbons(x = time(forecast1$mean), ymin = forecast1$lower[, 2], ymax = forecast1$upper[, 2],
                  color = I("gray95"), name = "95% confidence") %>%
      add_ribbons(x = time(forecast1$mean), ymin = forecast1$lower[, 1], ymax = forecast1$upper[, 1],
                  color = I("gray80"), name = "80% confidence") %>%
      add_lines(x = time(forecast1$mean), y = forecast1$mean, color = I("blue"), name = "prediction") %>%
      layout(title = 'CO2 EMISSION' ,xaxis = list(title = 'Year'),yaxis = list(title = 'Kiloton'))

    f

    # forecast1

  })

}

