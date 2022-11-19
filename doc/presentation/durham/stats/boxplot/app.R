# boxplots

library(archdata)
library(shiny)
library(ggplot2)

ui <- fluidPage(
  selectInput("chemical",
              label = "chemical element",
              choices = c("Na2O",
                          "CaO"),
              selected = "Na2O"),
  plotOutput("boxPlot")
)

server <- function(input, output, session){
  data(RBPottery)
  output$boxPlot <- renderPlot({
    if(input$chemical == "Na2O"){
      gplot <- ggplot(RBPottery, aes(x = Region, y = Na2O)) + 
        geom_boxplot(outlier.colour = NA) +
        stat_summary(fun = mean, geom = "point", shape = 3, size = 4, color = "red") +
        geom_jitter(position = position_jitter(w = 0.1),
                    alpha = 0.5) +
        theme_bw()
      print(gplot)
    }
    if(input$chemical == "CaO"){
      gplot <- ggplot(RBPottery, aes(x = Region, y = CaO)) + 
        geom_boxplot(outlier.colour = NA) +
        stat_summary(fun = mean, geom = "point", shape = 3, size = 4, color = "red") +
        geom_jitter(position = position_jitter(w = 0.1),
                    alpha = 0.5) +
        theme_bw()
      print(gplot)
    }
    # x <- faithful[, 2]  # Old Faithful Geyser data
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}

shinyApp(ui, server)


# data(RBPottery)
# print(aggregate(RBPottery[, -c(1:3)], list(Region=RBPottery$Region), mean), digits=2)
# plot(Na2O~CaO, RBPottery, pch=as.numeric(Region)-1)
# legend("topright", levels(RBPottery$Region), title="Region", pch=0:2)