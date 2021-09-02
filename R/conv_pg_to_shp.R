#' Convert Pg geometries to SHP geometries
#' @name conv_pg_to_shp
#'
#' @description Convert the graphical units (GUs) geometries stored in PostgreSQL into shapefiles (SHP) geometries.
#'
#' @param dataDir working directory: sites' folders (copied data) and 'out' folder (outputs)
#' @param Pg.param list of arguments to connect the PostgreSQL database.
#' Like: list(driver, name_of_db, host, port, user, password). By default NA
#' @param sqll.obj SQL on objects to get images of decorations. By default NA
#' @param sqll.ug.pts SQL on GUs with geometries of type POINTS to get shapes. By default NA
#' @param sqll.ug.lines SQL on GUs with geometries of type LINES to get shapes. By default NA
#' @param sqll.ug.polyg SQL on GUs with geometries of type POLYGONS to get shapes. By default NA
#' @param exp.edges Export also edges as shapefiles. By default: FALSE
#' @return Decoration's images and shapefiles
#'
#' @examples
#' Pg.param. <- list("PostgreSQL",
#'                   "postgres",
#'                   "localhost",
#'                   5432,
#'                   "postgres",
#'                   "postgres")
#' dataPath <- "D:/decorations/"
#' dataDir <- paste0(dataPath, "analyse")
#'
#' ### SQL on Pg
#' ## Objects
#' ## sqll.obj. <-  "SELECT
#' ## site, numero, img
#' ## FROM objets
#' ## WHERE (objets.site LIKE 'Ain Ghazal' AND objets.numero LIKE 'stat_2') OR
#' ## (objets.site LIKE 'Ain Ghazal' AND objets.numero LIKE 'stat_5_xd') OR
#' ## (objets.site LIKE 'Qarassa' and objets.numero LIKE 'figurine__wx') OR
#' ## (objets.site LIKE 'Jericho' and objets.numero LIKE 'tete_afe')"
#'
#' ## Polygons
#' ## sqll.ug.polyg. <-  "SELECT
#' ## objets.site,
#' ## objets.numero,
#' ## table_noeuds.id,
#' ## table_noeuds.type,
#' ## table_noeuds.technologie as technlg,
#' ## table_noeuds.incomplet as incmplt,
#' ## ST_AsText(table_noeuds.geom_shape) as wkt FROM objets LEFT JOIN table_noeuds
#' ## ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
#' ## WHERE (objets.site like 'Ain Ghazal' AND objets.numero like 'stat_2')
#' ##  OR (objets.site like 'Ain Ghazal' AND objets.numero like 'stat_5_xd')
#' ##  OR (objets.site like 'Qarassa' AND objets.numero like 'figurine__wx')
#' ##  OR (objets.site like 'Jericho' AND objets.numero like 'tete_afe')"
#'
#' ## Run function
#' ## conv_pg_to_shp(dataDir = dataDir,
#' ##                Pg.param = Pg.param.,
#' ##                sqll.obj = sqll.obj.,
#' ##                sqll.ug.polyg = sqll.ug.polyg.)
#'
#' @export
conv_pg_to_shp <- function(dataDir = tempdir(),
                           Pg.param = NA,
                           sqll.obj = NA,
                           sqll.ug.pts = NA,
                           sqll.ug.lines = NA,
                           sqll.ug.polyg = NA,
                           exp.edges = FALSE){
  # TODO: no projections
  # convert Pg geometries to shapefiles, like this:
  # img: "site"."decor".ext
  # NODES
  #     -points: "site"."decor"_nd_pt.shp
  #     -lines: "site"."decor"_nd_ln.shp
  #     -polygon: "site"."decor"_nd_pl.shp
  # EDGES: "site"."decor"_ed.shp
  # create folder, move image, recopy POLYGON
  dir.create(dataDir, showWarnings = FALSE) # create 'dataDir' folder if not exist
  dir.create(file.path(dataDir, "/_out"), showWarnings = FALSE) # create 'out' folder if not exist
  # read Pg
  # library("RPostgreSQL") # necessary ??
  drv <- DBI::dbDriver(Pg.param[[1]])
  con <- PostgreSQL::dbConnect(drv,
                               dbname = Pg.param[[2]],
                               host = Pg.param[[3]],
                               port = Pg.param[[4]],
                               user = Pg.param[[5]],
                               password = Pg.param[[6]])
  objets <- DBI::dbGetQuery(con, sqll.obj.)
  # rm objets without imgs
  objets <- objets[objets$img != '', ]
  row.names(objets) <- 1:nrow(objets)
  ## IMAGES
  for(i in 1:nrow(objets)){
    # loop through objects
    # i <- 1
    a.site <- objets[i, "site"]
    a.decor <- objets[i, "numero"]
    a.img <- objets[i, "img"]
    # object folder
    dir.create(file.path(dataDir, a.site),
               showWarnings = FALSE)
    # get the image name
    a.img.decomp <- unlist(stringr::str_split(a.img, "\\\\"))
    a.img.short <- a.img.decomp[length(a.img.decomp)] # the image
    a.img <- gsub("%20", " ", a.img)
    f.copied <- file.copy(from = a.img,
                          to = paste0(dataDir, "/",
                                      a.site, "/",
                                      paste0(a.site, ".", a.img.short)))
  }
  ## UGs & EDGES
  sqlls <- c(sqll.ug.pts, sqll.ug.lines, sqll.ug.lines, sqll.ug.polyg)
  sqlls <- sqlls[!is.na(sqlls)]
  ugs <- dbGetQuery(con, sqlls[1])
  df.ugs <- ugs[0, ]
  if(!is.na(sqll.ug.pts)){
    ## Points
    # catch the ug recorded as POINTS but not the default ones (x = 0, y = 0)
    # TODO: create 'wkt' column to be // with other geometries
    noeuds <- DBI::dbGetQuery(con, sqll.ug.pts)
    #noeuds$x <- noeuds$y <- 1
    noeuds <- noeuds[!is.na(noeuds$wkt), ]
    # noeuds <- noeuds[!is.na(noeuds$site), ]
    if(nrow(noeuds) > 0){
      # exists ug with geometry as POINTS
      noeuds$sn <- paste0(noeuds$site, ".",noeuds$numero)
      # df.ugs <- noeuds[0, ]
      for(sn in unique(noeuds$sn)){
        # sn <- "Sospiro.item297"
        # sn <- "Ain Ghazal.stat_3"
        noeuds.sel <- noeuds[noeuds$sn == sn, ]
        noeuds.sel$sn <- NULL
        df.ugs <- rbind(df.ugs, noeuds.sel) # add to df
      }
    } else {print(paste0("|!| None decoration with POINT shapes |!|"))}
  }
  # - - - - - - - - - - - - - - -
  if(!is.na(sqll.ug.lines)){
    ## Lines
    # catch the ug recorded as LINES
    noeuds <- DBI::dbGetQuery(con, sqll.ug.lines)
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
  }
  # - - - - - - - - - - - - - - -
  if(!is.na(sqll.ug.polyg)){
    ## Polygon
    # catch the ug with geometry recorded as POLYGONS
    noeuds <- DBI::dbGetQuery(con, sqll.ug.polyg)
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
  }
  # export all geometries as df
  df.ugs <- df.ugs[!is.na(df.ugs$wkt), ]
  # write.csv2(df.ugs, paste0(dataDir, "toCompare/nodes.csv"), row.names = FALSE)
  # TODO: when ugs are Line or Polygons, there's a need to get their centroid to pass this value to Edges
  # filter on geometries to compare Polygon // Polygon & Lines // Lines & etc.
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
      noeuds.polyg.sf <- sf::st_as_sf(df.ugs.polyg.select.dec, wkt = "wkt")
      out.shp <- paste0(dataDir, "/", a.site, "/", paste0(a.site, ".", a.decor, "_nd_pl.shp"))
      sf::st_write(noeuds.polyg.sf,
                   out.shp,
                   delete_layer = T,
                   quiet = T)
      # TODO: export other geometries to shapefile
    }
    print(paste0("Geometries of '", a.site, "' has been exported"))
  }
  if(exp.edges){
    ## EDGES
    liens <- DBI::dbGetQuery(con, sqll.edges)
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
      out.shp <- paste0(dataDir, a.site, "/", a.decor, "_edg.shp")
      # out.shapefile <- paste0()
      tryCatch(
        expr = {
          liens.sel.sf <- sf::st_as_sf(liens.sel, wkt = "wkt")
          sf::st_write(liens.sel.sf, out.shp, delete_layer = T, quiet = T)
          print(paste0("shapefile créé: ", out.shp))
        },
        error = function(e){
          print(paste0("ERROR with shapefile: ", out.shp))
        }
      )
    }
    df.edg <- df.edg[!is.na(df.edg$wkt), ]
  }
  DBI::dbDisconnect(con)
}



