library(RPostgreSQL)
library(magick)
library(sp)
# library(rgdal)
library(raster)

# for test
setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata")

pck.run <- F
pck.create <- F
fig.create <- F
funct.test <- F
data.create <- T

if (pck.run){
  decor.thumb <- function(idf,geom=300){
    image_scale(image_read(imgs[idf,"img"]),geom) # vignette
  }
  # use a sample
  # imgs <- subset(imgs,site %in% c("Cerro Muriano","Zarza de Montanchez"))
  # nodes <- subset(nodes,site %in% c("Cerro Muriano","Zarza de Montanchez"))
  # edges <- subset(edges,site %in% c("Cerro Muriano" ,"Zarza de Montanchez"))
  remove.packages("iconr", lib="~/R/win-library/4.0")
  # remove.packages("reshape", lib="~/R/win-library/3.6")
  rm(list=ls()) # remove all Globs var
  .rs.restartR() # uninstall & restart session
  # invisible(lapply(paste0('package:', names(sessionInfo()$otherPkgs)), detach, character.only=TRUE, unload=TRUE))
  # unload all packages
  devtools::install_github("zoometh/iconr")
  devtools::install_github("zoometh/iconr", build_vignettes=TRUE)
  library(iconr)
  # set wd to data folder
  dataDir <- system.file("extdata", package = "decorr")

  # read graphs
  imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                     sep="\t",stringsAsFactors = FALSE, header = T)
  nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = FALSE)
  edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = FALSE)
  # create another variable 'color' for node
  colors <- c(rep("black",20),rep("red",20),rep("yellow",20),rep("green",20))
  nodes$colors <- sample(colors, nrow(nodes))
  #♠ see g.compar[[6]]
  lgrph <- list_dec(imgs,nodes,edges)
  g.compar <- list_compar(lgrph,"colors")
  edges[43,"type"] <- "=" # modify to check same edges
  same_elements()

  ## plot
  nds.df <- read_nds(site = "Brozas",decor = "Brozas",dev = ".tsv", doss = dataDir)
  eds.df <- read_eds(site = "Brozas", decor = "Brozas",dev = ".shp", doss = dataDir)
  img.graph <- plot_dec_grph(nodes = nds.df,
                             edges = eds.df,
                             site = "Brozas",
                             decor = "Brozas",
                             doss = dataDir,
                             nds.lbl = "type"
                             # shw = c("nodes","edges")
  )
  image_browse(img.graph)
  ### compar
  ## list
  imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                     sep="\t",stringsAsFactors = FALSE)
  nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = FALSE)
  edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = FALSE)
  lgrph <- list_dec(imgs, nodes, edges)
  g.compar <- list_compar(lgrph, "type")
  length(g.compar)
  # nodes
  igraph::as_data_frame(g.compar[[2]][[1]], "vertices")
  igraph::as_data_frame(g.compar[[2]][[2]], "vertices")
  # edges
  igraph::as_data_frame(g.compar[[6]][[1]], "edges")
  igraph::as_data_frame(g.compar[[6]][[2]], "edges")
  ## plot

  nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1", dev = ".tsv", doss = dataDir)
  colors <- c(rep("black",20),rep("red",20),rep("yellow",20),rep("green",20))
  nds.df$colors <- sample(colors, nrow(nds.df))
  eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1", dev = ".shp", doss = dataDir)
  img.graph <- plot_dec_grph(nodes = nds.df, nds.lbl = 'colors',
                             edges = eds.df,
                             site = "Cerro Muriano",
                             decor = "Cerro Muriano 1",
                             doss = dataDir)
  image_browse(img.graph)

  length(g.compar)

  compar_nds_1_4 <- plot_compar(g.compar, c(2,3), focus = "edges", doss= dataDir)
  image_read(compar_nds_1_4)
  # nodes
  compar_nds_1_4 <- plot_compar(g.compar,c(2,4),focus = "nodes",doss= dataDir)
  image_read(compar_nds_1_4)
  ## same matrices
  # same nodes
  df.same_nodes <- same_elements(lgrph, "type", "nodes")
  df.same_nodes
  # same edges
  df.same_edges <- same_elements(lgrph, "type", "edges")
  df.same_edges

  # read data
  imgs <- read.table(system.file("extdata", "imgs.csv", package = "decorr"),
                     sep="\t",stringsAsFactors = FALSE)
  # nds.df <- read_nds(site = "Cerro Muriano",decor = "Cerro Muriano 1",dev = ".tsv", doss=incor.data.path)
  # eds.df <- read_eds(site = "Cerro Muriano",decor = "Cerro Muriano 1",dev = ".shp", doss=incor.data.path)

  nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = FALSE)
  edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = FALSE)
  lgrph <- list_dec(imgs,nodes,edges,var="type")
  g.compar <- list_eds_compar(lgrph,var="type")
  plot_eds_compar(g.compar,c(1,4))
  # create the list of graphs
  lgrph <- list_dec(imgs,nodes,edges,var="type")
  # # get the first graph
  # g <- lgrph[[1]]
  setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata")
  # verbose <- T
  # common.eds.color <- "red"
  # different.eds.color <- "orange"
  g.compar <- list.grph.compar(lgrph,common.eds.color = "pink",common.eds.width = 3)
  plot_dec_grph(g.compar)
  img.graph <- plot_dec_grph(nds.df = nds.df,
                             eds.df = eds.df,
                             site = "Cerro Muriano",
                             decor = "Cerro Muriano 1",
                             lbl.txt = "type",
                             shw = c("nodes","edges"))
}
if (pck.create){
  # devtools::create("iconr")
}
if (fig.create){
  library(magick)
  setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata")
  imgs.df <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                        sep="\t", stringsAsFactors = FALSE)
  lbl.size <- 25
  lims <- list()
  for(i in 1:4){
    i1 <- magick::image_read(imgs.df[i,"img"])
    lbl.txt <- paste0(imgs.df[i,"idf"],"\n",
                      imgs.df[i,"site"],"\n",
                      imgs.df[i,"decor"],"\n",
                      imgs.df[i,"img"],"\n",
                      image_info(i1)$width,"*",image_info(i1)$height," px")
    i1 <- magick::image_annotate(i1,lbl.txt,location = "northwest",size = lbl.size, color = "red")
    lims[[length(lims)+1]]<- i1
  }
  setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/jss-article-rnw/imgs")
  # plot side-by-side
  out.img <- magick::image_append(c(image_append(c(lims[[1]],lims[[2]])),
                                    image_append(c(lims[[3]],lims[[4]]))),
                                  stack = TRUE)
  magick::image_write(out.img, path = "corpus.png", format = "png")
}
# DATA  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if (data.create){
  ## Get 1 decoration from Pg
  # extract nodes
  doss.extdata <- "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata"
  ldecors <- list(list('Cerro Muriano','Cerro Muriano 1'),
                  list('Torrejon Rubio','Torrejon Rubio 1'),
                  list('Brozas','Brozas'),
                  list('Zarza de Montanchez','Zarza De Montanchez'),
                  list('Ibahernando','Ibahernando'))
  drv <- dbDriver("PostgreSQL")
  con <- dbConnect(drv,
                   dbname="mailhac_9",
                   host="localhost",
                   port=5432,
                   user="postgres",
                   password="postgres")
  a.decoration.nodes <- data.frame(site=character(0),
                                   decor=character(0),
                                   id=numeric(0),
                                   type=character(0),
                                   x=numeric(0),
                                   y=numeric(0),
                                   stringsAsFactors = F)
  a.decoration.edges <- data.frame(site=character(0),
                                   decor=character(0),
                                   a=numeric(0),
                                   b=numeric(0),
                                   typ=character(0),
                                   stringsAsFactors = F)
  a.decoration.edges.shp <- data.frame(site=character(0),
                                       decor=character(0),
                                       a=numeric(0),
                                       # b ???
                                       typ=character(0),
                                       xa=numeric(0),
                                       ya=numeric(0),
                                       xb=numeric(0),
                                       yb=numeric(0),
                                       stringsAsFactors = F)
  a.decoration.img  <- data.frame(site=character(0),
                                  numero=character(0),
                                  img=character(0),
                                  stringsAsFactors = F)
  for (a.dec in 1:length(ldecors)){
    # a.dec <- 1
    a.sit <- ldecors[[a.dec]][[1]]
    a.dec <- ldecors[[a.dec]][[2]]
    print(paste0("*read ",a.sit,'.',a.dec))
    ## nodes
    # dataframe
    sqll.nodes <- paste0("SELECT site,decor,id,type,ST_X(geom) as x,ST_Y(geom) as y ",
                         "FROM table_noeuds WHERE site LIKE '",a.sit,"' AND decor LIKE '",a.dec,"'")
    a.decoration.nodes <- rbind(a.decoration.nodes,dbGetQuery(con,sqll.nodes))
    ## edges
    sqll.edges <- paste0("SELECT site,decor,a,b,typ ",
                         "FROM table_liens WHERE site LIKE '",a.sit,"' AND decor LIKE '",a.dec,"'")
    a.decoration.edges <- rbind(a.decoration.edges,dbGetQuery(con,sqll.edges))
    # shapefile
    sqll.edges.shp <- paste0("SELECT site,decor,a,b,typ as type, ",
                             "ST_X(ST_StartPoint(geom)) as xa, ST_Y(ST_StartPoint(geom)) as ya, ",
                             "ST_X(ST_EndPoint(geom)) as xb, ST_Y(ST_EndPoint(geom)) as yb ",
                             "FROM table_liens WHERE site LIKE '",a.sit,"' AND decor LIKE '",a.dec,"'")
    a.decoration.edges.shp <- rbind(a.decoration.edges.shp, dbGetQuery(con,sqll.edges.shp))
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
    a.decoration.edges.shp.df <- subset(a.decoration.edges.shp,select=c("site","decor","a","b","type"))
    a.decoration.edges.shp.df$type[is.na(a.decoration.edges.shp.df$type)] <- "=" # change NA to =
    Sl <- SpatialLines(llines)
    a.decoration.edges.shp.out <-SpatialLinesDataFrame(Sl, a.decoration.edges.shp.df)
    # image
    sqll.img <- paste0("SELECT site,numero,img ",
                       "FROM objets WHERE site LIKE '",a.sit,"' AND numero LIKE '",a.dec,"'")
    img.a <- dbGetQuery(con,sqll.img)
    # export the image
    a.img.magick <- gsub('%20',' ',img.a$img) # remove %20 used by windows
    a.img.magick <- image_read(a.img.magick)
    out.img.name <- paste0(a.sit,'.',a.dec,'.jpg')
    out.img.name <- gsub(' ','_',out.img.name)
    image_write(a.img.magick,paste0(doss.extdata,'/',out.img.name),format = "jpg")
    # image df
    a.decoration.img <- rbind(a.decoration.img,dbGetQuery(con,sqll.img)) # appen
    # image, TODO: possible to put all images in a single subfolder ?
  }
  dbDisconnect(con)
  # convert to shapefile
  xy <- a.decoration.nodes[,c("x","y")]
  # a.decoration.nodes$x <- a.decoration.nodes$y <- NULL # x,y will be retrieve later
  a.decoration.nodes.shp <- a.decoration.nodes
  a.decoration.nodes.shp$x <- a.decoration.nodes.shp$y <- NULL # x,y will be retrieve later
  a.decoration.nodes.shp <- SpatialPointsDataFrame(coords = xy,data = a.decoration.nodes)
  ### harmonize & write - - - - - - - - - - - - - - - - -
  ## nodes
  write.table(a.decoration.nodes, file=paste0(doss.extdata,'/nodes.csv'), quote=FALSE, sep=';') # -> csv
  write.table(a.decoration.nodes, file=paste0(doss.extdata,'/nodes.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.nodes.shp, filename=paste0(doss.extdata,'/nodes.shp'),overwrite=TRUE) # -> shp
  ## edges
  colnames(a.decoration.edges)[which(names(a.decoration.edges) == "typ")] <- "type"
  a.decoration.edges$type[is.na(a.decoration.edges$type)] <- "=" # change NA to =
  write.table(a.decoration.edges, file=paste0(doss.extdata,'/edges.csv'), quote=FALSE, sep=';') # -> csv
  write.table(a.decoration.edges, file=paste0(doss.extdata,'/edges.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.edges.shp.out, filename=paste0(doss.extdata,'/edges.shp',overwrite=TRUE)) # -> shp
  ## image df
  colnames(a.decoration.img)[which(names(a.decoration.img) == "numero")] <- "decor"
  a.decoration.img$idf <- 1:nrow(a.decoration.img)
  a.decoration.img$img <- gsub('%20',' ',a.decoration.img$img) # remove %20 used by windows
  a.decoration.img$img <- gsub(' ','_',paste0(a.decoration.img$site,'.',a.decoration.img$decor,'.jpg'))
  a.decoration.img <- a.decoration.img[,c(4,1,2,3)]
  write.table(a.decoration.img, file=paste0(doss.extdata,'/imgs.csv'), quote=FALSE, sep=';') # -> csv
  write.table(a.decoration.img, file=paste0(doss.extdata,'/imgs.tsv'), quote=FALSE, sep='\t') # -> tsv
}
# FUNCTIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if(funct.test){
  # compare.graph <- function(nodes="nodes",edges="edges",compare=c("nodes","edges")){
  #
  # }
  # FUNCTION TOD COMPLETE ....
  imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                     sep="\t",stringsAsFactors = F)
  nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = F)
  edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                      sep="\t",stringsAsFactors = F)
  # create lis of graphs
  lgraphs <- list()
  for (r in 1:nrow(imgs)){
    # r <- 1
    a.enr <- imgs[r,]
    a.site <- a.enr$site ; a.decor <- a.enr$decor ; a.idf <- a.enr$idf
    g.nodes <- subset(nodes, site == a.site & decor == a.decor) # nodes
    g.nodes <- subset(g.nodes, select=-c(site,decor))
    g.edges <- subset(edges, site == a.site & decor == a.decor) # edges
    g.edges <- subset(g.edges, select=-c(site,decor))
    # create graph
    g <- graph_from_data_frame(g.edges, directed = FALSE, vertices= g.nodes)
    g.nodes.idf <- V(g)$name # get name of vertices
    V(g)$name <- V(g)$type # remplace les numeros par leur types # TODO select other fields
    V(g)$idf <- g.nodes.idf
    g$name <- a.idf # graph name
    # g$name <- paste0(as.character(r),"-",a.site,'.',a.decor) # name
    lgraphs[[length(lgraphs)+1]] <- g
  }

  same.eds <- function(lgrph){
    # find same edges within a pairwise comparison of graphs
    # output a square matrix
    # lgrph <- load.graphs(graphs.objects) ; rm.att <- c("")
    # lgrph <- lgraphs
    lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name)) # get names
    mat.same_edges <- matrix(nrow = length(lgrph),
                             ncol = length(lgrph))
    mat.same_edges <- as.data.frame(mat.same_edges)
    rownames(mat.same_edges) <- colnames(mat.same_edges)<- lgrph_nmes
    mat.same_edges[is.na(mat.same_edges)] <- 0 # replace NA with 0
    # lgrph_nmes <- c()
    # for (i in 1:length(lgrph)){
    #   lgrph_nmes <- c(lgrph_nmes,lgrph[[i]]$name)
    #   print (lgrph[[i]]$name)
    # }
    # identify same edges btw graphs
    # return all edges as a vector character

    # list all edges
    tot.edges <- data.frame("V1"=character(),
                            "V2"=character(),
                            "type"=character(),
                            stringsAsFactors=FALSE)
    # all unique type of edges
    for(i in 1:length(lgrph)){
      # i <- 1
      a.g <- lgrph[[i]]
      #print(paste0(i,".",a.g$name))
      g.edg <- as.data.frame(as_edgelist(a.g)) # edges
      g.edg$type <- edge.attributes(a.g)$type #
      # if (rm.attributes){
      #   g.edg <- g.edg[g.edg$typ != "+",]
      # }
      tot.edges <- rbind(tot.edges,g.edg)
    }
    #tot.edges$typ[is.na(tot.edges$typ)] <- "=" # change NA to =
    # opt suppress duplicated
    tot.edges <- tot.edges[!duplicated(t(apply(tot.edges[c("V1", "V2","type")], 1, sort))), ]
    sel.edges <- paste0(tot.edges[,1],tot.edges[,"type"],tot.edges[,2]) # like "nez=vide"
    # sel.edges <- f.tot.edges(lgrph)
    df.typ_edges <- f.typ.edges(sel.edges,lgrph) # call function
    # at least a common edge appears 2 times, limit the df
    df.typ_edges.sub <- df.typ_edges[,colSums(df.typ_edges) > 1]
    for (c in 1:ncol(df.typ_edges.sub)){
      #c <- 2
      a.col <- df.typ_edges.sub[,c] # get column
      # at least 2 decoration without 0
      if(length(a.col[!a.col %in% 0]) > 1){
        idxs <- which(a.col %in% c(1:100)) # count of egal betw 1 and Inf
        all.comb <- subset(expand.grid(rep(list(idxs),2)), Var1 != Var2)
        for (r in 1:nrow(all.comb)){
          #r <- 1
          x <- all.comb[r,"Var1"];y <- all.comb[r,"Var2"]
          mat.same_edges[x,y] <- mat.same_edges[x,y]+1
          mat.same_edges[y,x] <- mat.same_edges[y,x]+1
        }
      }
    }
    # divide all cells by 2 (symetry)
    mat.same_edges[] <- lapply(mat.same_edges, function(x) x/2)
    colnames(mat.same_edges) <- row.names(mat.same_edges) <- lgrph_nmes
    return(mat.same_edges)
  }

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
      nds.df <- nds.df[nds.df[,"site"]==site & nds.df[,"decor"]==decor,]

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
    # doss <-
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
  img.graph <- plot.dec.grph(nds.df = nds.df,
                                    eds.df = eds.df,
                                    doss = "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata",
                                    site = "Cerro Muriano",
                                    decor = "Cerro Muriano 1",
                                    lbl.txt = "id",
                                    shw = c("nodes","edges")
  )
  img.graph
}

