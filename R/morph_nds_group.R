#' Morphometrics classification between GUs
#'
#' @name morph_nds_group
#'
#' @description Momocs package morphometrics classification (groups) between different graphical units (GUs). Read JPG files from each different folder. Useful after comparisons (see, 'morph_nds_compar' function)
#'
#' @param nodes Dataframe of nodes.
#' @param gu.types Classes of nodes that will be clustered, a vector of characters or a character. By default "all".
#' @param nb.h Number of Fourier harmonics, uniquely for PCA. By default = 15.
#' @param focus Type of grouping, Kmeans ("kmeans"). By default, c("kmeans").
#' @param nb.centers Number of clusters, uniquely for Kmeans. By default 1 (unique cluster).
#' @param cex Size of the text, by default 1.
#' @param lwd Width of the dendrogram branches, by defaul 1.
#' @param dataDir Path to the folder.
#' @param out.dir Name of output folder.
#' @param out.data Type of data returned. If "mbrshp" return a dataframe of nodes with their clustering and image path. If "plot" return a "kmeans" or create a plot. By default c("mbrshp", "plot").
#' @param verbose if TRUE (by default), verbose.
#'
#' @return Depending on the focus, creates plots (ex: Kmeans ("kmeans")), print their complete paths, return the Kmeans membership in a dataframe.
#'
#' @examples
#'
#' dataDir <- system.file("extdata", package = "iconr")
#' nd.df.path <- conv_shp_to_wkt(dataDir = dataDir)
#' nodes <- read.csv(nd.df.path, sep = ";")
#' conv_wkt_to_jpg(nodes = nodes)
#'
#' morph_nds_group(nodes)
#'
#' ## [1] "* read 'oeil' typo"
#' ## Extracting 10.jpg outlines...
#' ## [ 1 / 10 ]  Ain Ghazal.stat_2.1.jpg
#' ## ...
#' ## [ 10 / 10 ]  Qarassa.figurine__wx.14.jpg
#'
#' @export
morph_nds_group <- function(nodes = NA,
                            gu.types = "all",
                            focus = c("kmeans"),
                            nb.h = 15,
                            nb.centers = 1,
                            cex = 4,
                            lwd = 1.5,
                            dataDir = system.file("extdata", package = "iconr"),
                            out.dir = "_out",
                            out.data = c("mbrshp", "plot"),
                            verbose = TRUE){
  `%>%` <- dplyr::`%>%`
  out.dirPath <- paste0(dataDir, "/", out.dir)
  # TODO: not escape when different GUs (return)
  # TODO: include LINES
  # focus  = "clust" ; out.dirPath ; gu.types = "bouche"
  # nodes, gu.types = "oeil", focus  = "clust", out.dirPath = out.dirPath
  # if(!("idf" %in% colnames(nodes))){
  nodes$idf <- paste0(nodes$site, ".", nodes$decor, ".", nodes$id)
  # }
  # nodes$abb <- paste0(abbreviate(nodes$site), ".", abbreviate(nodes$decor))
  nodes.sel <- nodes[grep("POLYGON", nodes$geometry, value=F), ] # filter
  fac <- tibble::as_tibble(nodes.sel[ , c("site", "decor", "type", "idf")]) # attributes
  # fac$idf <- paste0(fac$site, ".", fac$decor)
  # colors
  nb.cols <- length(unique(fac$idf))
  Wi <- nb.cols
  He <- ceiling(nb.cols/1.5)
  dec.cols <- RColorBrewer::brewer.pal(nb.cols, "Spectral")
  dec.cols <- grDevices::colorRampPalette(dec.cols)(nb.cols) # extend if needed
  fac.colors <- data.frame(idf = unique(fac$idf),
                           cols = dec.cols)
  fac <- merge(fac, fac.colors, by = "idf", all.x = TRUE)
  if(gu.types == "all"){gu.types <- unique(nodes$type)}
  # TODO: store as tibble
  lout <- list() # store results
  for(gu.type in gu.types){
    # gu.type <- "nez" ; gu.type <- "oeil" ; gu.type <- "caravanserail"
    # read JPG
    if(verbose){print(paste0("* read '", gu.type,"' typo"))}
    jpgs <- list.files(paste0(out.dirPath, "/", gu.type), full.names=TRUE)
    coo <- Momocs::import_jpg(jpgs)
    min.len <- min(lengths(coo))/2
    # reduce nb of points to the lower value for outlines analysis
    for(i in seq(1, length(coo))){
      a.df <- as.data.frame(coo[i])
      ordered.sample <- sort(sample(nrow(a.df), min.len))
      a.df.sample <- a.df[ordered.sample, ]
      a.mat.sample <- cbind(a.df.sample[ , 1], a.df.sample[ , 2])
      coo[i] <- list(a.mat.sample)
    }
    fac.type <- fac[fac$type == gu.type, ]
    fac.type$idf <- as.factor(fac.type$idf)
    # fac.type$idf <- as.factor(fac.type$abb)
    a.gu.type <- Momocs::Out(coo, fac.type)
    # ef.type <- Momocs::efourier(a.gu.type, nb.h = nb.h)
    # PCA.type <- Momocs::PCA(ef.type)
    PCA.type <- a.gu.type %>%
      Momocs::efourier(nb.h,
               norm = TRUE) %>%
      Momocs::PCA
    # TODO: return this PCA list?
    lout[[length(lout) + 1]] <- PCA.type
    # plot_PCA(PCA.type, labelgroups  = T)
    ## export
    # if("clust" %in% focus){
    #   # panel
    #   if(verbose){print(paste0("Clust..."))}
    #   out.d <- paste0(out.dirPath, "/", gu.type, "_group_clust.png")
    #   grDevices::png(out.d,
    #                  width = Wi + 10,
    #                  height = He + 2,
    #                  units = "cm",
    #                  res = 300)
    #   # par(omi = c(0, 0, 0, 10), mar=c(10, 0, 0, 10))
    #   print(
    #     clust <- Momocs::CLUST(PCA.type,
    #                            ~idf,
    #                            lwd = lwd,
    #                            cex = cex)
    #   ) # + theme(plot.margin = unit(c(0,3,0,0), "cm"))
    #   grDevices::dev.off()
    #   # return(clust)
    # }
    if("kmeans" %in% focus){
      # nb.centers = 3
      print(paste0("kmeans..."))
      if("plot" %in% out.data){
        out.d <- paste0(out.dirPath, "/", gu.type, "_group_kmeans.png")
        grDevices::png(out.d,
                       width = Wi, height = He, units = "cm", res = 300)
        print(
          kmean <- Momocs::KMEANS(PCA.type,
                                  centers = nb.centers)
        )
        grDevices::dev.off()
        # return(Momocs::KMEANS(PCA.type,
        #                       centers = nb.centers)
        #        )
      }
      if("mbrshp" %in% out.data){
        kmean <- Momocs::KMEANS(PCA.type,
                                centers = nb.centers)
        mbrshps <- kmean$cluster
        df.mbrshp <- data.frame(idf = names(mbrshps),
                                gu.type = gu.type,
                                cluster = as.character(mbrshps),
                                # TODO: adapt to different device (.png, ...)
                                image = paste0(out.dirPath, "/", gu.type, "/", names(mbrshps), ".jpg"))        # return(df.mbrshp)
      }
    }
  }
  return(df.mbrshp)
}
