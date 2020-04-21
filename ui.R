library(shinyWidgets)


fluidPage(
  titlePanel("My Library"),
fluidRow(
      column(4,uiOutput("authors")),
      column(4,uiOutput("editors"))
),
  # Create a new row for the table.
  DT::dataTableOutput("table")
#)
)
