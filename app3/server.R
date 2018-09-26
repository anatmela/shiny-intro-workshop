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
    ggplot() + geom_point(aes(x = 1:100, y = 1:100))
    }) 
  
  output$text1 <- renderText({
    print("This is a text")
    })
  
  output$table <- renderTable({
    head(mtcars)
  })
  
})
