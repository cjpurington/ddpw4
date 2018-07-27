#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that fits a linear model to car MPG and transmission
# plus additional variables
shinyUI(fluidPage(

  # Application title
  titlePanel("Adding variables to the MPG ~ transmission type linear model "),

  # Sidebar with checkboxes for the three selectable variables
  sidebarLayout(
          
          
    sidebarPanel(
       p("Choose variables to include in the linear model for mpg."),
       p("By default, transmission type is always included."),
       checkboxInput("addwt", "Add Weight", FALSE),
       checkboxInput("addcyl","Add Cylinder#",FALSE),
       checkboxInput("addhp","Add Horsepower",FALSE)
       ),

    # Show the residual plots and model summary
    mainPanel(
        textOutput("formula"),
        plotOutput("carsPlot"),
        verbatimTextOutput("modelSummary")
    )
  )
  
  
))
