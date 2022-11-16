library(igraph)
library(RPostgreSQL)
# library(dplyr)
# library(httr)

#' @name convert_shp_to_jpg
#' @title convert Polygons to jpg

convert_shp_to_jpg <- function(){
  # convert Polygon to jpg
  # TODO: convert Lines to jpg
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv,
                   dbname="mailhac_9",
                   host="localhost",
                   port=5432,
                   user="postgres",
                   password="postgres")
  objets <- dbGetQuery(con, sqll.obj)
  # rm objets without imgs
  objets <- objets[objets$img != '', ]
  row.names(objets) <- 1:nrow(objets)
  for(i in 1:nrow(objets)){
    # i <- 1
    # a.vsg <- "vsg_yp"
    a.site <- objets[i, "site"]
    a.numero <- objets[i, "numero"]
    a.vsg.polyg <- paste0(a.numero, "_polyg")
    # read shapefile
    polyg.shapes <- st_read(dsn = paste0(out.folder, a.site), layer = a.vsg.polyg)
    for(j in 1:nrow(polyg.shapes)){
      # j <- 1
      a.polyg <- polyg.shapes[j, ]
      out.name <- paste0(a.polyg$site, ".", a.polyg$numero, ".", a.polyg$id, ".jpg")
      # TODO?: fill hollow
      g.ug <- ggplot(a.polyg) +
        geom_sf(color = 'black', fill = 'black') +
        theme(panel.grid = element_blank(),
              panel.background = element_blank(),
              axis.ticks = element_blank(),
              axis.text = element_blank())
      out.g <- paste0(out.folder, a.site,"/_out/",out.name)
      ggsave(out.g, g.ug)
    }
  }
}

out.folder <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/"
convert_shp_to_jpg()
