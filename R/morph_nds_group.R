#' Morphometrics classification between GUs
#' @name morph_nds_group
#'
#' @description Morphometrics classification (groups) between different graphical units (GUs).
#'  Read jpg files from each different folder. Useful after comparisons (see, morph_nds_compar)
#'
#' @param nodes Dataframe of nodes
#' @param focus Type of grouping, hierachical clustering ("clust") or Kmeans ("kmeans").
#' By default, c("clust", "kmeans")
#' @param gu.types classes of nodes that will be clustered, a vector of characters or a character.
#' By default "all"
#' @param nb.centers number of clusters, uniquely for Kmeans. By default 1 (unique cluster)
#' @param out.dir name of output folder
#' @param out.data Type of data returned.
#' If "mbrshp" return a dataframe of nodes with their clustering and image path.
#' If "plot" return a "kmeans" or create a plot. By default c("mbrshp", "plot")

# library(Momocs)

morph_nds_group <- function(nodes,
                              focus = c("clust", "kmeans"),
                              gu.types = "all",
                              nb.centers = 1,
                              out.dir = getwd(),
                              out.data = c("mbrshp", "plot")){
  # TODO: not escape when different GUs (return)
  # TODO: include LINES
  # focus  = "clust" ; out.dir ; gu.types = "bouche"
  # nodes, gu.types = "oeil", focus  = "clust", out.dir = out.dir
  nodes$idf <- paste0(nodes$site, ".", nodes$decor, ".", nodes$id)
  # nodes$abb <- paste0(abbreviate(nodes$site), ".", abbreviate(nodes$decor))
  nodes.sel <- nodes[grep("POLYGON", nodes$geometry, value=F), ] # filter
  fac <- tibble::as_tibble(nodes.sel[, c("site", "decor", "type", "idf")]) # attributes
  # fac$idf <- paste0(fac$site, ".", fac$decor)
  # colors
  nb.cols <- length(unique(fac$idf))
  Wi <- nb.cols ; He <- ceiling(nb.cols/1.5)
  dec.cols <- RColorBrewer::brewer.pal(nb.cols, "Spectral")
  dec.cols <- grDevices::colorRampPalette(dec.cols)(nb.cols) # extend if needed
  fac.colors <- data.frame(idf = unique(fac$idf),
                           cols = dec.cols)
  fac <- merge(fac, fac.colors, by = "idf", all.x = TRUE)
  if(gu.types == "all"){gu.types <- unique(nodes$type)}
  # TODO: store as tibble
  lout <- list() # stoe results
  for(gu.type in gu.types){
    # gu.type <- "nez" ; gu.type <- "oeil"
    # read JPG
    print(paste0("* read '", gu.type,"' typo"))
    print(paste0(out.dir, "/", gu.type))
    jpgs <- list.files(paste0(out.dir, "/", gu.type), full.names=TRUE)
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
    fac.type <- fac[fac$type == gu.type, ]
    fac.type$idf <- as.factor(fac.type$idf)
    # fac.type$idf <- as.factor(fac.type$abb)
    a.ug.type <- Momocs::Out(coo, fac.type)
    ef.type <- Momocs::efourier(a.ug.type, nb.h=10)
    PCA.type <- Momocs::PCA(ef.type)
    # plot_PCA(PCA.type, labelgroups  = T)
    ## export
    if("clust" %in% focus){
      # panel
      print(paste0("Clust..."))
      out.d <- paste0(out.dir, "/", gu.type, "_group_clust.png")
      grDevices::png(out.d,
          width = Wi+10, height = He, units = "cm", res = 300)
      print(
        clust <- Momocs::CLUST(PCA.type, ~idf)
      ) # + theme(plot.margin = unit(c(0,3,0,0), "cm"))
      grDevices::dev.off()
      lout[[length(lout)+1]] <- clust
      # return(clust)
    }
    if("kmeans" %in% focus){
      # nb.centers = 3
      print(paste0("kmeans..."))
      if("plot" %in% out.data){
        out.d <- paste0(out.dir, "/", gu.type, "_group_kmeans.png")
        grDevices::png(out.d,
            width = Wi, height = He, units = "cm", res = 300)
        print(
          kmean <- Momocs::KMEANS(PCA.type, centers = nb.centers)
        )
        grDevices::dev.off()
        lout[[length(lout)+1]] <- Momocs::KMEANS(PCA.type,
                                                 centers = nb.centers)
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
                                image = paste0(out.dir, "/", gu.type, "/", names(mbrshps), ".jpg"))
        lout[[length(lout)+1]] <- df.mbrshp
        # return(df.mbrshp)
      }
    }
  }
}
