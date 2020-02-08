# Define UI ----

ui <- fluidPage(
  theme = "bootstrap.css",
  includeCSS("www/styles.css"),
    navbarPage(
      "CO2 EMISSION",
      id = "main_navbar",

      tabPanel(
        "Information",
        sidebarLayout(
          sidebarPanel(
            width = 3,
            br(),
            br(),
            uiOutput("var"),
            br(),
            br(),

            sliderInput("lag",
                        label = "Number of lags:",
                        min = 0, max = 10, value = 5,
                        sep = ""),
            br(),
            br()
          ),
          mainPanel(
            id = "main",
            width = 8,
            plotly::plotlyOutput("plot"),
            sliderInput("range",
                        label = "Select year:",
                        min = 1960, max = 2019, value = c(1960, 2019),
                        sep = "")
          )
        )
      ),

      tabPanel(
        "About",
        sidebarLayout(
          sidebarPanel(
            width = 3,

            br(),
            br(),


            br(),
            br(),

            br(),

          ),
          mainPanel(DT::dataTableOutput("dart_table"))
        )
      )
    )
)

