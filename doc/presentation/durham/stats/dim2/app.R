# Teaching app
# data with 2 dimensions

library(plotly)
library(archdata)

data(OxfordPots)


ui <- fluidPage(
  br(), br(), br(), br(), br(), br(), br(), br(), br(),
  h3("Distribution of Late Romano-British Oxford Pottery"),
  checkboxGroupInput("watertrans", "water transportation probable",
                     choices = c("Yes", "No"), selected = c("Yes", "No")
  ),
  radioButtons("regression", "show regression",
               choices = c("Yes", "No"), selected = "No"
  ),
  # radioButtons("residuals", "show residuals",
  #              choices = c("Yes", "No"), selected = "No"
  # ),
  plotlyOutput("graph", 
               height = "500px")
)

server <- function(input, output, session){
  # water
  OxfordPots$OxfordPct.log <- log(OxfordPots$OxfordPct)
  Oxford.water <- subset(OxfordPots, WaterTrans == 1)
  Oxford.lm.water <- lm(log(OxfordPct)~OxfordDst, Oxford.water)
  lm.water <- lm(OxfordPct ~ OxfordDst, data = Oxford.water)
  lm.water.R2 <- round(summary(lm.water)$r.squared, 2)
  # no water
  Oxford.nowater <- subset(OxfordPots, WaterTrans == 0)
  Oxford.lm.nowater <- lm(log(OxfordPct)~OxfordDst, Oxford.nowater)
  lm.nowater <- lm(OxfordPct ~ OxfordDst, data = Oxford.nowater)
  lm.nowater.R2 <- round(summary(lm.nowater)$r.squared, 2)
  Oxford.nowater$predicted <- predict(lm.nowater)   # Save the predicted values
  Oxford.nowater$residuals <- residuals(lm.nowater) # Save the residual values
  # 
  # Oxford.nowater$predicted <- predict(Oxford.lm.nowater)   # Save the predicted values
  # Oxford.nowater$residuals <- residuals(Oxford.lm.nowater) # Save the residual values
  
  # d <- mtcars
  # fit <- lm(mpg ~ hp, data = d)
  

  
  output$graph <- renderPlotly({
    # water transport
    if("Yes" %in% input$watertrans & !("No" %in% input$watertrans)){
      gplot <- ggplot(Oxford.water, aes(OxfordDst, OxfordPct)) +
        # stat_summary(fun.data=mean_cl_normal) + 
        geom_point() +
        # geom_point(data = Oxford.nowater, aes(OxfordDst, OxfordPct)) +
        scale_y_continuous(breaks = c(1, 5, 10, 20), trans = 'log') +
        xlab("Distance (miles)") +
        ylab("Percentage of Oxford Pottery") +
        xlim(c(0, 160)) +
        theme_bw()
      if("Yes" %in% input$regression){
        gplot <- gplot +
          geom_smooth(method = 'lm', formula= y~x, se = F, color = "black") +
          geom_text(data = Oxford.water,
                    aes(x = max(OxfordDst) + 2,
                        y = min(OxfordPct) + 2,
                        label = paste0("water transport R2 = ", lm.water.R2))
          )
      }
      print(ggplotly(gplot))
    }
    # no water transport
    else if("No" %in% input$watertrans & !("Yes" %in% input$watertrans)){
      gplot <- ggplot(Oxford.nowater, aes(OxfordDst, OxfordPct)) +
        geom_point(shape = 1) +
        scale_y_continuous(breaks = c(1, 5, 10, 20), trans = 'log') +
        xlab("Distance (miles)") +
        ylab("Percentage of Oxford Pottery") +
        xlim(c(0, 160)) +
        theme_bw()
      if("Yes" %in% input$regression){
        gplot <- gplot +
          geom_smooth(method='lm', formula= y~x, se = F, color = "black") +
          geom_text(data = Oxford.nowater, 
                    aes(x = max(OxfordDst) + 2,
                        y = min(OxfordPct) + 2,
                        label = paste0("no water transport R2 = ", lm.nowater.R2)))
        # if("Yes" %in% input$residuals){
        #   print("GJGKJGGKJGKJG")
        #   gplot <- gplot +
        #     geom_smooth(method='lm', formula= y~x, se = F, color = "black") +
        #     geom_text(data = Oxford.nowater, 
        #               aes(x = max(OxfordDst) + 2,
        #                   y = min(OxfordPct) + 2,
        #                   label = paste0("no water transport R2 = ", lm.nowater.R2))) +
        #     geom_segment(data = Oxford.nowater,
        #                  aes(xend = OxfordDst,
        #                      yend = predicted),
        #                  alpha = .2) +  # alpha to fade lines
        #     # geom_point() +
        #     geom_point(data = Oxford.nowater, 
        #                aes(y = predicted), 
        #                shape = 4)
        # }
      }
      print(ggplotly(gplot))
    }
    # both
    else if("No" %in% input$watertrans & "Yes" %in% input$watertrans){
      gplot <- ggplot() +
        geom_point(Oxford.nowater, mapping = aes(OxfordDst, OxfordPct), shape = 1) +
        geom_point(Oxford.water, mapping = aes(OxfordDst, OxfordPct)) +
        scale_y_continuous(breaks = c(1, 5, 10, 20), trans = 'log') +
        xlab("Distance (miles)") +
        ylab("Percentage of Oxford Pottery") +
        xlim(c(0, 160)) +
        theme_bw()
      if("Yes" %in% input$regression){
        gplot <- gplot +
          geom_smooth(data = Oxford.nowater,
                      aes(x = OxfordDst, y = OxfordPct),
                      method='lm', formula= y~x, se = F, color = "black") +
          geom_text(data = Oxford.nowater,
                    aes(x = max(OxfordDst) + 2,
                        y = min(OxfordPct) + 2,
                        label = paste0("no water transport R2 = ", lm.nowater.R2),
                        hjust = 0)) +
          geom_smooth(data = Oxford.water, 
                      aes(x = OxfordDst, y = OxfordPct),
                      method='lm', formula= y~x, se = F, color = "black") +
          geom_text(data = Oxford.water,
                    aes(x = max(OxfordDst) + 2,
                        y = min(OxfordPct) + 2,
                        label = paste0("water transport R2 = ", lm.water.R2),
                        hjust = 0,
                        vjust = 0)
          )
      }
      print(ggplotly(gplot))
    }
  })
}

shinyApp(ui, server)