library(shinyWidgets)
library(shinythemes)
library(stringr)





navbarPage("Libreria di Francesco",
           tabPanel("My Library",
                        fluidRow(
                            column(4,uiOutput("authors")),
                            column(4,uiOutput("editors")),
                            column(3,align='left',
                                   prettyToggle(inputId = "check_anno",  label_on = "Tutti gli anni",label_off = "Anno in corso", outline = TRUE,plain = TRUE,value=T,
                                                icon_on = icon("calendar-alt"),icon_off = icon("calendar-check")))
                           ),
                                        # Create a new row for the table.
           DT::dataTableOutput("table",width = "150%")
           ),
           tabPanel("Statistics",
                    DT::dataTableOutput("summary",width="50%")
                    ),
                                        #                 setBackgroundColor(color = c("rgb(166, 182, 224)", "rgb(246,246,246)"),gradient = "linear",direction = "top")
           setBackgroundColor(color = c("rgb(201, 212, 242)", "rgb(246,246,246)"),gradient = "radial",direction = "bottom")
  )



