
# Define UI ----
ui <- shiny::fluidPage(
  shinyjs::useShinyjs(),
  # Load bootstrap and customize CSS file
  theme = "bootstrap.css",
  includeCSS("www/styles.css"),

   shiny::navbarPage(
      "CO2 EMISSION",
      id = "main_navbar",

      shiny::tabPanel(
        "Information",
        shiny::sidebarLayout(

          shiny::sidebarPanel(
            id = "sidepanel",
            width = 3,
            br(),
            br(),
            shiny::uiOutput("var"),
            br(),
            br(),
            shiny::checkboxInput("forecastCheckbox", label = "Forecast", value = FALSE),
            # uiOutput("forecastSlider"),
            shiny::sliderInput("lag",
                        label = "Forecasting lags:",
                        min = 1, max = 50, value = 5,
                        sep = ""),
            br(),
            br()
          ),

          shiny::mainPanel(
            id = "main",
            width = 8,
            plotly::plotlyOutput("plot"),
            shiny::sliderInput("range",
                        label = "Slide to change number of observation:",
                        min = 1960, max = 2019, value = c(1960, 2019),
                        sep = "",
                        ticks = FALSE)
          )
        )
      )
    )
)

