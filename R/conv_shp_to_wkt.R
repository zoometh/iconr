#'#' Convert shapefiles to WKT.
#' @name convert_shp_to_wkt
#' @description read nodes shapefiles (Points, Lines, Polygons) from the different sites' folders,
#' store nodes in dataframe with Well-Known Text (WKT) geometries formats into the 'nodes.csv' file,
#'  discard 'incomplete', return path of the node dataframe
#'
#' @param dataDir path of the folder storing folders of all decorations
#' @param out.dir path of the output folder, by default dataDir/_out
#' @param complete.only boolean, if TRUE discard incomplete, by default = T
#' @return Create the 'nodes.csv' file into the '_out' folder
#'
#' @examples
#' nd.df.path <- convert_shp_to_wkt(dataDir = dataDir,
#'                                  out.dir = out.dir)
#'
#'
#'
options(warn=-1)

conv_shp_to_wkt <- function(dataDir,
                               complete.only = TRUE,
                               out.dir = NA){
  # print(dataDir)
  if(is.na(out.dir)){out.dir <- paste0(dataDir, "/_out")}
  dir.create(file.path(out.dir), showWarnings = FALSE) # create 'out' if not exist
  df.ugs <- data.frame(site = character(0),
                       numero = character(0),
                       id = numeric(0),
                       type = character(0),
                       technlg = character(0),
                       incmplt = character(0),
                       geometry = character(0))
  df.edg <- data.frame(site = character(0),
                       numero = character(0),
                       a = numeric(0),
                       b = numeric(0),
                       typ = character(0))
  lDir <- list.dirs(path = dataDir, full.names = F, recursive = F)
  lDir <- lDir[!grepl("^_", lDir)] # not folder starting with '_*' (_out, _archives, etc.)
  for (i in lDir){
    # read shapefiles and store in df
    # i <- "Catignano" ; i <- "Masseria Schiavone"
    print (i)
    in.Dir <- paste0(dataDir, "/", i)
    for (shp.type in c(".*nd_pl.shp", ".*nd_ln.shp", ".*nd_pt.shp")){
      # shp.type <- ".*nd_pl.shp"
      in.Dir.nd.polyg <- list.files(paste0(dataDir, "/", i), shp.type)
      in.Dir.nd.polyg <- gsub(".shp", "", in.Dir.nd.polyg)
      # shp -> sp
      if(length(in.Dir.nd.polyg) > 0){
        # TODO: loop when more than 1 shapefile
        # exist poly
        print(paste("     exist shapefile(s) like: ", shp.type))
        for(a.shapefile in in.Dir.nd.polyg){
          # a.shapefile <- in.Dir.nd.polyg[1]
          # a.shapefile <- in.Dir.nd.polyg[2]
          # check if exists features
          nd.geom.info  <- rgdal::ogrInfo(dsn = in.Dir,
                                          layer = a.shapefile)
          nb.feat <- nd.geom.info$nrows
          print(paste0("          - ", a.shapefile, "(", nb.feat," features)"))
          if(nb.feat > 0){
            nd.geom.sp  <- rgdal::readOGR(dsn = in.Dir,
                                          layer = a.shapefile,
                                          verbose = FALSE)
            names(nd.geom.sp)[names(nd.geom.sp) == 'numero'] <- 'decor' # to align with 'iconr' structure
            # nd.geom.sp$decor <- nd.geom.sp$numero # to align with 'iconr' structure
            # nd.geom.sp$numero <- NULL
            nd.geom.sf  <- sf::st_as_sf(nd.geom.sp) # sp -> sf
            # wkt <- sf::st_as_text(nd.polyg.sf$geometry)
            nd.geom.df  <- as.data.frame(nd.geom.sf) # dataframe
            nd.geom.df$geometry <- sf::st_as_text(nd.geom.df$geometry)
            nd.geom.df$x <- nd.geom.df$y <- NULL # .. because of Points coordinates (see export function below)
            if(complete.only){
              nd.geom.df <- nd.geom.df[nd.geom.df$incmplt != 1, ]
            }
            if(nrow(nd.geom.df) > 0){df.ugs <- rbind(df.ugs, nd.geom.df)} # store
          }
        }
      }
    }
  }
  write.csv2(df.ugs, paste0(out.dir, "/nodes.csv"), sep = ";", row.names = F)
  print(paste0("nodes dataframe (n = ", nrow(df.ugs),") exported to: '", out.dir, "/nodes.csv'"))
  return(paste0(out.dir, "/nodes.csv"))
}

