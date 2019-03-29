source("global.R")

# Define UI for application that draws a histogram
    tagList(
    useShinyjs(),
    navbarPage(
        id = "navbar",
        title =
            div(
                img(src = "logomark.png",
                    class = "logo"),
                "My application",
                class = "navbar-title"
            ),
        theme = "custom.css",
        fluid = TRUE,
        windowTitle = "title",
        collapsible = TRUE,
        header = tags$head(
            tags$style(HTML(
                "#page-nav > li:first-child { display: none; }"
            )),
            tags$link(rel = "stylesheet", type = "text/css", href = "https://fonts.googleapis.com/css?family=Chivo"),
            tags$link(rel = "stylesheet", type = "text/css", href = "shinydashboard.css"),
            tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
            tags$link(rel = "icon", type = "image/png", href = "favicon.png"),
            tags$script(src = "https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js")
        ),
        navbarMenu("Figures",
                   tabPanel("Histogram",
                            fluidRow(
                                column(
                                    width = 4,
                                    sliderInput(
                                        "vals",
                                        "Number of values:",
                                        min = 10,
                                        max = 100,
                                        value = 30
                                    )
                                ),
                                column(
                                    width = 8,
                                    box(
                                        width = 12,
                                        solidHeader = TRUE,
                                        title = "Histogram",
                                        plotOutput('histogram', height = 500)
                                        )
                                    )
                                )
                            )
        ),
        navbarMenu("Tables",
                   tabPanel("Demo data",
                            fluidRow(
                                box(
                                    width = 12,
                                    solidHeader = TRUE,
                                    title = "Demo data",
                                    dataTableOutput(outputId = "demo_table")
                                    )
                                )
                            )

        )
    )
)