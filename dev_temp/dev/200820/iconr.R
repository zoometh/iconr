library(RPostgreSQL)
library(magick)
library(sp)
# library(rgdal)
library(raster)

setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create")
doss.extdata <- "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata/"
pck.create <- F
data.create <- F
funct.test <- T
if (pck.create){
  # devtools::create("iconr")
}
if (data.create){
  ## Get 1 decoration from Pg
  # extract nodes 
  ldecors <- list(list('Cerro Muriano','Cerro Muriano 1'))
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
    sqll.nodes <- paste0("SELECT site,decor,type,ST_X(geom) as x,ST_Y(geom) as y ",
                         "FROM table_noeuds WHERE site LIKE '",a.sit,"' AND decor LIKE '",a.dec,"'")
    a.decoration.nodes <- dbGetQuery(con,sqll.nodes)
    # shapefile
    xy <- a.decoration.nodes[,c("x","y")]
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
    # Sl1 <- Line(l1)
    # l1 <- cbind(c(1, 2, 3), c(3, 2, 2))
    # l2 <- cbind(c(1, 2, 3), c(1, 1.5, 1))
    # 
    # Sl1 <- Line(l1)
    # image
    sqll.img <- paste0("SELECT site,numero,img ",
                       "FROM objets WHERE site LIKE '",a.sit,"' AND numero LIKE '",a.dec,"'")
    a.decoration.img <- dbGetQuery(con,sqll.img)
    # tmpF <- tempfile(fileext=".jpg")
    # save.image(a.img,tmpF)
    dbDisconnect(con)
  }
  ## harmonize & write - - - - - - - - - - - - - - - - - 
  # nodes
  write.table(a.decoration.nodes, file=paste0(doss.extdata,'nodes.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.nodes.shp, filename=paste0(doss.extdata,'nodes.shp')) # -> shp
  # edges
  colnames(a.decoration.edges)[which(names(a.decoration.edges) == "typ")] <- "type"
  write.table(a.decoration.edges, file=paste0(doss.extdata,'edges.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.edges.shp.out, filename=paste0(doss.extdata,'edge.shp')) # -> shp
  # image, TODO: possible to put all images in a single subfolder ?
  a.img <- a.decoration.img$img 
  a.img <- gsub('%20',' ',a.img) # remove %20 used by windows
  a.img.magick <- image_read(a.img)
  out.img.name <- paste0(a.sit,'.',a.dec,'.jpg')
  out.img.name <- gsub(' ','_',out.img.name)
  image_write(a.img.magick,paste0(doss.extdata,out.img.name),format = "jpg")
}
if(funct.test){
  
  print ("YA")
  
}

# f.edge.plot
# for (edg in 1:nrow(graph.j)){
#   lines(c(graph.j[edg,"xa"],graph.j[edg,"xb"]),
#         c(graph.j[edg,"ya"],graph.j[edg,"yb"]),
#         lwd=4,col="orange")
# }
