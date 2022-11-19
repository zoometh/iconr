# Teaching app
# data with 3 dimensions

library(plotly)
library(jsonlite)

URL <- "https://gist.githubusercontent.com/davenquinn/988167471993bc2ece29/raw/f38d9cb3dd86e315e237fde5d65e185c39c931c2/data.json"
ds <- fromJSON(txt = URL)

colors = c('#8dd3c7','#ffffb3','#bebada',
           '#fb8072','#80b1d3','#fdb462',
           '#b3de69','#fccde5','#d9d9d9',
           '#bc80bd','#ccebc5','#ffed6f')

ui <- fluidPage(
  # tags$style('.container-fluid {
  #                            background-color: #000000;
  #             }'),
  radioButtons("ternary", "", choices = c("points", "areas")
               # choiceNames = list(
               #   HTML("<font color='grey'>points</font>"),
               #   HTML("<font color='grey'>areas</font>")
               # ),
               # choiceValues = c("points", "areas"),
               # selected = "areas"
  ),
  plotlyOutput("graph")
)

server <- function(input, output, session){
  output$graph <- renderPlotly({
    if(input$ternary == "points"){
      p <- plot_ly()
      for(i in 1:length(ds)){
        p <- add_trace(p,
                       data = ds[[i]],
                       a = ~clay,
                       b = ~sand,
                       c = ~silt,
                       type = "scatterternary",
                       mode = "lines+markers",
                       # evaluate = T,
                       line = list(color = "black"))
      }
      p <- layout(p,
                  title ="",
                  showlegend = F,
                  # font = list(color = "grey"),
                  # paper_bgcolor='#000000',
                  xaxis = list(title = "", showgrid = F, zeroline = F, showticklabels = F),
                  yaxis = list(title = "", showgrid = F, zeroline = F, showticklabels = F),
                  # sum = 100,
                  ternary = list(
                    aaxis = list(title = "Clay", tickformat = ".0%", tickfont = list(size = 10)),
                    baxis = list(title = "Sand", tickformat = ".0%", tickfont = list(size = 10)),
                    caxis = list(title = "Silt", tickformat = ".0%", tickfont = list(size = 10)))
      )
      print(p)
    }
    if(input$ternary == "areas"){
      p <- plot_ly()
      for(i in 1:length(ds)){
        p <- add_trace(p,
                       data = ds[[i]],
                       a = ~clay,
                       b = ~sand,
                       c = ~silt,
                       type = "scatterternary",
                       mode = "lines",
                       fill = "toself",
                       fillcolor = colors[i],
                       # evaluate = T,
                       line = list(color = "black"))
      }
      p <- layout(p,
                  title ="",
                  showlegend = F,
                  # font = list(color = "grey"),
                  # paper_bgcolor='#000000',
                  xaxis = list(title = "", showgrid = F, zeroline = F, showticklabels = F),
                  yaxis = list(title = "", showgrid = F, zeroline = F, showticklabels = F),
                  ternary = list(
                    aaxis = list(title = "Clay", tickformat = ".0%", tickfont = list(size = 10)),
                    baxis = list(title = "Sand", tickformat = ".0%", tickfont = list(size = 10)),
                    caxis = list(title = "Silt", tickformat = ".0%", tickfont = list(size = 10)))
      )
      print(p)
    }
  })
}

shinyApp(ui, server)
