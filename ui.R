library(shinyWidgets)
library(shinythemes)
library(stringr)





navbarPage("Libreria di Francesco",
           tabPanel("My Library",
                        fluidRow(
                            column(4,uiOutput("authors")),
                            column(4,uiOutput("editors"))
                           ),
                                        # Create a new row for the table.
           DT::dataTableOutput("table",width = "150%")
           ),
           tabPanel("Statistics",
                    DT::dataTableOutput("summary")
                    ),
                                        #                 setBackgroundColor(color = c("rgb(166, 182, 224)", "rgb(246,246,246)"),gradient = "linear",direction = "top")
           setBackgroundColor(color = c("rgb(201, 212, 242)", "rgb(246,246,246)"),gradient = "radial",direction = "bottom")
  )



