#' @name nds_morph_classif_resume
#' @title create a contactsheet (spatialization, kmeans & mean shape, dataframe, ...) for clustered nodes
#'
#' @param nodes dataframe of nodes
#' @param gu.types classes of nodes that will be clustered, a single value
#' @param mbrshp see 'nds_morph_classif()'
#' @param path.coords path of the .csv with sites coordinates (for 'spatial' and 'all')
#' @param out.data if "all" return a contactsheet with all stats, if not, depend on stats


library(ggrepel)
nds_morph_classif_resume <- function(nodes = nodes,
                                     gu.types = gu.types,
                                     mbrshp = mbrshp,
                                     path.coords = NA,
                                     out.data = c("all", "meanshapes", "clust", "spatial")[1])
{
  #
  # now idf refers to gus
  nodes <- nodes[grep("POLYGON", nodes$geometry, value=F), ] # filter
  nodes <- nodes[nodes$type == gu.types, ] # filter
  nodes$idf <- paste0(nodes$site, ".", nodes$decor, ".", nodes$id)
  nodes$num <- row.names(nodes)
  nodes.clusters <- merge(nodes, mbrshp, by = "idf")
  nodes.clusters$geometry <- NULL
  k <- unique(nodes.clusters$cluster) # different cluster
  if(out.data == "meanshapes" | out.data == "all"){
    # mean shapes of clusters
    ll.mshapes <- list()
    for(clust in k){
      # clust <- "2"
      print(paste0("cluster: ", clust))
      a.nodes.cluster <- nodes.clusters[nodes.clusters$cluster == clust, ]
      coo <- Momocs::import_jpg(a.nodes.cluster$image)
      a.ug.type <- Out(coo)
      ef.type <- Momocs::efourier(a.ug.type, nb.h=10)
      tit <- paste0(gu.types, "_clust_", clust)
      out.mshape <- paste0(out.dir, "/", gu.types,
                           "_kmeans_clust_", clust,"_mshape.png")
      png(out.mshape,
          width = 7, height = 7, units = "cm", res = 300)
      ef.type %>% MSHAPES() %>% coo_plot()
      text(x = 0, y = 0, labels = tit, cex = 0.5)
      dev.off()
      # store to list
      mshape <- png::readPNG(out.mshape)
      mshape <- grid::rasterGrob(mshape, interpolate = TRUE)
      ll.mshapes[[length(ll.mshapes)+1]] <- mshape
      # coo <- Momocs::import_jpg(jpgs)
    }
  }
  if(out.data == "clust" | out.data == "all"){
    coo <- Momocs::import_jpg(nodes.clusters$image)
    names.coo <- names(coo)
    nums.coo <- nodes.clusters[nodes.clusters$idf == names.coo, "num"]
    # clust.coo <- nodes.clusters[nodes.clusters$idf == names.coo, "cluster"]
    # fac.type <- data.frame(idf = as.factor(nums.coo),
    #                        names = as.factor(names.coo),
    #                        cluster =  as.factor(clust.coo))
    names(coo) <- nums.coo
    # a.ug.type <- Out(coo, fac.type)
    a.ug.type <- Out(coo)
    ef.type <- efourier(a.ug.type, nb.h = 10)
    PCA.type <- Momocs::PCA(ef.type)
    out.clust <- paste0(out.dir, "/", gu.types, "_clust_vert.png")
    png(out.clust,
        width = 5, height = 10, units = "cm", res = 300)
    print(
      clust <- CLUST(PCA.type,
                     k = length(k),
                     cex = 1/3,
                     type = "vertical")
    ) # + theme(plot.margin = unit(c(0,3,0,0), "cm"))
    dev.off()
  }
  if(out.data == "spatial" | out.data == "all"){
    library(ggrepel)
    library(gridExtra)
    # spatial
    coords <- read.csv2(path.coords)
    nodes.clusts <- merge(nodes.clusters, coords, by = "site", all.x = T)
    nodes.clusts$x <- as.numeric(nodes.clusts$x)
    nodes.clusts$y <- as.numeric(nodes.clusts$y)
    nodes.clusts <- nodes.clusts[!duplicated(nodes.clusts[ , c("idf")]),]
    # bbox
    buff <-  .5
    xmax <- max(nodes.clusts$x) + buff
    xmin <- min(nodes.clusts$x) - buff
    ymax <- max(nodes.clusts$y) + buff
    ymin <- min(nodes.clusts$y) - buff
    m <- rbind(c(xmin,ymin), c(xmax,ymin),
               c(xmax,ymax), c(xmin,ymax),
               c(xmin,ymin))
    p <- st_polygon(list(m))
    p <- st_sfc(p)
    st_crs(p) <- "+init=epsg:4326"
    bck_admin <- "D:/Projet Art Rupestre/Sources/1_CONTINENTS/Europe/ADMIN/mediterranee.shp"
    bck_admin.shp <- sf::st_read(bck_admin)
    bck_admin.shp <- sf::st_intersection(bck_admin.shp, p)
    mapt <- ggplot(data = bck_admin.shp) +
      # ggtitle(gu.types) +
      geom_sf() +
      geom_point(data = nodes.clusts, aes(x = x, y = y,
                                          colour = cluster), show.legend = T) +
      geom_label_repel(data = nodes.clusts, aes(x = x, y = y,
                                                label = num,
                                                colour = cluster),
                       show.legend = T, size = 3) +
      theme_bw()+
      theme(legend.position="bottom",
            legend.box = "horizontal",
            axis.title =element_blank()
      )
    # df
    df.type <- nodes.clusts[ ,c("num", "idf", "cluster", "x", "y", "incmplt")]
    mytheme <- ttheme_default(base_size = 10, padding = unit(c(2, 2), "mm"))
    datat <- tableGrob(df.type, theme = mytheme, rows = NULL)
    mapt.datat <- grid.arrange(top = gu.types,
                               mapt, datat,
                               ncol = 2, widths = c(2, 1))
    # grid.arrange(grobs = gs, layout_matrix = lay)
    ggsave(file = paste0(out.dir, "/", gu.types, "_spat_classif.png"),
           mapt.datat, width = 15, height = 15)
  }
  if(out.data == "all"){
    # create composition
    ll <- list()
    ll[[1]] <- mapt
    ll[[2]] <- datat
    # group meanshapes & save
    n.mshapes <- length(ll.mshapes)
    # out.mshapes <- paste0(out.dir, "/", gu.types,
    #                       "_kmeans_clust_mshapes.png")
    gl.mshapes <- grid.arrange(grobs = ll.mshapes,
                               nrow = n.mshapes)
    # ggsave(file = out.mshapes,
    #        gl.mshapes, width = 5, height = n.mshapes * 5)
    ll[[3]] <- gl.mshapes
    ll[[4]] <- textGrob(gu.types)
    # cluster dendro vertical
    gclust <- png::readPNG(out.clust)
    gclust <- grid::rasterGrob(gclust, interpolate = TRUE)
    ll[[5]] <- gclust
    lay <- rbind(c(4,1,1,3,5),
                 c(1,1,1,3,5),
                 c(1,1,1,2,2),
                 c(1,1,1,2,2))
    all.clust <- grid.arrange(grobs = ll,
                              layout_matrix = lay)
    ggsave(file = paste0(out.dir, "/", gu.types, "_all.png"),
           all.clust, width = 20, height = 20)
  }
}
