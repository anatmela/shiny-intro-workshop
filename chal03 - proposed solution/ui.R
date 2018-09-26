#
# This is an example of a shiny app, based on the gapminder data
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(gapminder)

# Define UI for application
shinyUI(fluidPage(
  
  # title of app
  titlePanel("Example app, Shiny workshop"),
  
  # Sidebar - providing input options to server
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("continent", 
                  "Choose continent", 
                  c("all", as.character(unique(gapminder$continent))), 
                  selected = "all"), 
      
      sliderInput("years", 
                  "Select year range", 
                  min = 1952, 
                  max = 2007, 
                  value = c(1952, 2007)), 
      
      numericInput("minpop", 
                   "Select minimum population", 
                   min = 0, 
                   max = 1e8, 
                   value = 0, 
                   step = 1e6)
      
    ),
    
    # Main panel - provide output from server
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", 
                 plotOutput("gdpplot"), 
                 checkboxInput(inputId = "logscale",
                               label = "Use log scale?", 
                               value = TRUE)
        ),
        tabPanel("Data example", tableOutput("dataf")), 
        tabPanel("Summary of data", verbatimTextOutput("summary_dat"))
      )
    )
  )
))
