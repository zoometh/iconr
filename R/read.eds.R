read.eds <- function(doss,site,decor,edges,nodes="nodes",dev=".tsv"){
  # doss <- doss.extdata ; edges <- "edges" ; dev <- ".shp"
  # doss <- doss.extdata ; edges <- "edges" ; dev <- ".tsv"
  # nodes <- "nodes"
  # site <- "Cerro Muriano" ; decor <- "Cerro Muriano 1"
  # read nodes from .tsv or shapefile
  # TODO: read .csv
  eds.shp.coords <- data.frame(xa=numeric(0),
                               ya=numeric(0),
                               xb=numeric(0),
                               yb=numeric(0))
  if(dev==".tsv"){
    # read nodes to get coordinates
    flag.coords <- F
    if(file.exists(paste0(doss,'/',nodes,".tsv"))){
      nds.df <- read.nds(doss,nodes,".tsv")
      flag.coords <- T
    }
    if(file.exists(paste0(doss,'/',nodes,".shp"))){
      nds.df <- read.nds(doss,"nodes",".shp")
      flag.coords <- T
    }
    if(!flag.coords){
      return(paste0("Error: coordinates of the edges cannot be calculated",
                    "\ncreate first a nodes dataframe or a nodes shapefile",
                    "\nor create a shapefile for the edges"))
    }
    eds.df <- read.table(file = paste0(doss,"/",edges,dev), sep = '\t', header = TRUE)
    eds.df <- eds.df[eds.df[,"site"]==site & eds.df[,"decor"]==decor,]
    # get coordinates from nodes
    for (a.edge in 1:nrow(eds.df)){
      # a.edge <- 1
      nd.a <- eds.df[a.edge,"a"]
      nd.b <- eds.df[a.edge,"b"]
      xa <- nds.df[nds.df[,"id"]==nd.a,"x"]
      ya <- nds.df[nds.df[,"id"]==nd.a,"y"]
      xb <- nds.df[nds.df[,"id"]==nd.b,"x"]
      yb <- nds.df[nds.df[,"id"]==nd.b,"y"]
      eds.shp.coords[nrow(eds.shp.coords)+1,] <- c(xa,ya,xb,yb)
    }
    eds.df <- cbind(eds.df,eds.shp.coords)
  }
  if(dev==".shp"){
    eds.shp <- rgdal::readOGR(dsn = doss, layer = edges)
    # extract edges coordinates
    coords.eds <- lapply(slot(eds.shp, "lines"), function(x) lapply(slot(x, "Lines"),
                                                                    function(y) slot(y, "coords")))
    # loop to get coordinates and fill df
    for (a.edge in 1:length(coords.eds)){
      # a.edge <- 1
      a.df <- coords.eds[[a.edge]][[1]]
      xa <- a.df[1,1];ya <- a.df[1,2];xb <- a.df[2,1];yb <- a.df[2,2];
      eds.shp.coords[nrow(eds.shp.coords)+1,] <- c(xa,ya,xb,yb)
      # coords.df <- as.data.frame(rbind(coords.df,c(xa,ya,xb,yb)))
    }
    eds.df <- eds.shp@data
    eds.df <- cbind(eds.df,eds.shp.coords)
  }
  return(eds.df)
}
