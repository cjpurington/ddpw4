---
title       : Data Projects Course Project 3
subtitle    : Adding variables to the mpg~transmission type linear model
author      : Chris Purington
job         : student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Data Projects Course Project 3

1. This slide show and accompanying shiny page was made for the coursera Developing Data Products course.
2. The project uses an example bsased on one of the other course projects, in which we were asked to compare car mpg to transmission type.
3. The following slides will explain what the shiny page does and how to use it.

--- .class #id 

## Shiny app summary and use

The shiny page runs a linear regression model on the mtcars data set, using mpg as the dependant variable and transmission type as the independant variable. 

In addition, other independent variables such as car weight, cylinder count, and horsepower can be included using checkboxes on the left panel.

To add these variables, simply check the boxes designated for them. By default transmission type is always selected.

---

## Shiny Server Operations

The app will return the residual plots and model summary for car MPG using transmission type and any of the three selectable variables. At the top of the page, the forumla currently being used is also shown.

The server uses the variable selections to create a formula string that will be used for the linear model:


```r
                        xnam <- paste("am")
                        if(input$addwt==TRUE){
                                xnam <- paste(c(xnam, "wt"))}
                        if(input$addcyl==TRUE){
                                xnam <- paste(c(xnam, "cyl"))}
                        if(input$addhp==TRUE){
                                xnam <- paste(c(xnam, "hp"))}
                        fmla <- as.formula(paste("mpg ~ ", paste(xnam, collapse="+")))
```

---

## Shiny Server Operations

The app then uses this string to create the appropriate formula for the `lm` function:


```r
                fit <- lm(fmla, data=mtcars)
                layout(matrix(c(1,2,3,4),2,2)) # 4 graphs/page 
                plot(fit) # plot residuals
                summary(fit)
```


