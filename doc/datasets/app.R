library(shiny)
library(iconr)

# - - - - - - - - - - - - - - - - - - - #
# the shiny app for iconr documentation #
# - - - - - - - - - - - - - - - - - - - #

famille <- c("stele bas aragon", "Valcamonica")
# setwd("..")
df <- read.csv(paste0(getwd(), "/", famille[1], "/imgs.csv"), sep=";")
def.dec <- paste0(df[1, "idf"], ".", df[1, "site"], "_", df[1, "decor"])

# datasets.path <- paste0(getwd(),"/docs/datasets")
datasets.path <- ""

ui <- fluidPage(
  sidebarPanel(
    selectInput("A", "family", choices = famille, selected = famille[1]),
    selectInput("B", "decoration", choices = def.dec),
    selectInput("C", "label", choices = c("id", "type"), selected = "type")
    ),
  mainPanel(plotOutput("plot"))
)

server <- function(input, output, session) {
  observe({
    choices_B <- read.csv(paste0("", input$A, "/imgs.csv"), sep=";")
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
    # Read nodes, edges, and decorations
    nds.df <- read_nds(site, decor, dataDir, format = "shp")
    eds.df <- read_eds(site, decor, dataDir, format = "shp")
    imgs <- read.table(paste0(dataDir, "/imgs.tsv"),
                       sep="\t", stringsAsFactors = FALSE, header = T)
    # Save the plot of nodes and edges with node variable "type" as labels
    # in png image format and return the image file name.
    plot_dec_grph(nds.df, eds.df, imgs,
                  site, decor,
                  dir = dataDir,
                  nd.var = input$C)
  })
}

shinyApp(ui, server)
