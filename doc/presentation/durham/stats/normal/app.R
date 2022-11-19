# normal distribution

library(ggplot2)

ui <- fluidPage(
  sliderInput("mean",
              label = "mean",
              min = -2, value = 0, max = +2),
  sliderInput("sd",
              label = "standard deviation",
              min = .4, value = .4, max = 5),
  # checkboxGroupInput("m", "mean and median", c("mean", "median")),
  plotOutput("graph")
)

server <- function(input, output) {
  output$graph <- renderPlot({
    x <- seq(-5, 5, length = 1000)
    y <- dnorm(x, mean = input$mean, sd = input$sd)
    gplot <- ggplot() +
      geom_line(aes(x, y), color = "black") +
      ylim(0, 1) +
      theme_bw()
    # if("mean" %in% input$m){
    #   mean.x <- mean(input$mean)
    #   gplot <- gplot +
    #     geom_vline(xintercept = mean.x, color = "red")
    # }
    # if("median" %in% input$m){
    #   median.x <- median(x)
    #   gplot <- gplot +
    #     geom_vline(xintercept = median.x, color = "blue")
    # }
    print(gplot)
  })
}

shinyApp(ui, server)
