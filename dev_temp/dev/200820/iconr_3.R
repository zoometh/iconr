library(RPostgreSQL)
library(magick)
library(sp)
# library(rgdal)
library(raster)

# remove.packages("decorr", lib="~/R/win-library/3.6");.rs.restartR() # uninstall & restart session
devtools::install_github("zoometh/iconr",build_vignettes = T) # OK
library(aritmek4)

setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create")
doss.extdata <- "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata"
pck.create <- F
data.create <- T
funct.test <- F
if (pck.create){
  # devtools::create("iconr")
}

# DATA  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if (data.create){
  ## Get 1 decoration from Pg
  # extract nodes 
  ldecors <- list(list('Cerro Muriano','Cerro Muriano 1'),
                  list('Torrejon Rubio','Torrejon Rubio 1'))
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv,
                   dbname="mailhac_9",
                   host="localhost",
                   port=5432,
                   user="postgres",
                   password="postgres")
  for (a.dec in 1:length(ldecors)){
    # a.dec <- 1
    a.sit <- ldecors[[a.dec]][[1]]
    a.dec <- ldecors[[a.dec]][[2]]
    ## nodes
    # dataframe
    sqll.nodes <- paste0("SELECT site,decor,id,type,ST_X(geom) as x,ST_Y(geom) as y ",
                         "FROM table_noeuds WHERE site LIKE '",a.sit,"' AND decor LIKE '",a.dec,"'")
    a.decoration.nodes <- dbGetQuery(con,sqll.nodes)
    a.decoration.nodes.tsv <- a.decoration.nodes
    # shapefile
    xy <- a.decoration.nodes[,c("x","y")]
    a.decoration.nodes$x <- a.decoration.nodes$y <- NULL # x,y will be retrieve later
    a.decoration.nodes.shp <- SpatialPointsDataFrame(coords = xy,data = a.decoration.nodes)
    ## edges
    # dataframe
    sqll.edges <- paste0("SELECT site,decor,typ,a,b ",
                         "FROM table_liens WHERE site LIKE '",a.sit,"' AND decor LIKE '",a.dec,"'")
    a.decoration.edges <- dbGetQuery(con,sqll.edges)
    # shapefile
    sqll.edges.shp <- paste0("SELECT site,decor,typ,a,b,",
                             "ST_X(ST_StartPoint(geom)) as xa, ST_Y(ST_StartPoint(geom)) as ya, ",
                             "ST_X(ST_EndPoint(geom)) as xb, ST_Y(ST_EndPoint(geom)) as yb ",
                             "FROM table_liens WHERE site LIKE '",a.sit,"' AND decor LIKE '",a.dec,"'")
    a.decoration.edges.shp <- dbGetQuery(con,sqll.edges.shp)
    llines <- list()
    for (a.line in 1:nrow(a.decoration.edges.shp)){
      # a.line <- 1
      # ID <- a.decoration.edges.shp[a.line,"xa"]
      xa <- a.decoration.edges.shp[a.line,"xa"]
      xb <- a.decoration.edges.shp[a.line,"ya"]
      ya <- a.decoration.edges.shp[a.line,"xb"]
      yb <- a.decoration.edges.shp[a.line,"yb"]
      l1 <- cbind(c(xa,ya), c(xb,yb))
      Sl1 <- Line(l1)
      S1 <- Lines(list(Sl1), ID = a.line)
      llines[[length(llines)+1]] <- S1
    }
    a.decoration.edges.shp.df <- subset(a.decoration.edges.shp,select=c("site","decor","typ","a","b"))
    Sl <- SpatialLines(llines)
    a.decoration.edges.shp.out <-SpatialLinesDataFrame(Sl, a.decoration.edges.shp.df)
    # image
    sqll.img <- paste0("SELECT site,numero,img ",
                       "FROM objets WHERE site LIKE '",a.sit,"' AND numero LIKE '",a.dec,"'")
    a.decoration.img <- dbGetQuery(con,sqll.img)
    # tmpF <- tempfile(fileext=".jpg")
    # save.image(a.img,tmpF)
    dbDisconnect(con)
  }
  ### harmonize & write - - - - - - - - - - - - - - - - - 
  ## nodes
  write.table(a.decoration.nodes.tsv, file=paste0(doss.extdata,'/nodes.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.nodes.shp, filename=paste0(doss.extdata,'/nodes.shp'),overwrite=TRUE) # -> shp
  ## edges
  colnames(a.decoration.edges)[which(names(a.decoration.edges) == "typ")] <- "type"
  write.table(a.decoration.edges, file=paste0(doss.extdata,'/edges.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.edges.shp.out, filename=paste0(doss.extdata,'/edges.shp')) # -> shp
  ## image
  a.img <- a.decoration.img$img 
  a.img <- gsub('%20',' ',a.img) # remove %20 used by windows
  out.img.name <- paste0(a.sit,'.',a.dec,'.jpg')
  out.img.name <- gsub(' ','_',out.img.name)
  # image df
  a.img.df <- data.frame(site=a.sit,
                         decor=a.dec,
                         img=out.img.name)
  write.table(a.img.df, file=paste0(doss.extdata,'/imgs.tsv'), quote=FALSE, sep='\t') # -> tsv
  # image, TODO: possible to put all images in a single subfolder ?
  a.img.magick <- image_read(a.img)
  image_write(a.img.magick,paste0(doss.extdata,'/',out.img.name),format = "jpg")
}
# FUNCTIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if(funct.test){
  
  labels.shadow <- function(x, y=NULL, labels, col='white', bg='black', 
                              theta= seq(0, 2*pi, length.out=50), r=0.1, ... ) {
    # TODO: credits
    # drop shadow
    xy <- xy.coords(x,y)
    xo <- r*strwidth('A')
    yo <- r*strheight('A')
    # draw background text with small shift in x and y in background colour
    for (i in theta) {
      text( xy$x + cos(i)*xo, xy$y + sin(i)*yo, labels, col=bg, ... )
    }
    # draw actual text in exact xy position in foreground colour
    text(xy$x, xy$y, labels, col=col, ... )
  }
  
  labels.shadow <- function(x, y=NULL, labels, col='white', bg='black',
                            theta= seq(0, 2*pi, length.out=50), r=0.1, ... ) {
    # TODO: credits
    # drop shadow
    xy <- xy.coords(x,y)
    r=0.1
    xo <- r*strwidth('A')
    yo <- r*strheight('A')
    # draw background text with small shift in x and y in background colour
    theta= seq(0, 2*pi, length.out=50)
    for (i in theta) {
      text( xy$x + cos(i)*xo, xy$y + sin(i)*yo, labels,col='black', ... )
    }
    # draw actual text in exact xy position in foreground colour
    text(xy$x, xy$y, labels, col='white', ... )
  }
  
  # f.annotate <- function(img,sit.a,num.a,sv=''){
  #   ## annotations
  #   # studied variable up
  #   if(length(sv)>0){
  #     img <- image_annotate(img, sv, size = 30,
  #                           gravity = "northwest", color = "black")
  #   }
  #   # decor title down
  #   tit.img <- paste0(sit.a,"\n",num.a)
  #   img <- image_annotate(img, tit.img, size = 30,
  #                         gravity = "southwest", color = "black")
  # }
  # 
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
  nds.df <- read.nds(doss.extdata,"nodes",".shp")
  nds.df <- read.nds(doss.extdata,"nodes",".tsv")
  
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
        nds.df <- read.nds(doss.extdata,"nodes",".shp")
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
  eds.df <- read.eds(doss = "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata",
                     site = "Cerro Muriano",
                     decor = "Cerro Muriano 1",
                     "edges",dev = ".shp")
  eds.df <- read.eds(doss = "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata",
                     site = "Cerro Muriano",
                     decor = "Cerro Muriano 1",
                     "edges",dev=".tsv")  
  
  plot.dec.grph <- function(nds.df,
                       eds.df,
                       doss,site,decor,
                       shw=c("nodes"),
                       nd.color='orange',
                       nd.size=1.7,
                       lbl.txt='id',
                       lbl.color='orange',
                       lbl.size=1.2,
                       ed.color='orange',
                       ed.lwd=4){
    ## plot nodes on image
    # lbl.txt = 'id' ; nd.color <- lbl.color <- ed.color <- 'orange'
    # lbl.size=1.2 ; nd.size=1.7 ; ed.lwd <- 4
    # site <- "Cerro Muriano" ; decor <- "Cerro Muriano 1" ; 
    # shw <- "edges" ; shw <- c("nodes","edges")
    ## nodes
    # select
    nds.df.select <- nds.df[nds.df[,"site"]==site & nds.df[,"decor"]==decor,]
    ## image
    imgs <- read.table(file = paste0(doss,"/imgs.tsv"), sep = '\t', header = TRUE)
    # select
    img.select <- imgs[imgs[,"site"]==site & imgs[,"decor"]==decor,]
    img.select <- img.select$img
    # load
    img.in <- magick::image_read(paste0(doss,'/',img.select))
    img.out <- magick::image_draw(img.in)
    print(shw)
    if ("edges" %in% shw){
      for (edg in 1:nrow(eds.df)){
        # edg <- 1
        # type of edge
        ed.type <- ifelse(is.na(eds.df[edg,"type"]),1,
                          ifelse(eds.df[edg,"type"]=='+',2,1)
        )
        lines(c(eds.df[edg,"xa"],eds.df[edg,"xb"]),
              c(abs(eds.df[edg,"ya"]),abs(eds.df[edg,"yb"])),
              lty=ed.type,
              lwd=ed.lwd,col=ed.color)
      }
    }
    if ("nodes" %in% shw){
      ## loop through nodes to plot them and labels
      for (n in 1:nrow(nds.df.select)){
        # n <- 1
        ax <- nds.df.select[n,"x"] ; ay <- abs(nds.df.select[n,"y"]) # coordinates
        lbl <- nds.df.select[n,lbl.txt] # labels
        points(ax,ay,
               pch=21,
               col=nd.color,
               bg=nd.color,
               cex=nd.size)
        # labels shadow
        # labels.shadow <- function(x, y=NULL, labels, col='white', bg='black', 
        #                           theta= seq(0, 2*pi, length.out=50), r=0.1, ... ) {
        # TODO: credits
        # drop shadow
        # xy <- xy.coords(ax,ay)
        # r=0.2
        # xo <- r*strwidth('A')
        # yo <- r*strheight('A')
        # # draw background text with small shift in x and y in background colour
        # theta= seq(0, 2*pi, length.out=50)
        # for (i in theta) {
        #   text(xy$x+cos(i)*xo, xy$y+sin(i)*yo,
        #        lbl, col=lbl.color, bg="white", cex=lbl.size, pos=3)
        # }
        labels.shadow(ax,ay,
                      label=lbl,
                      col=lbl.color,
                      bg="white",
                      cex=lbl.size,
                      r=0.2,
                      pos=3)
      }
    }
    ## annotate
    # studied variable up
    img.out <- image_annotate(img.out, lbl.txt, size = 30,
                              gravity = "northwest", color = "black")
    # decor title down
    tit.img <- paste0(site,"\n",decor)
    img.out <- image_annotate(img.out, tit.img, size = 30,
                              gravity = "southwest", color = "black")
    # img.out <- f.annotate(img.out,site,decor)
    return(img.out)
  }
  img.nodes.labels <- plot.dec.grph(nds.df = nds.df,
                                    eds.df = eds.df,
                                    doss = "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata",
                                    site = "Cerro Muriano",
                                    decor = "Cerro Muriano 1",
                                    lbl.txt = "id",
                                    shw = c("nodes","edges")
  )
  img.nodes.labels
}

# f.edge.plot
# for (edg in 1:nrow(graph.j)){
#   lines(c(graph.j[edg,"xa"],graph.j[edg,"xb"]),
#         c(graph.j[edg,"ya"],graph.j[edg,"yb"]),
#         lwd=4,col="orange")
# }
