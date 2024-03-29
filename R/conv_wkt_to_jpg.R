#' Convert WKT to JPG
#'
#' @name conv_wkt_to_jpg
#'
#' @description Convert the graphical units (GUs) geometries stored as Well-Known Text geometries (WKT) into JPG files
#'  in order to perform contour analysis with the Momocs package
#'
#' @param nodes nodes dataframe coming from the 'conv_shp_to_wkt.R' function
#' @param ids the field names that constitute the unique key of the GU. By default: c("site", "decor", "id").
#' @param dataDir path to the folder.
#' @param out.dir path of the output folder. By default "_out/" in the "dataDir" folder
#' @param verbose if TRUE (by default), will print messages
#' @return JPGs files exported into as many folders as different GUs' types (eg., 'bouche', oeil', 'visage', etc.)
#' The names of the JPGs is the concatenate of their site name, dot, decoration name, dot, GU identifier (eg, "Ain Ghazal.stat_2.1.jpg")
#'
#' @examples
#'
#' dataDir <- system.file("extdata", package = "iconr")
#' nd.df.path <- conv_shp_to_wkt(dataDir = dataDir)
#' nodes <- read.csv(nd.df.path, sep = ";")
#' conv_wkt_to_jpg(nodes = nodes)
#'
#' ## Saving 4.33 x 3.94 in image
#' ## Saving 4.33 x 3.94 in image
#' ## ...
#'
#' @export
conv_wkt_to_jpg <- function(nodes,
                            ids = c("site", "decor", "id"),
                            dataDir = system.file("extdata", package = "iconr"),
                            out.dir = "_out",
                            verbose = TRUE){
  # TODO: add "LINES"
  # TODO: "MULTIPOLYGON"
  # TODO: for Lines ; When ugs are Line or Polygons, there's a need to get their centroid to pass this value to Edges
  # filter on geometries to compare Polygon // Polygon & Lines // Lines & etc.
  # will compare by geometries (eg Points, Polygons, etc) &
  if(verbose){print(paste0(" the unique identifier of the geometries is based on field(s) '",
                           paste0(ids, collapse = "."), "'"))}
  out.dirPath <- paste0(dataDir, "/", out.dir)
  for (geom in c("POLYGON")){
    # geom <- "POLYGON"
    if(verbose){print(paste0("*read '", geom, "' geometries"))}
    nodes.geom <- nodes[grep(geom, nodes$geometry, value = F), ]
    gu.types <- unique(nodes.geom$type)
    # gu.types <- c("visage", "oeil")
    # object folder
    for(a.type in gu.types){
      # a.type <- "visage"
      # a.type <- "caravanserail"
      if(verbose){print(paste0("  + read type: '", a.type,"'"))}
      out.folder.type <- paste0(out.dirPath, "/", a.type)
      # print(out.folder.type)
      dir.create(out.folder.type,
                 showWarnings = FALSE)
      if(verbose){print(paste0("  the folder '", out.folder.type, "' as been created"))}
      # Polygons
      noeuds.geom.sf <- sf::st_as_sf(nodes.geom, wkt = "geometry")
      noeuds.geom.sf <- noeuds.geom.sf[noeuds.geom.sf$type == a.type, ] # filter on type
      # noeuds.geom.sf$sn <- paste0(noeuds.geom.sf$site, ".", noeuds.geom.sf$decor, ".", noeuds.geom.sf$id)
      if(length(ids) == 1){
        keys <- as.character(as.data.frame(noeuds.geom.sf)[ , ids])
      } else {
        keys <- as.character(apply(as.data.frame(noeuds.geom.sf)[ , ids], 1, paste0, collapse="."))
        keys <- gsub(" ", "", keys)
      }
      noeuds.geom.sf$sn <- keys
      ct <- 0
      tot <- length(noeuds.geom.sf$sn)
      for(sn in unique(noeuds.geom.sf$sn)){
        ct <- ct + 1
        # sn <- "Ain Ghazal.stat_3.1"
        # sn <- "EAMENA-0182033.crvn.1"
        # sn <-  "EAMENA-0182054"
        if(verbose){print(paste0("    - ", ct, "/", tot, "] read feature: '", sn, "'"))}
        a.wkt <- noeuds.geom.sf[noeuds.geom.sf$sn == sn, ]
        # a.wkt.name <- paste0(a.wkt$site, ".",
        #                      a.wkt$decor, ".",
        #                      a.wkt$id, ".jpg")
        # duplicated geometry
        if(nrow(a.wkt) > 1){
          a.wkt <- a.wkt[1, ]
        }
        a.wkt.name <- paste0(a.wkt$sn, ".jpg")
        g.ug <- ggplot2::ggplot(a.wkt) +
          ggplot2::geom_sf(color = 'black',
                           fill = 'black') +
          ggplot2::theme(panel.grid = ggplot2::element_blank(),
                         panel.background = ggplot2::element_blank(),
                         axis.ticks = ggplot2::element_blank(),
                         axis.text = ggplot2::element_blank())
        out.g <- paste0(out.dirPath, "/", a.type, "/", a.wkt.name)
        # print(out.g)
        ggplot2::ggsave(out.g, g.ug)
        if(verbose){print(paste0("    - saved"))}
      }
    }
    if(verbose){
      print(paste0("  JPGs of '", a.type, "' have been saved in the eponym subfolder"))
    }
  }
  if(verbose){
    print(paste0("all JPGs have been saved into: '", out.dirPath,"' and subfolders"))
  }
}
