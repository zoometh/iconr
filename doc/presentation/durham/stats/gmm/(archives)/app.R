# Momocs stuff

library(Momocs)
library(shiny)

ui <- fluidPage(
  tabsetPanel(
    tabPanel("Single", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 sliderInput("bot",
                             label = "Select one bootle",
                             min = 1, value = 1, max = length(bot), step = 1),
                 selectInput("points",
                             label = "Show points",
                             choices = c("Yes","No"),
                             selected = "No"),
                 sliderInput("efourier",
                             label = "number of harmonics",
                             min = 2, value = 10, max = 20)
               ),
               mainPanel("Shape", 
                         plotOutput(outputId = "onePlot")
               )
             )
    ),
    tabPanel("Compare", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 selectInput("scale",
                             label = "Scale",
                             choices = c("Not centered, Not scaled",
                                         "Centered",
                                         "Centered-Scaled"),
                             selected = "Not centered, Not scaled")
               ),
               mainPanel("Shape Comparison", 
                         plotOutput(outputId = "stackPlot")
               )
             )
    ),
    tabPanel("Classify", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 selectInput("gmm",
                             label = "gmm",
                             choices = c("PCA",
                                         "CLUST",
                                         "KMEANS"),
                             selected = "PCA"),
                 sliderInput("kmeans",
                             label = "Number of Kmeans centers",
                             min = 2, value = 3, max = 7)
               ),
               mainPanel("Shape Analysis", 
                         plotOutput(outputId = "gmmPlot"))
             )
    )
  )
)

server <- function(input, output) {
  output$onePlot <- renderPlot({
    idx <- input$bot
    idx <- idx + .5
    a.bot <- bot[idx]
    harm <- input$efourier
    ef <- efourier(a.bot, harm)
    efi <- efourier_i(ef)
    print(input$bot)
    # print(input$efourier)
    if (input$points == "Yes"){
      # ef <- efourier(a.bot, input$efourier)
      # efi <- efourier_i(ef)
      coo_plot(efi, border='black', main = paste(names(bot)[input$bot], "\n",
                                                 input$efourier, " harmonics"),
               points = TRUE, pch = 16)
    }
    else if (input$points == "No"){
      # ef <- efourier(a.bot, input$efourier)
      # # print(a.bot)
      # # print(input$efourier)
      # efi <- efourier_i(ef)
      coo_plot(efourier_i(ef), border='black', main = paste(names(bot)[input$bot], "\n",
                                                 input$efourier, " harmonics"))
      # coo_plot(a.bot)
    }
  })
  output$stackPlot <- renderPlot({
    if (input$scale == "Centered-Scaled") {
      bot %>%
        coo_center %>%
        coo_scale %>%
        coo_slidedirection("up") %T>%
        print() %>% 
        stack()
    }
    else if (input$scale == "Centered") {
      bot %>%
        coo_center %>%
        coo_slidedirection("up") %T>%
        print() %>% 
        stack()
    }
    else if (input$scale == "Not centered, Not scaled") {
      bot %>%
        coo_slidedirection("up") %T>%
        print() %>% 
        stack()
    }
  })
  output$gmmPlot <- renderPlot({
    if (input$gmm == "PCA") {
      bot.f <- efourier(bot, input$efourier)
      bot.p <- PCA(bot.f)
      plot(bot.p)
    }
    else if (input$gmm == "CLUST") {
      bot.f <- efourier(bot, input$efourier)
      bot.p <- CLUST(bot.f)
      plot(bot.p)
    }
    else if (input$gmm == "KMEANS") {
      bot.f <- efourier(bot, input$efourier)
      bot.f <- PCA(bot.f)
      KMEANS(bot.f, centers = input$kmeans)
    }
  })
}

shinyApp(ui, server)

# a.bot <- bot[1]
# ef <- efourier(a.bot, 12)
# efi <- efourier_i(ef)
# coo_plot(efi, border='black', main = paste(names(bot)[1], "\n",
#                                            12, " harmonics"),
#          points = TRUE, pch = 16)
