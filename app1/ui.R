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
  titlePanel("Intro app 1"),
  
  sidebarLayout(
    
    # Sidebar - providing input options to server 
    sidebarPanel("Sidebar panel"),
    
    # Main panel
    mainPanel("Main panel"), 
    
    position = "left"
  )
))
