library(shiny)

latticecols <- c("#cdd1db","#6124e2", "#44beff", "#bc0000")

shinyServer(function(input, output) {
  
  output$histogram <- renderPlot({
    vals <- rnorm(input$vals)
    hist(vals, col = latticecols[1], border=latticecols[1])
    })
  
})
