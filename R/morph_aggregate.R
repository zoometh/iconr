#' Resume geometry classes (POINTS, LINES, POLYGON) of GUs for each object
#' @name morph_aggregate
#' @description Aggregate matrices of distances by types calculating mean distances for each single types (eg., two eyes on a single face decoration) or for the whole decoration (faces, eyes, mouths, ...)
#'
#' @param nodes Nodes dataframe coming from the 'conv_shp_to_wkt.R' function
#' @param ldist A list of distance matrices coming from 'morph_nds_compar(nodes, focus = "dist")'
#' @param aggr Aggregate on GUs' types by decorations ("type") or
#' aggregate by decorations ("decoration").
#' @param dataDir path to the folder.
#' @param out.dir Path of the output folder. By default "_out/" in the "dataDir" folder
#'
#' @return Create plots dependingList of matrices.
#'
#' @examples
#'
#' @export
morph_aggregate <- function(nodes = NULL,
                            ldist = NULL,
                            aggr = c("type", "decoration"),
                            dataDir = system.file("extdata", package = "iconr"),
                            out.dir = "_out"){
  out.dirPath <- paste0(dataDir, "/", out.dir)
  # library(dplyr)
  ldist.type <- list()
  # TODO: improve title by counting number of GUs grouped
  for (a.type in 1:length(ldist)){
    # loop throught different types of ugs // matrices
    # to group each matrix by decoration
    # d1 <- unlist(ldist[[1]]) # n = 10, oeil
    # d2 <- unlist(ldist[[2]]) # n = 4, tete
    # d3 <- unlist(ldist[[3]]) # n = 5, bouche
    # write.xlsx(as.matrix(d1), paste0(dataDir, "/d1.xlsx"))
    # write.xlsx(as.matrix(d2), paste0(dataDir, "/d2.xlsx"))
    # write.xlsx(as.matrix(d3), paste0(dataDir, "/d3.xlsx"))
    # a.type <- 1
    a.type.name <- unique(nodes$type)[a.type] # TODO: improve type identification
    print(paste("*read distance matrix of ", a.type.name))
    a.dist <- unlist(ldist[[a.type]])
    df <- as.data.frame(as.matrix(a.dist))
    ldecors <- sapply(strsplit(rownames(df), "\\."), "[[", 2)
    df$dec <- ldecors
    df.agg <- stats::aggregate(df[, 1:ncol(df)-1], list(df$dec), mean)
    tdf.agg <- as.data.frame(t(df.agg))
    colnames(tdf.agg) <- tdf.agg[1, ] # colnames = decorations
    tdf.agg <- tdf.agg[-1, ]
    tdf.agg[, 1:ncol(tdf.agg)] <- sapply(tdf.agg[, 1:ncol(tdf.agg)], as.numeric) # character -> num
    # sapply(tdf.agg, class)
    ldecors <- sapply(strsplit(rownames(tdf.agg), "\\."), "[[", 2)
    tdf.agg$dec <- ldecors
    tdf.agg <- stats::aggregate(tdf.agg[, 1:ncol(tdf.agg)-1], list(tdf.agg$dec), mean)
    rownames(tdf.agg) <- tdf.agg[, 1] # rownames = decorations
    tdf.agg <- tdf.agg[ , -1]
    diag(tdf.agg) <- 0
    ldist.type[[length(ldist.type)+1]] <- tdf.agg # add to list
  }
  print("     Combined on types...")
  minx <- maxx <- miny <- maxy <- 0
  for(i in 1:length(ldist.type)){
    # MDS with min and max coordinates to normalise plots
    # i <- 1
    a.type.dist <- ldist.type[[i]]
    tit.main <- unique(nodes$type)[i] # TODO: improve type identification
    print(paste0(tit.main))
    # tit.sub <- paste0(as.character(nrow(a.dist)), " GUs")
    # ldist.type[[1]]
    # ldist.type[[2]]
    # ldist.type[[3]]
    a.dist <- stats::as.dist(ldist.type[[i]])
    a.mds <- MASS::isoMDS(a.dist) # MDS
    # get the extend (min, max) of the plot
    min.x <- min(a.mds$points[ , 1])
    max.x <- max(a.mds$points[ , 1])
    min.y <- min(a.mds$points[ , 2])
    max.y <- max(a.mds$points[ , 2])
    if(min.x < minx){minx <- min.x}
    if(max.x > maxx){maxx <- max.x}
    if(min.y < miny){miny <- min.y}
    if(max.y > maxy){maxy <- max.y}
  }
  for(i in 1:length(ldist.type)){
    a.type.dist <- ldist.type[[i]]
    tit.main <- unique(nodes$type)[i] # TODO: improve type identification
    print(paste0(tit.main))
    a.dist <-  stats::as.dist(ldist.type[[i]])
    a.mds <- MASS::isoMDS(a.dist) # MDS
    # temp
    row.names(a.mds$points) <- ifelse(row.names(a.mds$points) == 'stat_2_gref',
                                      paste0('AG.2'),
                                      ifelse(row.names(a.mds$points) == 'stat_5_gref',
                                             paste0('AG.5'),
                                             ifelse(row.names(a.mds$points) == 'crane_afg',
                                                    paste0('KfH'),
                                             ifelse(row.names(a.mds$points) == 'tete_afe_gref',
                                                    paste0('JER'),
                                                    ifelse(row.names(a.mds$points) == 'figurine__wx',
                                                           paste0('QAR'), NA)))))
    if("type" %in% aggr){
      # create plot
      out.d <- paste0(dataDir, "/", out.dir, "/__", tit.main, "_grouped_by_type_and_dec.png")
      # TODO: get ratio to set W and H
      df.coords <- as.data.frame(a.mds$points)
      g.MDS <- ggplot2::ggplot(df.coords, ggplot2::aes(df.coords[, 1], df.coords[, 2])) +
        ggplot2::geom_point() +
        ggrepel::geom_text_repel(label = row.names(df.coords)) +
        ggplot2::coord_fixed() +
        ggplot2::xlim(minx, maxx) +
        ggplot2::ylim(miny, maxy) +
        ggplot2::theme_bw()
      ggplot2::ggsave(plot = g.MDS,
                      filename = out.d,
                      width = 14, height = 10,
                      units = "cm")
      print(paste0("MDS on grouped type and decorations '", tit.main, "'"))
      print(paste0("Plot saved in: ", out.d))
      print("\n")
    }
  }
  if("decoration" %in% aggr){
    # add all matrices and divide to get the mean
    ldist.dec <- (Reduce(`+`, ldist.type))/length(ldist.type)
    a.dist <- stats::as.dist(ldist.dec)
    a.mds <- MASS::isoMDS(a.dist) # MDS
    # min.x <- min(a.mds$points[ , 1])
    # max.x <- max(a.mds$points[ , 1])
    # min.y <- min(a.mds$points[ , 2])
    # max.y <- max(a.mds$points[ , 2])
    # temp
    row.names(a.mds$points) <- ifelse(row.names(a.mds$points) == 'stat_2_gref',
                                      paste0('AG.2'),
                                      ifelse(row.names(a.mds$points) == 'stat_5_gref',
                                             paste0('AG.5'),
                                             ifelse(row.names(a.mds$points) == 'crane_afg',
                                                    paste0('KfH'),
                                                    ifelse(row.names(a.mds$points) == 'tete_afe_gref',
                                                           paste0('JER'),
                                                           ifelse(row.names(a.mds$points) == 'figurine__wx',
                                                                  paste0('QAR'), NA)))))
    out.d <- paste0(dataDir, "/", out.dir, "/2_grouped_by_dec.png")
    # TODO: get ratio to set W and H
    df.coords <- as.data.frame(a.mds$points)
    g.MDS <- ggplot2::ggplot(df.coords, ggplot2::aes(df.coords[, 1], df.coords[, 2])) +
      ggplot2::geom_point() +
      ggrepel::geom_text_repel(label = row.names(df.coords)) +
      ggplot2::coord_fixed() +
      # ggplot2::xlim(min.x, max.x) +
      # ggplot2::ylim(min.y, max.y) +
      ggplot2::theme_bw()
    ggplot2::ggsave(plot = g.MDS,
                    filename = out.d,
                    width = 14, height = 10,
                    units = "cm")
    print(paste0("MDS on grouped decorations '", tit.main, "'"))
    print(paste0("Plot saved in: ", out.d))
    print("\n")
  }
}

