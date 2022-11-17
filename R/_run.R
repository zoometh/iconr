# library(sf)
library(Momocs)
library(iconr)

########## shape analysis ##########################

dataDir <- "C:/Rprojects/eamena-arches-dev/projects/caravanserail"
nodes <- conv_geojson_to_wkt(dataDir = dataDir)
conv_wkt_to_jpg(nodes = nodes,
                ids = "site",
                dataDir = dataDir,
                out.dir = "_out")

# dataDir <- "C:/Rprojects/eamena-arches-dev/projects/caravanserail"
# out.dirPath <- paste0(dataDir, "/_out")
# geojson.path <- "C:/Rprojects/eamenaR/inst/extdata/caravanserail_polygon.geojson"
# dir.create(file.path(out.dirPath), showWarnings = FALSE)
# ea.geojson <- geojsonsf::geojson_sf(geojson.path)
# ea.geojson.polygon <- ea.geojson[sf::st_geometry_type(ea.geojson$geometry) == "POLYGON" | sf::st_geometry_type(ea.geojson$geometry) == "MULTIPOLYGON", ]
# # all multi
# ea.geojson.polygon$geometry <- sf::st_cast(ea.geojson.polygon$geometry, "POLYGON")
# # conform to iconr format
# df <- data.frame(site = ea.geojson.polygon[["EAMENA ID"]],
#                  decor = rep("crvn", nrow(ea.geojson.polygon)),
#                  id = rep(1, nrow(ea.geojson.polygon)),
#                  type = rep("caravanserail", nrow(ea.geojson.polygon)),
#                  technlg = rep("-", nrow(ea.geojson.polygon)),
#                  incmplt = rep(0, nrow(ea.geojson.polygon)),
#                  geometry = sf::st_as_text(ea.geojson.polygon$geometry))
# df <- head(df, 50)
# nd.df.path <- paste0(out.dirPath, "/nodes.csv")
# utils::write.csv2(df, nd.df.path, row.names = FALSE)
# print(paste0("nodes dataframe (n = ", nrow(df), ") exported to: '", nd.df.path, "'"))

########### wkt to jpg ##############################

# nodes <- read.csv(nd.df.path, sep = ";")
conv_wkt_to_jpg(nodes = nodes,
                ids = "site",
                dataDir = dataDir,
                out.dir = "_out")
dist <- morph_nds_compar(nodes = nodes,
                         cex = .5,
                         lwd = .5,
                         colored = FALSE,
                         dataDir = dataDir,
                         out.dir = "_out")
mbrshp <- morph_nds_group(nodes = nodes,
                          nb.centers = 2,
                          dataDir = dataDir,
                          out.dir = "_out")
