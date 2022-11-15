#' Morphometrics comparisons between GUs
#'
#' @name morph_nds_compar
#'
#' @description Momocs package morphometrics comparisons between different graphical units (GUs). Read JPG files from each different folder. This function is used after converting the geometries to JPG using 'conv_wkt_to_jpg()'. This function is useful before grouping (see, 'morph_nds_group' function) to determine the number of clusters.
#'
#' @param nodes Dataframe of nodes.
#' @param ids the field names that constitute the unique key of the GU. By default: c("site", "decor", "id").
#' @param focus Type of analysis: 'panel', 'stack', 'PCA' (Pricnipal Component Analysis), 'clust' (hierachical clustering, 'dist' (distance matrix) or 'all'. The option 'dist' allows the calculation of the distance matrix which can be used in 'morph_aggregate()'. By default 'all'.
#' @param nb.h Number of Fourier harmonics, uniquely for PCA. By default = 15.
#' @param stack.norm For the Momocs stack, whether if the GU have to be "normalized" (i.e. centered and scaled), "centered", "scaled", "not centered nor scaled". By default "normalized".
#' @param colored if TRUE (by default), will color on 'ids' (unique identifiants/keys).
#' @param cex Size of the text, by default 1.
#' @param lwd Width of the dendrogram branches, by defaul 1.
#' @param dataDir Path to the folder.
#' @param out.dir Name of output folder.
#' @param verbose if TRUE (by default), verbose.
#'
#' @return Depending on the focus, return 'panel', 'stack' or 'PCA' plots with their complete path
#'
#' @examples
#'
#' dataDir <- system.file("extdata", package = "iconr")
#' nd.df.path <- conv_shp_to_wkt(dataDir = dataDir)
#' nodes <- read.csv(nd.df.path, sep = ";")
#' conv_wkt_to_jpg(nodes = nodes)
#'
#' # create PNG with panels
#' morph_nds_compar(nodes, focus = c("panel"))
#'
#' ## [1] "* read 'oeil' type of UGs"
#' ## Extracting 10.jpg outlines...
#' ## [ 1 / 10 ]  Ain Ghazal.stat_2.1.jpg
#' ## ...
#' ## [ 10 / 10 ]  Qarassa.figurine__wx.14.jpg
#'
#' # Distance matrices
#' ldist <- morph_nds_compar(nodes, focus = c("dist"))
#'
#' @export
morph_nds_compar <- function(nodes = NA,
                             ids = c("site", "decor", "id"),
                             focus = c("all"),
                             nb.h = 15,
                             stack.norm = "normalized",
                             colored = TRUE,
                             cex = 1,
                             lwd = 1,
                             dataDir = system.file("extdata", package = "iconr"),
                             out.dir = "_out",
                             verbose = TRUE){
  out.dirPath <- paste0(dataDir, "/", out.dir)
  # TODO: include LINES
  # focus  = "panel"; out.dirPath ; merge.by = "type"
  if(length(ids) == 1){
    keys <- as.character(nodes[ , ids])
  } else {
    keys <- as.character(apply(nodes[ , ids], 1, paste, collapse="."))
  }
  nodes$idf <- keys
  # nodes$idf <- paste0(nodes$site, ".", nodes$decor) # useful ?
  # nodes$abb <- paste0(abbreviate(nodes$site, 3), ".",
  #                     abbreviate(nodes$decor, 3), ".",
  #                     nodes$id)
  # nodes$idf <- nodes$abb
  nodes <- nodes[grep("POLYGON", nodes$geometry, value = F), ] # filter on Polygons
  fac <- tibble::as_tibble(nodes[, c("site", "decor", "type", "idf")]) # attributes
  # fac$idf <- paste0(fac$site, ".", fac$decor)
  # colors
  nb.cols <- length(unique(fac$idf)) # color on objects
  Wi <- nb.cols + 4
  He <- ceiling(nb.cols/1.5) + 4
  # colored
  if(colored){
    dec.cols <- RColorBrewer::brewer.pal(nb.cols, "Set1")
    dec.cols <- grDevices::colorRampPalette(dec.cols)(nb.cols) # extend if needed
    fac.colors <- data.frame(idf = unique(fac$idf),
                             cols = dec.cols)
    fac <- merge(fac, fac.colors, by = "idf", all.x = TRUE)
  }
  gu.types <- unique(nodes$type)
  ldist <- list() # if "dist"
  for(gu.type in gu.types){
    # gu.type <- "sourcil" ; gu.type <- "oeil"
    # gu.type <- "caravanserail"
    # read JPG
    if(verbose){print(paste0("* read '", gu.type,"' type of UGs"))}
    jpgs <- list.files(paste0(out.dirPath, "/", gu.type), full.names = TRUE)
    coo <- Momocs::import_jpg(jpgs)
    fac.type <- fac[fac$type == gu.type, ]
    fac.type$idf <- as.factor(fac.type$idf)
    # fac.type$abb <- as.factor(fac.type$abb)
    a.gu.type <- Momocs::Out(coo, fac.type)
    ## export
    if("panel" %in% focus | "all" %in% focus){
      if(verbose){print(paste0("Panel..."))}
      out.d <- paste0(out.dirPath, "/", gu.type, "_compar_panel.png")
      grDevices::png(out.d,
                     width = Wi + 2,
                     height = He + 2,
                     units = "cm",
                     res = 300)
      # panel(a.gu.type, fac="idf", names=TRUE, palette = col_spring)
      if(colored){
        Momocs::panel(a.gu.type,
                      # fac = "idf",
                      # fac = "abb",
                      main = gu.type,
                      names = TRUE,
                      # abbreviate.labelspoints = FALSE,
                      # cex.names = 1,
                      borders = a.gu.type$fac$cols,
                      cols = a.gu.type$fac$cols
                      # points = TRUE,
                      # labelspoints = TRUE,
                      # col.labelspoints = a.gu.type$fac$cols,
                      # cex.labelspoints = 1
        )
      }
      if(!colored){
        Momocs::panel(a.gu.type,
                      main = gu.type,
                      names = TRUE
        )
      }
      grDevices::dev.off()
      if(verbose){print(paste0("  - panel exported in: '", out.d, "'"))}
    }
    # focus <- focus[1]
    if("stack" %in% focus | "all" %in% focus){
      # export
      if(verbose){print(paste0("Stack..."))}
      out.d <- paste0(out.dirPath, "/", gu.type, "_compar_stack.png")
      grDevices::png(out.d,
                     width = Wi, height = He,
                     units = "cm", res = 300)
      # Error: 'stack' is not an exported object from 'namespace:Momocs'
      # Momocs::stack(a.gu.type,
      #               title = gu.type,
      #               borders = a.gu.type$fac$cols
      # )

      # stack(a.gu.type,
      #       title = gu.type,
      #       borders = a.gu.type$fac$cols
      # )
      # stack type
      if (stack.norm == "normalized") {
        if(verbose){print(paste0("     ...run 'normalized'"))}
        a.stack <- a.gu.type %>%
          coo_center %>%
          coo_scale %>%
          coo_slidedirection("up")
      }
      if (stack.norm == "centered") {
        if(verbose){print(paste0("     ...run 'center'"))}
        a.stack <- a.gu.type %>%
          coo_center %>%
          coo_slidedirection("up")
      }
      if (stack.norm == "scaled") {
        if(verbose){print(paste0("     ...run 'scaled'"))}
        a.stack <- a.gu.type %>%
          coo_scale %>%
          coo_slidedirection("up")
      }
      if (stack.norm == "not centered nor scaled") {
        if(verbose){print(paste0("     ...run 'not centered nor scaled'"))}
        a.stack <- a.gu.type %>%
          coo_slidedirection("up")
      }
      # colors
      if(verbose){print(paste0("     ... deals with/out colors"))}
      if(colored){
        a.stack %T>%
          print() %>%
          stack(borders = a.gu.type$fac$cols)
      }
      if(!colored){
        a.stack %T>%
          print() %>%
          stack()
      }
      grDevices::dev.off()
      if(verbose){print(paste0("stack plot: ", out.d))}
    }
    if("PCA" %in% focus | "all" %in% focus){
      # export
      if(length(jpgs) > 1){
        # need 2 features at least for PCA
        if(verbose){print(paste0("PCA..."))}
        out.d <- paste0(out.dirPath, "/", gu.type, "_compar_PCA.png")
        grDevices::png(out.d,
                       width = Wi, height = He, units = "cm", res = 300)
        PCA.type <- a.gu.type %>%
          efourier(nb.h,
                   norm = TRUE) %>%
          PCA
        plot_PCA(PCA.type)
        # ef.type <- Momocs::efourier(a.gu.type, nb.h = nb.h)
        # PCA.type <- Momocs::PCA(ef.type)
        # plot(PCA.type, "idf")
        # va être déprécié
        # if(colored){
        #   plot_PCA(PCA.type,
        #            # fac = "abb",
        #            title = gu.type,
        #            col = PCA.type$fac$cols,
        #            labelspoints = TRUE,
        #            points = TRUE,
        #            cex = cex,
        #            # cex.points = .3,
        #            # abbreviate.labelspoints = TRUE,
        #            # zoom = .9, # to avoid marginal cuts
        #            # col.labelspoints = PCA.type$fac$cols,
        #            cex.labelspoints = 1
        #   )
        # }
        # if(!colored){
        #   Momocs::plot_PCA(PCA.type,
        #            title = gu.type,
        #            # labelspoints = TRUE,
        #            points = TRUE
        #            # cex = cex,
        #            # cex.labelspoints = 1
        #   )
        # }
        grDevices::dev.off()
        if(verbose){print(paste0("PCA plot: ", out.d))}
      }
    }
    if("clust" %in% focus | "all" %in% focus){
      # panel
      if(verbose){print(paste0("clust..."))}
      out.d <- paste0(out.dirPath, "/", gu.type, "_group_clust.png")
      grDevices::png(out.d,
                     width = Wi + 10,
                     height = He + 2,
                     units = "cm",
                     res = 300)
      # par(omi = c(0, 0, 0, 10), mar=c(10, 0, 0, 10))
      print(
        clust <- Momocs::CLUST(PCA.type,
                               ~idf,
                               lwd = lwd,
                               cex = cex)
      ) # + theme(plot.margin = unit(c(0,3,0,0), "cm"))
      grDevices::dev.off()
      # return(clust)
      if(verbose){print(paste0("Clust "))}
    }
    if("dist" %in% focus | "all" %in% focus){
      # export
      if(length(jpgs) > 1){
        # need 2 features at least for PCA
        if(verbose){print(paste0("dist..."))}
        res.f <- Momocs::efourier(a.gu.type,
                                  norm = TRUE,
                                  nb.h = nb.h)
        res.MDS <- Momocs::MDS(res.f)
        a.dist <- stats::dist(res.MDS$x,
                              diag = T,
                              upper = T)
        ldist[[length(ldist) + 1]] <- a.dist
        if(verbose){print(paste0("Dist "))}
      }
    }
  }
  if("dist" %in% focus | "all" %in% focus){
    return(ldist)}
}
