box::use(
  shiny[
    fluidPage,
    moduleServer,
    NS,
    tableOutput,
    selectInput,
    renderTable,
    observeEvent,
    showNotification,
    req
  ]
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    selectInput(
      selectize = FALSE,
      ns("variable"), "Variable:",
      c(
        "Cylinders" = "cyl",
        "Transmission" = "am",
        "Gears" = "gear"
      )
    ),
    tableOutput(ns("data"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$data <- renderTable(
      {
        datasets::mtcars[, c("mpg", input$variable), drop = FALSE]
      },
      rownames = TRUE
    )

    observeEvent(
      req(input$variable == "cyl"),
      {
        showNotification("Hello")
      }
    )
  })
}
