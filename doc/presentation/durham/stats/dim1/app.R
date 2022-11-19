# Teaching app
# data with 1 dimension

library(shiny)
library(plotly)
library(archdata)

data("Mesolithic")

ui <- fluidPage(
  br(), br(), br(), br(), br(), br(), br(), br(), br(),
  h3("British Mesolithic assemblages (n = 33 sites)"),
  selectInput("category", "category", 
              choices = colnames(Mesolithic), selected = "Microliths"),
  radioButtons("diagram", "points / histogram",
               choices = c("points", "histogram")
  ),
  sliderInput(inputId = "bins",
              label = "Number of bins:",
              min = 1,
              max = 10,
              value = 5),
  radioButtons("blockaxe", "fixed x-axis",
               choices = c("Yes", "No")
  ),
  plotlyOutput("graph",
               height = "400px")
)

server <- function(input, output, session){
  output$graph <- renderPlotly({
    if(input$diagram == "points"){
      x <- Mesolithic[ , input$category]
      #lbls <- paste0("site-", row.names(Mesolithic), "<br>", as.character(x))
      if(input$blockaxe == "No"){
        gplot <- ggplot() +
          geom_point(aes(y = rep(0, length(x)), x = x)) +
          theme_bw()
      } 
      else if(input$blockaxe == "Yes"){
        gplot <- ggplot() +
          geom_point(aes(y = rep(0, length(x)), x = x)) +
          theme_bw() +
          xlim(0, max(Mesolithic))
      }
      print(ggplotly(gplot))
    }
    else if(input$diagram == "histogram"){
      # x <- input$category
      # bins <- seq(min(x), max(x), length.out = input$bins + 1)
      print(
        plot_ly(Mesolithic,
                x = ~get(input$category),
                nbinsx = input$bins,
                type = "histogram") %>%
          layout(xaxis = list(
                   title = input$category),
                 yaxis = list(
                   title = 'n')
          )
      )
    }
  })
}

shinyApp(ui, server)
