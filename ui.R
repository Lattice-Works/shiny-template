library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(theme = "custom.css",
            title ="Cafe",
    tags$head(
      tags$link(rel= "stylesheet", type = "text/css", href = "http://fonts.googleapis.com/css?family=Open+Sans"),
      tags$link(rel = "icon", type = "image/png", href="favicon.png")
    ),
    navbarPage(
      title = div(
        column(img(src="logomark.png", class="logo"),width=1),
        column(class="portalname", "Cafe", width=6)
        ),
      collapsible = FALSE,
      tabPanel(
        "first",
        sidebarLayout(
          sidebarPanel(
            sliderInput("vals",
                        "Number of values:",
                        min = 10,
                        max = 100,
                        value = 30)
            ),
          
            # Show a plot of the generated distribution
            mainPanel(
              plotOutput(outputId = "histogram")
            )
          )
        ),
      tabPanel(
        "second",
        mainPanel(
          "This is another page !"
        )
      )
      )
    )
  )

 
