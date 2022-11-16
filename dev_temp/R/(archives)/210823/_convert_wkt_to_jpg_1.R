convert_wkt_to_jpg <- function(nodes, dir.out = getwd()){
  # 'nodes.csv' comes from the 'export_wkt_*.R' function
  # convert WKT geometries to JPG in order to perform conour analysis
  # export in folder depending on GUs' type (eg visage, oeil, etc)
  # TODO: for Lines ; When ugs are Line or Polygons, there's a need to get their centroid to pass this value to Edges
  # filter on geometries to compare Polygon // POlygon & Lines // Lines & etc.
  # will compare by geometries (eg Points, Polygons, etc) &
  for (geom in c("POLYGON", "LINES")){
    nodes.geom <- nodes[grep(geom, nodes$wkt, value=F), ]
    types.folders <- unique(nodes.geom$type)
    # types.folders <- c("visage", "oeil")
    # object folder
    for(a.type in types.folders){
      # a.type <- "visage"
      out.folder.type <- paste0(dir.out, a.type)
      dir.create(out.folder.type,
                 showWarnings = FALSE)
      # Polygons
      noeuds.geom.sf <- st_as_sf(nodes.geom, wkt = "wkt")
      noeuds.geom.sf <- noeuds.geom.sf[noeuds.geom.sf$type == a.type, ] # filter on type
      noeuds.geom.sf$sn <- paste0(noeuds.geom.sf$site, ".", noeuds.geom.sf$numero, ".", noeuds.geom.sf$id)
      for(sn in unique(noeuds.geom.sf$sn)){
        # sn <- "Ain Ghazal.stat_3.1"
        a.wkt <- noeuds.geom.sf[noeuds.geom.sf$sn == sn, ]
        a.wkt.name <- paste0(a.wkt$site, ".",
                             a.wkt$numero, ".",
                             a.wkt$id, ".jpg")
        g.ug <- ggplot(a.wkt) +
          geom_sf(color = 'black', fill = 'black') +
          theme(panel.grid = element_blank(),
                panel.background = element_blank(),
                axis.ticks = element_blank(),
                axis.text = element_blank())
        out.g <- paste0(dir.out, a.type, "/", a.wkt.name)
        ggsave(out.g, g.ug)
      }
    }
  }
}

# out.folder <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/"
# dir.out <- paste0(out.folder,"toCompare/toAnalyse/")
# nodes <- read.csv(paste0(out.folder, "toCompare/nodes.csv"), sep = ";")
# convert_wkt_to_jpg(nodes, dir.out)
