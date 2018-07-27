#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data("mtcars")
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

      
        
        output$formula <- renderText({
                xnam <- paste("am")
                if(input$addwt==TRUE){
                        xnam <- paste(c(xnam, "wt"))
                }
                if(input$addcyl==TRUE){
                        xnam <- paste(c(xnam, "cyl"))
                }
                if(input$addhp==TRUE){
                        xnam <- paste(c(xnam, "hp"))
                }
                fmla <- paste("Using LM formula: mpg ~ ", paste(xnam, collapse="+"))
                
        as.character(fmla)
        })
        
        output$carsPlot <- renderPlot({
                
                        xnam <- paste("am")
                        if(input$addwt==TRUE){
                                xnam <- paste(c(xnam, "wt"))
                        }
                        if(input$addcyl==TRUE){
                                xnam <- paste(c(xnam, "cyl"))
                        }
                        if(input$addhp==TRUE){
                                xnam <- paste(c(xnam, "hp"))
                        }
                        fmla <- as.formula(paste("mpg ~ ", paste(xnam, collapse="+")))
                        

                        fit <- lm(fmla, data=mtcars)
                
                
                
                layout(matrix(c(1,2,3,4),2,2)) # 4 graphs/page 
                plot(fit)
        })
        output$modelSummary <- renderPrint({
                xnam <- paste("am")
                if(input$addwt==TRUE){
                        xnam <- paste(c(xnam, "wt"))
                }
                if(input$addcyl==TRUE){
                        xnam <- paste(c(xnam, "cyl"))
                }
                if(input$addhp==TRUE){
                        xnam <- paste(c(xnam, "hp"))
                }
                fmla <- as.formula(paste("mpg ~ ", paste(xnam, collapse="+")))
                
                
                fit <- lm(fmla, data=mtcars)
                summary(fit)
        })
  

})
