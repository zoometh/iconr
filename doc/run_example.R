devtools::install_github("zoometh/iconr")
library(iconr)

dataDir <- system.file("extdata", package = "iconr")
nd.df.path <- conv_shp_to_wkt(dataDir = dataDir)
nodes <- read.csv(nd.df.path, sep = ";")
conv_wkt_to_jpg(nodes = nodes)
morph_nds_compar(nodes, focus = c("panel"))
ldist <- morph_nds_compar(nodes, focus = c("dist"))
