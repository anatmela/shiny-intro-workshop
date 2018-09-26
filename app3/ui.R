#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # title of app
  titlePanel("Intro app 3"),
  
  sidebarLayout(
    
    # Sidebar - providing input options to server ----
    sidebarPanel("Sidebar panel", 
                 p(), 
                 sliderInput("valchoice", 
                             "Select value", 
                             min = 100, 
                             max = 500, 
                             value = 200), 
                 
                 selectInput("colourchoice", 
                             "Select colour", 
                             choices = c("black", "blue", "green", "red"), 
                             selected = "black")
    ),
    
    # Main panel ----
    mainPanel("Main panel", 
              tabsetPanel(
                tabPanel("plot", 
                         plotOutput("plot1")),
                tabPanel("text", 
                         verbatimTextOutput("text1")),
                tabPanel("table", 
                         tableOutput("table"))
              )
    ), 
    
    position = "left"
  )
))
