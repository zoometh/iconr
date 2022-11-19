# simple histogram

library(shiny)

ui <- fluidPage(
  sliderInput("bins", "Number of bins:", 
              min = 1, max = 50, value = 30),
  plotOutput("distPlot")
)

server <- function(input, output, session){
  output$distPlot <- renderPlot({
    x <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}

shinyApp(ui, server)