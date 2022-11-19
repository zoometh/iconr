# Pie chart

library(plotly)
library(htmlwidgets)
library(rstudioapi)
library(DescTools)

graves <- read.csv("https://raw.githubusercontent.com/keltoskytoi/Multivariate_Statistics_Szentloerinc/master/DATA/Grave_Artefacts_GO_all.csv", row.names = 1)
graves.goods <- as.data.frame(colSums(graves))
names(graves.goods) <- "sum"
graves.goods$perc <- round((graves.goods$sum/sum(graves.goods$sum))*100, 1)

fig <- plot_ly(graves.goods, 
        labels = rownames(graves.goods),
        values = ~perc,
        type = 'pie'
        # text = paste0(rownames(graves.goods), "\n",
        #               graves.goods$sum),
        # hoverinfo = 'text'
) %>% 
  layout(title = "Szentloerinc's cemetery graves content",
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
fig
dirOut <- SplitPath(getSourceEditorContext()$path)$dirname
saveWidget(fig, paste0(dirOut, "index.html"))

