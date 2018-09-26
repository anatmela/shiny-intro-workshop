#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(gapminder)

# Define UI for application
shinyUI(fluidPage(
  
  # title of app
  titlePanel("challenge 1"),
  
  sidebarLayout(
    
    # Sidebar - providing input options to server ----
    sidebarPanel("Sidebar panel", 
                 selectInput("continent", 
                             "Select continent from list", 
                             unique(gapminder$continent), 
                             selected = "Africa"
                 )
                 ),
    
    # Main panel ----
    mainPanel("Main panel", 
              tabsetPanel(
                tabPanel("Plot"),
                tabPanel("data example"),
                tabPanel("Summary")
              )
    ), 
    
    position = "left"
  )
))
