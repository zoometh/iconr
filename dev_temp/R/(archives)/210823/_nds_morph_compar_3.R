#' @name nds_morph_compar
#' @title morphometrics comparisons. Read jpg files from each different folder
#'
#' @param nodes dataframe of nodes
#' @param focus 'panel', 'stack', 'PCA'
#' @param nb.h number of harmonics, by default = 15, uniquely for PCA
#' @param out.dir name of output folder

library(Momocs)

nds_morph_compar <- function(nodes, focus = c("panel", "stack", "PCA"),
                             nb.h = 15, out.dir = getwd()){
  # TODO: include LINES
  # focus  = "PCA"; out.dir
  nodes$idf <- paste0(nodes$site, ".", nodes$decor)
  nodes <- nodes[grep("POLYGON", nodes$geometry, value=F), ] # filter
  fac <- tibble::as_tibble(nodes[, c("site", "decor", "type", "idf")]) # attributes
  # fac$idf <- paste0(fac$site, ".", fac$decor)
  # colors
  nb.cols <- length(unique(fac$idf))
  Wi <- nb.cols ; He <- ceiling(nb.cols/1.5)
  dec.cols <- RColorBrewer::brewer.pal(nb.cols, "Spectral")
  dec.cols <- colorRampPalette(dec.cols)(nb.cols) # extend if needed
  fac.colors <- data.frame(idf = unique(fac$idf),
                           cols = dec.cols)
  fac <- merge(fac, fac.colors, by = "idf", all.x = TRUE)
  types.folders <- unique(nodes$type)
  for(a.ug.type.name in types.folders){
    # a.ug.type.name <- "nez" ; a.ug.type.name <- "oeil"
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
    fac.type <- fac[fac$type == a.ug.type.name, ]
    fac.type$idf <- as.factor(fac.type$idf)
    a.ug.type <- Out(coo, fac.type)
    ## export
    if("panel" %in% focus){
      # panel
      print(paste0("Panel..."))
      out.d <- paste0(out.dir, "/", a.ug.type.name, "_panel.png")
      png(out.d,
          width = Wi+2, height = He+2, units = "cm", res = 300)
      # panel(a.ug.type, fac="idf", names=TRUE, palette = col_spring)
      panel(a.ug.type,
            # fac = "idf",
            main = a.ug.type.name,
            names = TRUE,
            # abbreviate.labelspoints = TRUE,
            # cex.names = 1,
            borders = a.ug.type$fac$cols,
            cols = a.ug.type$fac$cols,
            # points = TRUE,
            labelspoints = TRUE,
            col.labelspoints = a.ug.type$fac$cols,
            cex.labelspoints = .6)
      dev.off()
      print(paste0("panel ", out.d))
    }
    # focus <- focus[1]
    if("stack" %in% focus){
      # export
      print(paste0("Stack..."))
      out.d <- paste0(out.dir, "/", a.ug.type.name, "_stack.png")
      png(out.d,
          width = Wi, height = He, units = "cm", res = 300)
      stack(a.ug.type,
            title = a.ug.type.name,
            borders = a.ug.type$fac$cols
      )
      dev.off()
      print(paste0("stack ", out.d))
    }
    if("PCA" %in% focus){
      # export
      if(length(jpgs) > 1){
        # need 2 features at least for PCA
        print(paste0("PCA..."))
        out.d <- paste0(out.dir, "/", a.ug.type.name, "_PCA.png")
        png(out.d,
            width = Wi, height = He, units = "cm", res = 300)
        ef.type <- efourier(a.ug.type, nb.h=10)
        PCA.type <- PCA(ef.type)
        # plot(PCA.type, "idf")
        plot(PCA.type,
             title = a.ug.type.name,
             col = PCA.type$fac$cols,
             cex = 2,
             labelspoints = TRUE,
             zoom = .9, # to avoid marginal cuts
             # col.labelspoints = PCA.type$fac$cols,
             cex.labelspoints = 1
        )
        dev.off()
        print(paste0("PCA ", out.d))
      }
    }
  }
}
