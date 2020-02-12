
# Define UI ----

ui <- fluidPage(
  # Load bootstrap and customize CSS file
  theme = "bootstrap.css",
  includeCSS("www/styles.css"),

    navbarPage(
      "CO2 EMISSION",
      id = "main_navbar",

      tabPanel(
        "Information",
        sidebarLayout(

          sidebarPanel(
            id = "sidepanel",
            width = 3,
            br(),
            br(),
            uiOutput("var"),
            br(),
            br(),

            sliderInput("lag",
                        label = "Forecasting lags:",
                        min = 0, max = 50, value = 5,
                        sep = ""),
            br(),
            br()
          ),

          mainPanel(
            id = "main",
            width = 8,
            plotly::plotlyOutput("plot"),
            sliderInput("range",
                        label = "Slide to change number of observation:",
                        min = 1960, max = 2019, value = c(1960, 2019),
                        sep = "",
                        ticks = FALSE)
          )
        )
      )
    )
)

