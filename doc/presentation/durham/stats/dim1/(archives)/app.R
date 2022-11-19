# Teaching app
# data with 1 dimension

library(shiny)
library(plotly)
library(archdata)

data("Mesolithic")

# white.font <- list(
#   family = "Courier New",
#   size = 14,
#   color = "white")

max(colSums(Mesolithic))


ui <- fluidPage(
  # tags$style('.container-fluid {
  #                            background-color: #000000;
  #             }'),
  selectInput("category", "category", 
              choices = colnames(Mesolithic), selected = "Microliths"),
  radioButtons("diagram", "points / histogram",
               choices = c("points", "histogram")
               # choiceNames = list(
               #   HTML("<font color='grey'>points</font>"),
               #   HTML("<font color='grey'>histogram</font>")
               # ),
               # choiceValues = c("points", "histogram")
  ),
  radioButtons("bockaxe", "fixed x-axis",
               choices = c("Yes", "No")
               # choiceNames = list(
               #   HTML("<font color='grey'>points</font>"),
               #   HTML("<font color='grey'>histogram</font>")
               # ),
               # choiceValues = c("points", "histogram")
  ),
  # choices = c("points", "histogram")),
  plotlyOutput("graph")
)

server <- function(input, output, session){
  output$graph <- renderPlotly({
    if(input$diagram == "points"){
      gplot <- plot_ly(Mesolithic,
                       x = ~get(input$category),
                       y = 0,
                       type = 'scatter',
                       mode = 'markers',
                       size = 2)
      if(input$bockaxe == FALSE){
        gplot <- gplot%>%
          layout(
            xaxis = list(
              title = input$category),
            yaxis = list(
              title = '',
              showticklabels = FALSE)
          )
      } 
      else if(input$bockaxe == TRUE){
        gplot <- gplot%>%
          layout(
            xaxis = list(
              domain = c(0, max(colSums(Mesolithic))),
              title = input$category),
            yaxis = list(
              title = '',
              showticklabels = FALSE)
          )
      }
      print(gplot)
    }
    else if(input$diagram == "histogram"){
      print(
        plot_ly(Mesolithic,
                x = ~get(input$category),
                type = "histogram") %>%
          layout(#font = list(color = "grey"),
                 # plot_bgcolor='#000000',
                 # paper_bgcolor='#000000',
                 xaxis = list(
                   title = input$category),
                   # gridcolor = 'grey'),
                 yaxis = list(
                   title = 'n')
                   # zerolinecolor = '#ffff',
                   # gridcolor = 'grey')
          )
      )
    }
  })
}

shinyApp(ui, server)

# gplot<- ggplot(Mesolithic) +
#   geom_point(aes(y = 0, x = Scrapers)) +
#   xlim(0, 3000)
# ggplotly(gplot)