read.nds <- function(doss,nodes,dev=".tsv"){
  # doss <- doss.extdata ; nodes <- "nodes" ; dev <- ".shp"
  # doss <- doss.extdata ; nodes <- "nodes" ; dev <- ".tsv"
  # read nodes from .tsv or shapefile
  # TODO: read .csv
  if(dev==".tsv"){
    nds.df <- read.table(file = paste0(doss,"/",nodes,dev), sep = '\t', header = TRUE)
  }
  if(dev==".shp"){
    nds.shp <- rgdal::readOGR(dsn = doss, layer = nodes)
    nds.shp.coords <- nds.shp@coords
    colnames(nds.shp.coords) <- c("x","y")
    nds.df <- nds.shp@data
    nds.df <- cbind(nds.df,nds.shp.coords)
  }
  return(nds.df)
}