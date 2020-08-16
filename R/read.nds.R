read.nds <- function(doss=getwd(),site,decor,nodes="nodes",dev=".tsv"){
  # doss <- doss.extdata ; nodes <- "nodes" ; dev <- ".shp"
  # doss <- doss.extdata ; nodes <- "nodes" ; dev <- ".tsv"
  # read nodes from .tsv or shapefile
  # TODO: read .csv
  if(dev==".tsv"){
    nds.df <- read.table(file = paste0(doss,"/",nodes,dev), sep = '\t', header = TRUE)
    nds.df <- nds.df[nds.df[,"site"]==site & nds.df[,"decor"]==decor,]
  }
  if(dev==".shp"){
    nds.shp <- rgdal::readOGR(dsn = doss, layer = nodes, verbose=F)
    nds.shp.coords <- nds.shp@coords
    colnames(nds.shp.coords) <- c("x","y")
    nds.df <- nds.shp@data
    nds.df <- cbind(nds.df,nds.shp.coords)
    nds.df <- nds.df[nds.df[,"site"]==site & nds.df[,"decor"]==decor,]
  }
  return(nds.df)
}
