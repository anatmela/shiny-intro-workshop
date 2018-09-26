#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to provide output
shinyServer(function(input, output) {
  
  output$gdpplot <- renderPlot({
    logscale <- input$logscale
    
    gapdata <- gapminder[gapminder$year >= input$years[1] &  
                           gapminder$year <= input$years[2] & 
                           gapminder$pop >= input$minpop, ]
    
    if (input$continent != "all") {
      gapdata  <-  filter(gapdata, continent == input$continent)
    }
    
    p <- gapdata %>%
      ggplot() +
      geom_point(aes(x = gdpPercap, y = lifeExp, 
                     colour = continent), 
                 alpha = 0.5) + 
      theme_bw()
    
    if(logscale){
      p + scale_x_log10()
    }else{
      p
    }
  })
  
  output$summary_dat <- renderPrint({ 
    gapdata <- gapminder[gapminder$year >= input$years[1] &  
                           gapminder$year <= input$years[2] & 
                           gapminder$pop >= input$minpop, ]
    
    if (input$continent != "all") {
      gapdata  <-  filter(gapdata, continent == input$continent)
    }
    
    summary(gapdata)
  })
  
  output$dataf <- renderTable({
    gapdata <- gapminder[gapminder$year >= input$years[1] &  
                           gapminder$year <= input$years[2] & 
                           gapminder$pop >= input$minpop, ]
    
    if (input$continent != "all") {
      gapdata  <-  filter(gapdata, continent == input$continent)
    }
    
    head(gapdata)
  })
  
})
