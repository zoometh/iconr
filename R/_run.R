library(sf)

########## geojson to wkt ##########################

geojson.path <- "C:/Rprojects/eamenaR/inst/extdata/caravanserail_polygon.geojson"
dataDir <- "C:/Rprojects/eamena-arches-dev/projects/caravanserail"
out.dirPath <- paste0(dataDir, "/_out")
dir.create(file.path(out.dirPath), showWarnings = FALSE)
ea.geojson <- geojsonsf::geojson_sf(geojson.path)
ea.geojson.polygon <- ea.geojson[sf::st_geometry_type(ea.geojson$geometry) == "POLYGON" | sf::st_geometry_type(ea.geojson$geometry) == "MULTIPOLYGON", ]
# conform to iconr format
df <- data.frame(site = ea.geojson.polygon[["EAMENA ID"]],
                 decor = rep("caravanserail", nrow(ea.geojson.polygon)),
                 technlg = rep("-", nrow(ea.geojson.polygon)),
                 incmplt = rep("caravanserail", nrow(ea.geojson.polygon)),
                 geometry = st_as_text(ea.geojson.polygon$geometry))
df <- head(df)

utils::write.csv2(df, paste0(out.dirPath, "/nodes.csv"), row.names = FALSE)
print(paste0("nodes dataframe (n = ", nrow(df), ") exported to: '", out.dirPath, "/nodes.csv'"))
# return(paste0(out.dirPath, "/nodes.csv"))


# ea.wkt <- geojsonsf::geojson_wkt(ea.geojson$geometry)

sf::st_as_text(ea.geojson)

conv_geojson_to_wkt(dataDir = mygeojson, out.dir = "_out")
