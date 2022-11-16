#' @name nds_morph_classif
#' @title morphometrics classification
#'
#' @param nodes dataframe of nodes
#' @param focus c("clust", "kmeans")
#' @param gu.types classes of nodes that will be clustered, by default "all", a vector of characters or a character
#' return a named list of nodes and their clustering
#' @param nb.centers number of clusters, uniquely for Kmeans
#' @param out.dir name of output folder

library(Momocs)

nds_morph_classif <- function(nodes, focus = c("clust", "kmeans"),
                              gu.types = "all",
                              nb.centers = NA,
                              out.dir = getwd(),
                              out.data = c("mbrshp", "plot")){
  # TODO: include LINES
  # focus  = "clust"; out.dir ; gu.types = "oeil"
  # nodes, gu.types = "oeil", focus  = "clust", out.dir = out.dir
  nodes$idf <- paste0(nodes$site, ".", nodes$decor)
  # nodes$abb <- paste0(abbreviate(nodes$site), ".", abbreviate(nodes$decor))
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
  if(gu.types == "all"){gu.types <- unique(nodes$type)}
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
    a.ug.type <- Out(coo, fac.type)
    ## export
    if("clust" %in% focus){
      # panel
      print(paste0("Clust..."))
      out.d <- paste0(out.dir, "/", gu.type, "_clust.png")
      png(out.d,
          width = Wi+10, height = He, units = "cm", res = 300)
      # par(mar=c(1,1,1,20))
      ef.type <- efourier(a.ug.type, nb.h=10)
      PCA.type <- Momocs::PCA(ef.type)
      print(
        CLUST(PCA.type, ~idf)
      ) # + theme(plot.margin = unit(c(0,3,0,0), "cm"))
      dev.off()
      print(paste0("clust ", out.d))
    }
    # focus <- focus[1]
    if("kmeans" %in% focus){
      # nb.centers = 3
      print(paste0("kmeans..."))
      if(out.data == "plot"){
        out.d <- paste0(out.dir, "/", gu.type, "_kmeans.png")
        png(out.d,
            width = Wi, height = He, units = "cm", res = 300)
        ef.type <- efourier(a.ug.type, nb.h=10)
        PCA.type <- Momocs::PCA(ef.type)
        print(
          kmean <- KMEANS(PCA.type, centers = nb.centers)
        )
        dev.off()
        return(kmean)
      }
      if(out.data == "mbrshp"){
        return(kmean$cluster)
      }
    }
  }
}
