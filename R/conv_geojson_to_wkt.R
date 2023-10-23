#' Convert GeoJSON to WKT
#'
#' @name conv_geojson_to_wkt
#' @description Convert an EAMENA GeoJSON file to a format adapted to the iconr shape analysis.
#'
#' @param geojson.path The path of the GeoJSON file. By default 'caravanserail_polygon.geojson'.
#' @param dataDir Path of the folder storing folders of all decorations. Each of these folders as a site name (eg, Ain Ghazal) and contains at least one shapefile (.shp and .dbf and .shx) and one image (.jpg or .tif or .png, etc.). The shapefile is named conventionally with the name of the site, a dot,the name of the decoration, "nd_pl" for nodes POLYGONS (eg, Ain Ghazal.stat_2_nd_pl.shp). The image is named conventionally with the name of the site, a dot, and the name of the decoration (eg, Ain Ghazal.stat_2.tif).
#' @param out.dir Path of the output folder. By default "_out/" in the "dataDir" folder.
#' @param verbose if TRUE (by default), verbose.
#'
#' @return Create the 'nodes.csv' file into the out folder, return the complete path of the 'nodes.csv' file.
#'
#' @examples
#'
#' Kfar_Hahoresh.crane_afg_nd_pl_polygon.wkt <- conv_geojson_to_wkt()
#'
#'
#' @export
conv_geojson_to_wkt <- function(geojson.path = paste0(system.file(package = "eamenaR"),
                                                      "/extdata/Kfar_Hahoresh.crane_afg_nd_pl.geojson"),
                                dataDir = system.file("extdata", package = "iconr"),
                                out.dir = "_out",
                                verbose = TRUE){
  # print(dataDir)
  out.dirPath <- paste0(dataDir, "/", out.dir)
  dir.create(file.path(out.dirPath), showWarnings = FALSE)
  ea.geojson <- sf::st_read(geojson.path)
  ea.geojson.polygon <- ea.geojson[sf::st_geometry_type(ea.geojson$geometry) == "POLYGON" | sf::st_geometry_type(ea.geojson$geometry) == "MULTIPOLYGON", ]
  # all multi
  ea.geojson.polygon$geometry <- sf::st_cast(ea.geojson.polygon$geometry, "POLYGON")
  # conform to iconr format
  df <- data.frame(site = ea.geojson.polygon[["EAMENA ID"]],
                   decor = rep("crvn", nrow(ea.geojson.polygon)),
                   id = rep(1, nrow(ea.geojson.polygon)),
                   type = rep("caravanserail", nrow(ea.geojson.polygon)),
                   technlg = rep("-", nrow(ea.geojson.polygon)),
                   incmplt = rep(0, nrow(ea.geojson.polygon)),
                   geometry = sf::st_as_text(ea.geojson.polygon$geometry))
  # limit and remove duplicates geometries
  # df <- head(df, 50)
  df <- df[!duplicated(df[ , c("site")]),]
  nd.df.path <- paste0(out.dirPath, "/nodes.csv")
  utils::write.csv2(df, nd.df.path, row.names = FALSE)
  return(df)
  if(verbose){print(paste0("nodes dataframe (n = ",
                           nrow(df), ") exported to: '", nd.df.path, "'"))}
}
