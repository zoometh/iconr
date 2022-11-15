# library(sf)
library(iconr)

########## geojson to wkt ##########################

geojson.path <- "C:/Rprojects/eamenaR/inst/extdata/caravanserail_polygon.geojson"
dataDir <- "C:/Rprojects/eamena-arches-dev/projects/caravanserail"
out.dirPath <- paste0(dataDir, "/_out")
dir.create(file.path(out.dirPath), showWarnings = FALSE)
ea.geojson <- geojsonsf::geojson_sf(geojson.path)
ea.geojson.polygon <- ea.geojson[sf::st_geometry_type(ea.geojson$geometry) == "POLYGON" | sf::st_geometry_type(ea.geojson$geometry) == "MULTIPOLYGON", ]
# all multi
ea.geojson.polygon$geometry <- sf::st_cast(ea.geojson.polygon$geometry, "POLYGON")
# conform to iconr format
df <- data.frame(site = ea.geojson.polygon[["EAMENA ID"]],
                 decor = rep("crvn", nrow(ea.geojson.polygon)),
                 type = rep("caravanserail", nrow(ea.geojson.polygon)),
                 technlg = rep("-", nrow(ea.geojson.polygon)),
                 incmplt = rep(0, nrow(ea.geojson.polygon)),
                 geometry = sf::st_as_text(ea.geojson.polygon$geometry))
df <- head(df)
nd.df.path <- paste0(out.dirPath, "/nodes.csv")
utils::write.csv2(df, nd.df.path, row.names = FALSE)
print(paste0("nodes dataframe (n = ", nrow(df), ") exported to: '", nd.df.path, "'"))

########### wkt to jpg ##############################

nodes <- read.csv(nd.df.path, sep = ";")
nodes$id <- 1
conv_wkt_to_jpg(nodes = nodes,
                dataDir = dataDir,
                out.dir = "_out")
morph_nds_group(nodes = nodes,
                cex = .5,
                lwd = .5,
                dataDir = dataDir,
                out.dir = "_out")
