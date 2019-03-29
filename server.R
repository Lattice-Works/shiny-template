shinyServer(function(input, output, session) {
    
    jwt <- reactiveVal('NA')
    jwt <- callModule(authentication_server, "authentication", jwt)
    
    output$demo_table <- renderDataTable({
        demodataset <- "b4a33df2-b8ee-4af5-ba6b-bc2dee4b3918"
        basepath = "https://api.openlattice.com"
        header_params <-
            unlist(list("Authorization" = paste("Bearer", jwt())))
        client <- ApiClient$new(defaultHeaders = header_params,
                                basePath = basepath)
        dataApi <- DataApi$new(apiClient = client)
        dataset <- dataApi$load_entity_set_data(demodataset)
        dataset
    })
    
    output$histogram <- renderPlot({
        vals <- rnorm(input$vals)
        hist(vals, col = cols[1], border = cols[1])
    })
    
})
