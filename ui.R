library(shinyWidgets)
library(shinythemes)

navbarPage(theme=shinytheme("sandstone"),






#  setBackgroundColor(color = c("rgb(250,0,85)", "rgb(246,246,246)"),gradient = "linear",direction = "bottom"
#    ),



  title="Libreria di Francesco",
  tabPanel("My Library",
  mainPanel(
    fluidRow(
      column(4,uiOutput("authors")),
      column(4,uiOutput("editors"))
    ),
    # Create a new row for the table.
    DT::dataTableOutput("table")
  )
),
  tabPanel("Statistics",
  print("daje")
)
)
