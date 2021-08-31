#' Convert WKT geometries to JPG
#' @name conv_wkt_to_jpg
#'
#' @description Convert Well-Known Text geometries of graphical unites (GUs) to JPG files in order to perform contour analysis with Momocs
#'
#' @param nodes 'nodes.csv' comes from the 'export_wkt_*.R' function
#' @param out.dir output folder. By default:paste0(dataDir, "/_out")
#' @return JPGs files exported into as many folders as different on GUs' type (eg. 'visage', 'oeil', etc.)
#'
#' @examples
#' conv_wkt_to_jpg(nodes = nodes,
#'                 out.dir = out.dir)

conv_wkt_to_jpg <- function(nodes, out.dir = getwd()){
  # TODO: for Lines ; When ugs are Line or Polygons, there's a need to get their centroid to pass this value to Edges
  # filter on geometries to compare Polygon // Polygon & Lines // Lines & etc.
  # will compare by geometries (eg Points, Polygons, etc) &
  for (geom in c("POLYGON", "LINES")){
    nodes.geom <- nodes[grep(geom, nodes$geometry, value = F), ]
    types.folders <- unique(nodes.geom$type)
    # types.folders <- c("visage", "oeil")
    # object folder
    for(a.type in types.folders){
      # a.type <- "visage"
      out.folder.type <- paste0(out.dir, "/", a.type)
      # print(out.folder.type)
      dir.create(out.folder.type,
                 showWarnings = FALSE)
      # Polygons
      noeuds.geom.sf <- sf::st_as_sf(nodes.geom, wkt = "geometry")
      noeuds.geom.sf <- noeuds.geom.sf[noeuds.geom.sf$type == a.type, ] # filter on type
      noeuds.geom.sf$sn <- paste0(noeuds.geom.sf$site, ".", noeuds.geom.sf$decor, ".", noeuds.geom.sf$id)
      for(sn in unique(noeuds.geom.sf$sn)){
        # sn <- "Ain Ghazal.stat_3.1"
        a.wkt <- noeuds.geom.sf[noeuds.geom.sf$sn == sn, ]
        a.wkt.name <- paste0(a.wkt$site, ".",
                             a.wkt$decor, ".",
                             a.wkt$id, ".jpg")
        g.ug <- ggplot2::ggplot(a.wkt) +
          ggplot2::geom_sf(color = 'black', fill = 'black') +
          ggplot2::theme(panel.grid = ggplot2::element_blank(),
                         panel.background = ggplot2::element_blank(),
                         axis.ticks = ggplot2::element_blank(),
                         axis.text = ggplot2::element_blank())
        out.g <- paste0(out.dir, "/", a.type, "/", a.wkt.name)
        # print(out.g)
        ggplot2::ggsave(out.g, g.ug)
      }
    }
  }
}
