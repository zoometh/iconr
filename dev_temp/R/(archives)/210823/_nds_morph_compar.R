#' @name nds_morph_compar
#' @title convert JPG to morphometrics files
#'
#' @param dataDir path of the folder storing folders of all decorations
#' @param out.dir path of the output folder, by default dataDir/_out
#'
#'

library(Momocs)

nds_morph_compar <- function(nodes, focus = c("stack", "PCA"), dir.out = getwd()){
  # TODO: include LINES
  nodes <- nodes[grep("POLYGON", nodes$wkt, value=F), ] # filter
  types.folders <- unique(nodes$type)
  for(a.ug.type.name in types.folders){
    # a.ug.type.name <- "visage"
    # read JPG
    print(paste0("* read '", a.ug.type.name,"' typo"))
    jpgs <- list.files(paste0(dir.out, a.ug.type.name), full.names=TRUE)
    coo <- Momocs::import_jpg(jpgs)
    min.len <- min(lengths(coo))/2
    # reduce nb of points to the lower value for outlines analysis
    for(i in 1:length(coo)){
      a.df <- as.data.frame(coo[i])
      ordered.sample <- sort(sample(nrow(a.df), min.len))
      a.df.sample <- a.df[ordered.sample, ]
      a.mat.sample <- cbind(a.df.sample[ , 1], a.df.sample[ , 2])
      coo[i] <- list(a.mat.sample)
    }
    a.ug.type <- Out(coo)
    focus <- focus[1]
    if(focus == "stack"){
      # export
      png(paste0(dir.out, a.ug.type.name, ".png"),
          width = 7, height = 7, units = "cm", res = 300)
      stack(a.ug.type,
            title = a.ug.type.name)
      dev.off()
    }
    # fgProcrustes(a.ug.type) %>%  stack(title = a.ug.type.name)
    # bot.f <- efourier(a.ug.type, nb.h = 20)
    # bot.p <- PCA(bot.f)
    # plot(bot.p)
  }
}

# out.folder <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/"
# dir.out <- paste0(out.folder,"toCompare/toAnalyse/")
# nodes <- read.csv(paste0(out.folder, "toCompare/nodes.csv"), sep = ";")
# nds_morph_compar(nodes, focus  = "stack", dir.out)
