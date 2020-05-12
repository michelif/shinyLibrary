library(DT)
library(shiny)
library(data.table)
function(input, output) {

  mydata <- reactive({
    if (is.null(data)){
      return(NULL)
    }
    data$year_read=gsub(",","",gsub(" ","",str_extract(data$Stato.di.lettura,"20.[0-9],")))
    return(data)
  })

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
  setDT(data)
  dataRed <- data[,.(Titolo,Sottotitolo,Autore,Formato,Numero.di.pagine,Editore,Data.di.pubblicazione,year_read)]

  if (input$edit!="All")dataRed <- dataRed[dataRed$Editore == input$edit,]
  if (input$aut!="All")dataRed <- dataRed[dataRed$Autore == input$aut,]
  if(!input$check_anno)dataRed <- dataRed[dataRed$year_read == max(dataRed$year_read,na.rm=T)]
  dataRed
}))

output$summary<-DT::renderDataTable(DT::datatable({
  data<-mydata()
  aggregate(Numero.di.pagine ~ year_read, data,FUN=sum)
}))


}
