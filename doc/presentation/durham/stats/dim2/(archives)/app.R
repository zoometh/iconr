# Teaching app
# data with 2 dimensions

library(plotly)

data("airquality")
fv <- airquality %>% filter(!is.na(Ozone)) %>% lm(Ozone ~ Wind,.) %>% fitted.values()
data <- airquality %>% filter(!is.na(Ozone))

ui <- fluidPage(
  tags$head(tags$script('
                        var dimension = [0, 0];
                        $(document).on("shiny:connected", function(e) {
                        dimension[0] = window.innerWidth;
                        dimension[1] = window.innerHeight;
                        Shiny.onInputChange("dimension", dimension);
                        });
                        $(window).resize(function(e) {
                        dimension[0] = window.innerWidth;
                        dimension[1] = window.innerHeight;
                        Shiny.onInputChange("dimension", dimension);
                        });
                        ')),
    # tags$style('.container-fluid {
    #                          background-color: #000000;
    #           }'),
  radioButtons("regression", "", choices = c("points", "regression")
               # choiceNames = list(
               #   HTML("<font color='grey'>points</font>"),
               #   HTML("<font color='grey'>regression</font>")
               # ),
               # choiceValues = c("points", "regression")
  ),
  plotlyOutput("graph", height = "auto")
)

server <- function(input, output, session){
  fig <- plot_ly(data = data,
                 x = ~Wind,
                 y = ~Ozone,
                 mode = "markers",
                 size = 2) %>%
    add_markers() %>%
    layout(showlegend = F
           # font = list(color = "grey"),
           # plot_bgcolor='#000000',
           # # paper_bgcolor='#000000',
           # xaxis = list(gridcolor = "grey"),
           # yaxis = list(gridcolor = "grey")
    )
  output$graph <- renderPlotly({
    if(input$regression == "points"){
      print(fig)
    }
    else if(input$regression == "regression"){
      fig <- fig %>%
        add_trace(x = ~Wind,
                  y = fv,
                  mode = "lines",
                  size = 0.1)
      print(fig)
    }
  })
}

shinyApp(ui, server)

# data(OxfordPots)
# # Construct Fulford and Hodder's Figure 3
# Oxford.lm1 <- lm(log(OxfordPct)~OxfordDst, OxfordPots, subset=WaterTrans==0)
# Oxford.lm2 <- lm(log(OxfordPct)~OxfordDst, OxfordPots, subset=WaterTrans==1)
# plot(log(OxfordPct)~OxfordDst, OxfordPots, xlim=c(0, 160), yaxt="n", ylim=c(0, 3.25),
#      ylab="Percentage of Oxford Pottery", xlab="Distance (miles)", 
#      pch=c(1, 16)[WaterTrans+1], cex=1.5, lwd=2)
# # Add log y-axis
# axis(2, log(c(1, 5, 10, 20)), c(1, 5, 10, 20), las=1)
# abline(Oxford.lm1, lwd=2)
# abline(Oxford.lm2, lwd=2)