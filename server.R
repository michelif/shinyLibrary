library(DT)
library(shiny)

function(input, output) {

  mydata <- reactive({
    data <- read.csv(file = './data/libreria.csv',stringsAsFactors=F)
    if (is.null(data)){
      return(NULL)
    }

    return(data)
  })

#output$data<-mydata()
  # Filter data based on selections

output$authors<-renderUI({
  data<-mydata()
  list_authors<-unique(data$Autore)
  sort(list_authors)
  selectInput('aut', 'Autore',c("All",list_authors),selected="All" )
})
output$editors<-renderUI({
  data<-mydata()
  list_editors<-unique(data$Editore)
  selectInput('edit', 'Editore',c("All",list_editors),selected="All")
})

output$table <- DT::renderDataTable(DT::datatable({
  req(input$edit)
  data<-mydata()
  if (input$edit!="All")data <- data[data$Editore == input$edit,]
  if (input$aut!="All")data <- data[data$Autore == input$aut,]
  data
}))


}
