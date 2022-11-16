library(shiny)
library(iconr)

# - - - - - - - - - - - - - - - - - - - #
# the shiny app for iconr documentation #
# same parameters as the function:
#   - nodes, edges, colors, etc.
# the datasets are produced with iconr_*.R
# see 'data.create' <- T and '!incor.data'
# - - - - - - - - - - - - - - - - - - - #

famille <- c("stele bas aragon",
             "Valcamonica",
             "Pena Tu",
             "stele bouclier",
             "Scandinavie")
# famille <- c("stele bas aragon", "Valcamonica", "Pena Tu")
# setwd("..")
df <- read.csv(paste0(getwd(), "/", famille[1], "/imgs.csv"), sep=";")
def.dec <- paste0(df[1, "idf"], ".", df[1, "site"], "_", df[1, "decor"])

# datasets.path <- paste0(getwd(),"/docs/datasets")
datasets.path <- ""

ui <- fluidPage(
  fluidRow(
  sidebarPanel(
    selectInput("A", "family", choices = famille, selected = famille[1]),
    selectInput("B", "decoration", choices = def.dec),
    checkboxGroupInput("D", "graph elements",
                       c("nodes" = "nds",
                         "edges" = "eds"),
                       selected = c("nds", "eds"),
                       inline = T),
    selectInput("C", "node labels", choices = c("id", "type"), selected = "type")
  ),
  mainPanel(
    plotOutput("plot"))
    ),
  fluidRow(
    column(4, offset = 2,
           h5("nodes"), div (tableOutput ("nodes"), style = "font-size: 90%")),
    column(5, offset = .5,
           h5("edges"), div (tableOutput ("edges"), style = "font-size: 90%"))
    # ,
    # tableOutput('nodes')
  )
)

server <- function(input, output, session) {
  observe({
    # a.idf <- as.numeric(unlist(strsplit(input$B,"\\."))[1])
    # dataDir <- paste0(datasets.path, input$A)
    # df <- read.csv(paste0(dataDir, "/imgs.csv"), sep=";")
    # # Decoration to be plotted
    # site <- df[a.idf, "site"]
    # decor <- df[a.idf, "decor"]
    # nds.df <- read_nds(site, decor, dataDir, format = "shp")
    # eds.df <- read_eds(site, decor, dataDir, format = "shp")
    # select.nds <- c("site", "decor", "id", "type", "x", "y")
    # select.eds <- c("site", "decor", "a", "b", "type", "xa", "ya", "xb", "yb")
    # output$nodes <- renderTable(nds.df[ , select.nds])
    # output$edges <- renderTable(eds.df[ , select.eds])
    choices_B <- read.csv(paste0("", input$A, "/imgs.csv"), sep=";")
    # output$nodes <- renderTable(choices_B)
    # choices_B <- read.csv(paste0(getwd(),"/docs/datasets/", input$A, "/imgs.csv"), sep=";")
    choices_B_dec <- paste0(choices_B$idf, ".", choices_B$site, "_", choices_B$decor)
    updateSelectInput(session, "B", choices = choices_B_dec)
  })
  output$plot <- renderPlot({
    a.idf <- as.numeric(unlist(strsplit(input$B,"\\."))[1])
    dataDir <- paste0(datasets.path, input$A)
    df <- read.csv(paste0(dataDir, "/imgs.csv"), sep=";")
    # Decoration to be plotted
    site <- df[a.idf, "site"]
    decor <- df[a.idf, "decor"]
    ## Read nodes, edges, and decorations
    # nodes
    if ("nds" %in% input$D){
      nds.df <- read_nds(site, decor, dataDir, format = "shp")
    } else {nds.df <- NULL}
    # edges
    if ("eds" %in% input$D){
      eds.df <- read_eds(site, decor, dataDir, format = "shp")
    } else {eds.df <- NULL}
    imgs <- read.table(paste0(dataDir, "/imgs.tsv"),
                       sep="\t", stringsAsFactors = FALSE, header = T)
    # Save the plot of nodes and edges with node variable "type" as labels
    # in png image format and return the image file name.
    plot_dec_grph(nds.df,
                  eds.df,
                  imgs,
                  site, decor,
                  dir = dataDir,
                  nd.var = input$C)
  })
  # the dfs
  output$nodes <- renderTable({
    a.idf <- as.numeric(unlist(strsplit(input$B,"\\."))[1])
    dataDir <- paste0(datasets.path, input$A)
    df <- read.csv(paste0(dataDir, "/imgs.csv"), sep=";")
    # Decoration to be plotted
    site <- df[a.idf, "site"]
    decor <- df[a.idf, "decor"]
    nds.df <- read_nds(site, decor, dataDir, format = "shp")
    # eds.df <- read_eds(site, decor, dataDir, format = "shp")
    select.nds <- c("site", "decor", "id", "type", "x", "y")
    # select.eds <- c("site", "decor", "a", "b", "type", "xa", "ya", "xb", "yb")
    nds.df[ , select.nds]
  })
  output$edges <- renderTable({
    a.idf <- as.numeric(unlist(strsplit(input$B,"\\."))[1])
    dataDir <- paste0(datasets.path, input$A)
    df <- read.csv(paste0(dataDir, "/imgs.csv"), sep=";")
    # Decoration to be plotted
    site <- df[a.idf, "site"]
    decor <- df[a.idf, "decor"]
    # nds.df <- read_nds(site, decor, dataDir, format = "shp")
    eds.df <- read_eds(site, decor, dataDir, format = "shp")
    # select.nds <- c("site", "decor", "id", "type", "x", "y")
    select.eds <- c("site", "decor", "a", "b", "type", "xa", "ya", "xb", "yb")
    eds.df[ , select.eds]
  })
}

shinyApp(ui, server)
