#' Convert SHP to WKT
#' @name conv_shp_to_wkt
#' @description Convert the graphical units (GUs) geometries stored as shapefiles of POINTS, LINES, or POLYGONS into Well-Known Text (WKT) representations. Store the results in the 'nodes.csv' dataframe and return the path to this dataframe
#'
#' @param dataDir Path of the folder storing folders of all decorations. Each of these folders as a site name (eg, Ain Ghazal) and contains at least one shapefile (.shp and .dbf and .shx) and one image (.jpg or .tif or .png, etc.). The shapefile is named conventionally with the name of the site, a dot,the name of the decoration, "nd_pl" for nodes POLYGONS (eg, Ain Ghazal.stat_2_nd_pl.shp). The image is named conventionally with the name of the site, a dot, and the name of the decoration (eg, Ain Ghazal.stat_2.tif)
#' @param out.dir Path of the output folder. By default "_out/" in the "dataDir" folder
#' @param complete.only Boolean, if TRUE discard incomplete (incmplt == 1), by default = TRUE
#' @return Create the 'nodes.csv' file into the out folder, return the complete path of the 'nodes.csv' file
#'
#' @examples
#' dataDir <- system.file("extdata", package = "iconr")
#' nd.df.path <- conv_shp_to_wkt(dataDir = dataDir)
#' head(read.csv2(nd.df.path), 1)
#'
#' ##         site  decor id type technlg incmplt geometry
#' ## 1 Ain Ghazal stat_2  1 oeil       -       0 POLYGON ((266.9252 -167.608,...
#'
#' @export
conv_shp_to_wkt <- function(dataDir = system.file("extdata", package = "iconr"),
                            complete.only = TRUE,
                            out.dir = "_out"){
  # print(dataDir)
  out.dirPath <- paste0(dataDir, "/", out.dir)
  dir.create(file.path(out.dirPath), showWarnings = FALSE) # create out folder if not exist
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
    # TODO: add ".*nd_ln.shp", ".*nd_pt.shp"
    for (shp.type in c(".*nd_pl.shp")){
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
  utils::write.csv2(df.ugs, paste0(out.dirPath, "/nodes.csv"), row.names = FALSE)
  print(paste0("nodes dataframe (n = ", nrow(df.ugs), ") exported to: '", out.dirPath, "/nodes.csv'"))
  return(paste0(out.dirPath, "/nodes.csv"))
}

