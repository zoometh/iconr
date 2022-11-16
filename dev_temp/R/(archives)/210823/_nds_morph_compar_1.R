#' @name nds_morph_compar
#' @title convert JPG to morphometrics files
#'
#' @param nodes dataframe of nodes
#' @param focus 'stack' or PCA
#' @param nb.h number of harmonics, by default = 15, uniquely for PCA
#'

library(Momocs)

nds_morph_compar <- function(nodes, focus = c("stack", "PCA"), nb.h = 15, out.dir = getwd()){
  # TODO: include LINES, do PCA
  # focus  = "stack"; out.dir
  nodes <- nodes[grep("POLYGON", nodes$geometry, value=F), ] # filter
  types.folders <- unique(nodes$type)
  for(a.ug.type.name in types.folders){
    # a.ug.type.name <- "oeil"
    # read JPG
    print(paste0("* read '", a.ug.type.name,"' typo"))
    jpgs <- list.files(paste0(out.dir, "/", a.ug.type.name), full.names=TRUE)
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
    # focus <- focus[1]
    if(focus == "stack"){
      # export
      out.d <- paste0(out.dir, "/", a.ug.type.name, "_stack.png")
      png(out.d,
          width = 7, height = 7, units = "cm", res = 300)
      stack(a.ug.type,
            title = a.ug.type.name)
      dev.off()
      print(out.d)
    }
    # fgProcrustes(a.ug.type) %>%  stack(title = a.ug.type.name)
    # bot.f <- efourier(a.ug.type, nb.h = 20)
    # bot.p <- PCA(bot.f)
    # plot(bot.p)
  }
}

# out.folder <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/"
# out.dir <- paste0(out.folder,"toCompare/toAnalyse/")
# nodes <- read.csv(paste0(out.folder, "toCompare/nodes.csv"), sep = ";")
# nds_morph_compar(nodes, focus  = "stack", out.dir)
