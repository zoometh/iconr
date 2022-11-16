library(RPostgreSQL)
library(stringr)
library(sp)
library(sf)
library(ggplot2)
library(Momocs)
library(dplyr)
library(magick)

options(warn=-1)

############################################
# Get geometries from Pg, export them as shapefiles (ie, for iconr package), export these shp
# into jpg images (ie, for momocs package)
############################################
# Pg          -> shapefiles     -> jpg -> Momocs
# export_vsg  -> shape_to_jpg   ->

# img: "site"."decor".ext
# NODES
#-points: "site"."decor"_nd_pt.shp
#-lines: "site"."decor"_nd_ln.shp
#-polygon: "site"."decor"_nd_pl.shp
# EDGES: "site"."decor"_ed.shp

# getwd()

dataPath <- "F:/Collaborations et concours/Colloques, seminaires, articles/210906 EAA/"
out.folder <- paste0(dataPath, "analyse2")
dataDir <- out.folder
dir.create(dataDir, showWarnings = FALSE) # create 'dataDir' folder if not exist
dir.create(file.path(dataDir, "/_out"), showWarnings = FALSE) # create 'out' folder if not exist
lDir <- list.dirs(path = dataDir, full.names = F, recursive = F)
lDir <- lDir[!grepl("^_", lDir)] # not 'out', '_archives', etc.
# TODO: no projections
sys.coord <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
in.folder <- "D:/Sites_10/"


PPN <- T # Ain Ghazal et al. (PPN)
export_vsg <- F # Neo ancien (JRecchia) export from Pg to shapefiles

# Read in Pg
# sqll roots
sqll.obj.root <- "select site, numero, img from objets"

# to WKT
sqll.ug.pts.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_noeuds.id,
  table_noeuds.type,
  table_noeuds.technologie as technlg,
  table_noeuds.incomplet as incmplt,
  ST_AsText(table_noeuds.geom) as wkt FROM objets LEFT JOIN table_noeuds
ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
  "
sqll.ug.lines.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_noeuds.id,
  table_noeuds.type,
  table_noeuds.technologie as technlg,
  table_noeuds.incomplet as incmplt,
  ST_AsText(table_noeuds.geom_outlines_opn) as wkt FROM objets LEFT JOIN table_noeuds
ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
  "
sqll.ug.polyg.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_noeuds.id,
  table_noeuds.type,
  table_noeuds.technologie as technlg,
  table_noeuds.incomplet as incmplt,
  ST_AsText(table_noeuds.geom_shape) as wkt FROM objets LEFT JOIN table_noeuds
ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
  "
sqll.edges.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_liens.a,
  table_liens.b,
  table_liens.typ,
  ST_AsText(table_liens.geom) as wkt FROM objets LEFT JOIN table_liens
ON table_liens.site = objets.site AND table_liens.decor = objets.numero
  "
# case study
if(PPN){
  cond.sqll <- "where objets.site like 'Ain Ghazal' and objets.selection = 1"
  # a.site <- 'Ain Ghazal'
}
sqll.obj. <- paste(sqll.obj.root, cond.sqll)
sqll.ug.pts. <- paste(sqll.ug.pts.root, cond.sqll)
sqll.ug.lines. <- paste(sqll.ug.lines.root, cond.sqll)
sqll.ug.polyg. <- paste(sqll.ug.polyg.root, cond.sqll)
sqll.edges. <- paste(sqll.edges.root, cond.sqll)


f.objets <- function(sqll.obj){
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
  return(objets)
}

convert_pg_to_shp <- function(sqll.obj = sqll.obj.,
                              sqll.ug.pts = sqll.ug.pts.,
                              sqll.ug.lines = sqll.ug.lines.,
                              sqll.ug.polyg = sqll.ug.polyg.,
                              exp.edges = FALSE){
  # convert Pg geometries to shapefiles
  # create folder, move image, recopy POLYGON
  objets <- f.objets(sqll.obj.)
  ## IMAGES
  for(i in 1:nrow(objets)){
    # loop through objects
    # i <- 1
    a.site <- objets[i, "site"]
    a.decor <- objets[i, "numero"]
    a.img <- objets[i, "img"]
    # object folder
    dir.create(file.path(out.folder, a.site),
               showWarnings = FALSE)
    # get the image name
    a.img.decomp <- unlist(str_split(a.img, "\\\\"))
    idx <- length(a.img.decomp)
    a.img.short <- a.img.decomp[idx]
    a.img <- gsub("%20", " ", a.img)
    f.copied <- file.copy(from = a.img,
                          to   = paste0(out.folder, "/",
                                        a.site, "/",
                                        paste0(a.site, ".", a.img.short)))
    # to   = paste0(out.folder, "/toCompare/", paste0(a.site, ".", a.img.short)))
    # setwd(file.path(mainDir, subDir))
  }
  ## UGs & EDGES
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv,
                   dbname="mailhac_9",
                   host="localhost",
                   port=5432,
                   user="postgres",
                   password="postgres")
  # - - - - - - - - - - - - - - -
  ## Points
  # catch the ug recorded as POINTS but not the default ones (x = 0, y = 0)
  # TODO: create 'wkt' column to be // with other geometries
  noeuds <- dbGetQuery(con, sqll.ug.pts)
  #noeuds$x <- noeuds$y <- 1
  noeuds <- noeuds[!is.na(noeuds$wkt), ]
  # noeuds <- noeuds[!is.na(noeuds$site), ]
  if(nrow(noeuds) > 0){
    # exists ug with geometry as POINTS
    noeuds$sn <- paste0(noeuds$site, ".",noeuds$numero)
    df.ugs <- noeuds[0, ]
    for(sn in unique(noeuds$sn)){
      # sn <- "Sospiro.item297"
      # sn <- "Ain Ghazal.stat_3"
      noeuds.sel <- noeuds[noeuds$sn == sn, ]
      noeuds.sel$sn <- NULL
      df.ugs <- rbind(df.ugs, noeuds.sel) # add to df
    }
  } else {print(paste0("|!| None decoration with POINT shapes |!|"))}
  # - - - - - - - - - - - - - - -
  ## Lines
  # catch the ug recorded as LINES
  noeuds <- dbGetQuery(con, sqll.ug.lines)
  noeuds <- noeuds[!is.na(noeuds$wkt), ]
  if(nrow(noeuds) > 0){
    # exists ug with geometry as POINTS
    noeuds$sn <- paste0(noeuds$site,".",noeuds$numero)
    for(sn in unique(noeuds$sn)){
      # sn <- "Ain Ghazal.stat_3"
      noeuds.sel <- noeuds[noeuds$sn == sn, ]
      noeuds.sel$sn <- NULL
      df.ugs <- rbind(df.ugs, noeuds.sel) # add to df
    }
  } else {print(paste0("|!| None decoration with LINE shapes |!|"))}
  # - - - - - - - - - - - - - - -
  ## Polygon
  # catch the ug with geometry recorded as POLYGONS
  noeuds <- dbGetQuery(con, sqll.ug.polyg)
  # noeuds <- noeuds[noeuds$x > 0, ]
  # noeuds <- noeuds[!is.na(noeuds$site), ]
  if(nrow(noeuds) > 0){
    # exists ug with geometry as POINTS
    noeuds$sn <- paste0(noeuds$site,".",noeuds$numero)
    for(sn in unique(noeuds$sn)){
      # sn <- "Ain Ghazal.stat_3"
      noeuds.sel <- noeuds[noeuds$sn == sn, ]
      noeuds.sel$sn <- NULL
      df.ugs <- rbind(df.ugs, noeuds.sel) # add to df
    }
  } else {print(paste0("|!| None decoration with POLYGON shapes |!|"))}
  # export all geometries as df
  df.ugs <- df.ugs[!is.na(df.ugs$wkt), ]
  # write.csv2(df.ugs, paste0(out.folder, "toCompare/nodes.csv"), row.names = FALSE)
  # TODO: when ugs are Line or Polygons, there's a need to get their centroid to pass this value to Edges
  # filter on geometries to compare Polygon // POlygon & Lines // Lines & etc.
  df.ugs.point <- df.ugs[grep("POINT", df.ugs$wkt, value = F), ]
  df.ugs.lines <- df.ugs[grep("LINE", df.ugs$wkt, value = F), ]
  df.ugs.polyg <- df.ugs[grep("POLYGON", df.ugs$wkt, value = F), ]
  lsites <- unique(df.ugs$site)
  # POLYGONS
  for(a.site in lsites){
    df.ugs.polyg.select <- df.ugs.polyg[df.ugs.polyg$site == a.site, ]
    ldecors <- unique(df.ugs.polyg.select$numero)
    for(a.decor in ldecors){
      # a.decor <- "stat_3"
      # export as many Polygons to shapefile as exist different decor
      df.ugs.polyg.select.dec <- df.ugs.polyg.select[df.ugs.polyg.select$numero == a.decor, ]
      noeuds.polyg.sf <- st_as_sf(df.ugs.polyg.select.dec, wkt = "wkt")
      out.shp <- paste0(out.folder, "/", a.site, "/", paste0(a.site, ".", a.decor, "_nd_pl.shp"))
      st_write(noeuds.polyg.sf,
               out.shp,
               delete_layer = T,
               quiet = T)
      # TODO: export other geometries to shapefile
    }
    print(paste0("Geometries of '", a.site,"' has been exported"))
  }
  if(exp.edges){
    ## EDGES
    liens <- dbGetQuery(con, sqll.edges)
    liens <- liens[!is.na(liens$a) & !is.na(liens$b), ]
    liens$sn <- paste0(liens$site, ".", liens$numero)
    df.edg <- liens[0, ]
    # loop through decorations
    for(sn in unique(liens$sn)){
      # sn <- "Sospiro.item297"
      liens.sel <- liens[liens$sn == sn, ]
      liens.sel$sn <- NULL
      df.edg <- rbind(df.edg, liens.sel) # add to df
      a.site <- unique(liens.sel$site)
      a.decor <- unique(liens.sel$numero)
      # liens.sel$geom <- sf::st_as_sf(liens.sel$wkt)
      # liens.sel.sp <- as(liens.sel.sf, "Spatial")
      out.shp <- paste0(out.folder, a.site, "/", a.decor, "_edg.shp")
      # out.shapefile <- paste0()
      tryCatch(
        expr = {
          liens.sel.sf <- st_as_sf(liens.sel, wkt = "wkt")
          st_write(liens.sel.sf, out.shp, delete_layer = T, quiet = T)
          print(paste0("shapefile créé: ", out.shp))
        },
        error = function(e){
          print(paste0("ERROR with shapefile: ", out.shp))
        }
      )
    }
    df.edg <- df.edg[!is.na(df.edg$wkt), ]
  }
  dbDisconnect(con)
}

# run
# convert_pg_to_shp(sqll.obj.,
#                   sqll.ug.pts.,
#                   sqll.ug.lines.,
#                   sqll.ug.polyg.)


