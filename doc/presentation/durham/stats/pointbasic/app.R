# Basic notion on point pattern analysis

library(shiny)
library(spatstat)

ui <- fluidPage(
  br(), br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
  h3("Main geographical indices"),
  h4("Fist-Order Neighborhood Analysis"),
  sidebarLayout(
    sidebarPanel(
      width = 3,
      # selectInput("geom", 
      #             label = "Geometry type",
      #             choices = c("Point",
      #                         "Line",
      #                         "Polygon"),
      #             selected = "Point"),
      # sliderInput("nbpts",
      #             label = "Number of points",
      #             min = 3, value = 5, max = 10, step = 1),
      checkboxGroupInput("stat",
                         label = "Display",
                         choices = c("Mean Center",
                                     "Central Feature",
                                     "Convexhull",
                                     "Minimum Bounding Rectangle",
                                     "Minimum Bounding Circle",
                                     "Delaunay",
                                     "Dirichlet"))
      # fullscreen_all(click_id = "test"),
      # actionButton("refresh", "Refresh", icon = icon("refresh"))
      # actionButton("n_poly", icon = icon("refresh"), label = "")
    ),
    mainPanel(
      fluidRow(plotOutput(outputId = "spatPlot",
                          height = "600px")
      )
    )
  )
)

server <- function(input, output) {
  x1 <- seq(1:10)
  w <- as.owin(c(min(x1), max(x1),
                 min(x1), max(x1)))
  plot(w, lwd = 3, main = "")
  pts <- runifpoint(6, win = w)
  ctr <- ppp(mean(pts$x), mean(pts$y), w)
  output$spatPlot <- renderPlot({
    # pts <- runifpoint(input$nbpts, win = w)
    # print(input$refresh)
    # if (input$geom == "Point") {
    plot(pts, pch = 16, cex = 1.5)
    if ("Minimum Bounding Circle" %in% input$stat) {
      mbc <- boundingcircle(pts)
      plot(mbc, add = TRUE, border = "blue")
    }
    if ("Minimum Bounding Rectangle" %in% input$stat) {
      mbr <- boundingbox(pts)
      plot(mbr, add = TRUE, border = "purple")
    }
    if ("Convexhull" %in% input$stat) {
      ch <- convexhull(pts)
      plot(ch, add = TRUE, border = "darkgrey")
    }
    if ("Central Feature" %in% input$stat) {
      # ctr <- centroid.owin(pts, as.ppp = FALSE)
      closest <- nncross(ctr, pts)
      ctf <- pts[closest$which]
      points(ctf$x, ctf$y, pch = 1, col="darkgrey",
             lwd = 2, cex = 3)
    }
    if ("Mean Center" %in% input$stat) {
      # ctr <- centroid.owin(pts, as.ppp = FALSE)
      # points(ctr$x, ctr$y, pch = 3, col = "red", cex = 2)
      points(ctr$x, ctr$y, pch = 3, col = "red", cex = 2)
    }
    if ("Dirichlet" %in% input$stat) {
      dirt <- dirichlet(pts)
      plot(dirt, add = TRUE, border = "purple")
    }
    if ("Delaunay" %in% input$stat) {
      deln <- delaunay(pts)
      plot(deln, add = TRUE, border = "orange")
    }
    # }
    # if (input$geom == "Line") {
    #   plot(pts)
    #   segments(x0 = pts$x[-length(pts$x)], 
    #            y0 = pts$y[-length(pts$y)], 
    #            x1 = pts$x[-1], 
    #            y1 = pts$y[-1],
    #            col = "darkgreen")
    #   if ("Minimum Bounding Circle" %in% input$stat) {
    #     mbc <- boundingcircle(pts)
    #     plot(mbc, add = TRUE)
    #   }
    #   if ("Minimum Bounding Rectangle" %in% input$stat) {
    #     mbr <- boundingbox(pts)
    #     plot(mbr, add = TRUE)
    #   }
    #   if ("Convexhull" %in% input$stat) {
    #     ch <- convexhull(pts)
    #     plot(ch, add = TRUE)
    #   }
    #   if ("Centroid" %in% input$stat) {
    #     d <-data.frame(x0 = pts$x[-length(pts$x)], 
    #                    y0 = pts$y[-length(pts$y)], 
    #                    x1 = pts$x[-1], 
    #                    y1 = pts$y[-1])
    #     d$xmean <- rowMeans(cbind(d$x0, d$x1))
    #     d$ymean <- rowMeans(cbind(d$y0, d$y1))
    #     points(d$xmean, 
    #            d$ymean,
    #            pch = 16,
    #            col = "darkgreen")
    #   }
    # }
  })
  # observeEvent(input$refresh, {
  #   shinyjs::reset("form")
  # })
}


shinyApp(ui, server)
