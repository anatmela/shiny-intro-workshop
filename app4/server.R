#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$plot1 <- renderPlot({
    val = input$valchoice
    
    ggplot() + 
      geom_point(aes(x = rnorm(val), y = 1:val))
  }) 
  
  output$text1 <- renderPrint({
    print(input$colourchoice)
    })
  
  output$table <- renderTable({
    head(mtcars)
  })
  
})
