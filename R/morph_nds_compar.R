#' Morphometrics comparisons between GUs
#' @name morph_nds_compar
#'
#' @description Momocs package morphometrics comparisons between different graphical units (GUs).
#'  Read jpg files from each different folder. Useful before grouping (see, morph_nds_group)
#'  to determine the number of clusters
#'
#' @param nodes Dataframe of nodes
#' @param focus Type of analysis: 'panel', 'stack' or 'PCA'. By default c("panel", "stack", "PCA")
#' @param nb.h number of Fourier harmonics, uniquely for PCA. By default = 15
#' @param out.dir path of the output folder. By default "_out/" in the "dataDir" folder
#' @return Depending on the focus, return 'panel', 'stack' or 'PCA' plots with their complete path
#' @examples
#' morph_nds_compar(nodes)
#'
#' ## [1] "* read 'oeil' type of UGs"
#' ## Extracting 10.jpg outlines...
#' ## [ 1 / 10 ]  Ain Ghazal.stat_2.1.jpg
#' ## ...
#' ## [ 10 / 10 ]  Qarassa.figurine__wx.14.jpg

morph_nds_compar <- function(nodes,
                             focus = c("panel", "stack", "PCA"),
                             nb.h = 15,
                             out.dir = "_out"){
  out.dirPath <- paste0(dataDir, "/", out.dir)
  # TODO: include LINES
  # focus  = "panel"; out.dirPath ; merge.by = "type"
  nodes$idf <- paste0(nodes$site, ".", nodes$decor) # useful ?
  nodes$abb <- paste0(abbreviate(nodes$site, 3), ".",
                      abbreviate(nodes$decor, 3), ".",
                      nodes$id)
  nodes <- nodes[grep("POLYGON", nodes$geometry, value = F), ] # filter on Polygons
  fac <- tibble::as_tibble(nodes[, c("site", "decor", "type", "idf")]) # attributes
  # fac$idf <- paste0(fac$site, ".", fac$decor)
  # colors
  nb.cols <- length(unique(fac$idf)) # color on objects
  Wi <- nb.cols + 5
  He <- ceiling(nb.cols/1.5) + 5
  dec.cols <- RColorBrewer::brewer.pal(nb.cols, "Spectral")
  dec.cols <- grDevices::colorRampPalette(dec.cols)(nb.cols) # extend if needed
  fac.colors <- data.frame(idf = unique(fac$idf),
                           cols = dec.cols)
  fac <- merge(fac, fac.colors, by = "idf", all.x = TRUE)
  types.folders <- unique(nodes$type)
  for(a.gu.type.name in types.folders){
    # a.gu.type.name <- "sourcil" ; a.gu.type.name <- "oeil"
    # read JPG
    print(paste0("* read '", a.gu.type.name,"' type of UGs"))
    jpgs <- list.files(paste0(out.dirPath, "/", a.gu.type.name), full.names = TRUE)
    coo <- Momocs::import_jpg(jpgs)
    fac.type <- fac[fac$type == a.gu.type.name, ]
    fac.type$idf <- as.factor(fac.type$idf)
    # fac.type$abb <- as.factor(fac.type$abb)
    a.gu.type <- Momocs::Out(coo, fac.type)
    ## export
    if("panel" %in% focus){
      print(paste0("Panel..."))
      out.d <- paste0(out.dirPath, "/", a.gu.type.name, "_compar_panel.png")
      grDevices::png(out.d,
                     width = Wi+2, height = He+2, units = "cm", res = 300)
      # panel(a.gu.type, fac="idf", names=TRUE, palette = col_spring)
      Momocs::panel(a.gu.type,
                    # fac = "idf",
                    # fac = "abb",
                    main = a.gu.type.name,
                    names = TRUE,
                    abbreviate.labelspoints = TRUE,
                    # cex.names = 1,
                    borders = a.gu.type$fac$cols,
                    cols = a.gu.type$fac$cols,
                    # points = TRUE,
                    labelspoints = TRUE,
                    col.labelspoints = a.gu.type$fac$cols,
                    cex.labelspoints = .6)
      grDevices::dev.off()
      print(paste0("panel ", out.d))
    }
    # focus <- focus[1]
    if("stack" %in% focus){
      # export
      print(paste0("Stack..."))
      out.d <- paste0(out.dirPath, "/", a.gu.type.name, "_compar_stack.png")
      grDevices::png(out.d,
                     width = Wi, height = He, units = "cm", res = 300)
      stack(a.gu.type,
            title = a.gu.type.name,
            borders = a.gu.type$fac$cols
      )
      grDevices::dev.off()
      print(paste0("stack ", out.d))
    }
    if("PCA" %in% focus){
      # export
      if(length(jpgs) > 1){
        # need 2 features at least for PCA
        print(paste0("PCA..."))
        out.d <- paste0(out.dirPath, "/", a.gu.type.name, "_compar_PCA.png")
        grDevices::png(out.d,
                       width = Wi, height = He, units = "cm", res = 300)
        ef.type <- Momocs::efourier(a.gu.type, nb.h=10)
        PCA.type <- Momocs::PCA(ef.type)
        # plot(PCA.type, "idf")
        # va être déprécié
        plot(PCA.type,
             # fac = "abb",
             title = a.gu.type.name,
             col = PCA.type$fac$cols,
             cex = 2,
             labelspoints = TRUE,
             abbreviate.labelspoints = TRUE,
             zoom = .9, # to avoid marginal cuts
             # col.labelspoints = PCA.type$fac$cols,
             cex.labelspoints = 1
        )
        grDevices::dev.off()
        print(paste0("PCA ", out.d))
      }
    }
  }
}
