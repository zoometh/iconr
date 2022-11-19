library(RPostgreSQL)
library(magick)
library(sp)
# library(rgdal)
library(raster)

# for test
setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create")

pck.run <- F
pck.create <- F
data.create <- T
funct.test <- F

if (pck.run){
  decor.thumb <- function(idf,geom=300){
    image_scale(image_read(imgs[idf,"img"]),geom) # vignette
  }
  remove.packages("decorr", lib="~/R/win-library/3.6")
  rm(list=ls()) # remove all Globs var
  .rs.restartR() # uninstall & restart session
  devtools::install_github("zoometh/iconr")
  # devtools::install_github("zoometh/aritmek4",build_vignettes = T)
  library(decorr)
  # ls("package:decorr")
  # load nodes.tsv
  # doss <- system.file("extdata", package = "decorr")
  # read imgs, nodes and edges dataframes
  imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
  nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
  edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
  # create the list of graphs
  lgrph <- list.grph(imgs,nodes,edges,var="type")
  # get the first graph
  g <- lgrph[[1]]
  # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
  # function: plot.dec.grph
  # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
  # # site <- "Cerro Muriano"
  # # decor <- "Cerro Muriano 1"
  # # site <- "Torrejon Rubio"
  # # decor <- "Torrejon Rubio 1"
  # site <- "Brozas"
  # decor <- "Brozas"
  # nds.df <- read.nds(doss = doss,site = site,decor = decor,nodes = "nodes",dev = ".tsv")
  # # actors <- data.frame(name=c("Alice", "Bob", "Cecil", "David","Esmer"),
  # #                      age=c(48,33,45,34,21),
  # #                      gender=c("F","M","F","M","F"))
  # eds.df <- read.eds(doss = doss,site = site,decor = decor,edges = "edges",dev = ".tsv")
  # img.graph <- plot.dec.grph(nds.df = nds.df,
  #                            eds.df = eds.df,
  #                            doss = doss,
  #                            site = site,
  #                            decor = decor,
  #                            lbl.txt = "type",
  #                            shw = c("nodes","edges"))
  # img.graph
  # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
  # function: same.eds
  # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
  # imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
  #                    sep="\t",stringsAsFactors = F)
  # nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
  #                     sep="\t",stringsAsFactors = F)
  # edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
  #                     sep="\t",stringsAsFactors = F)
  # df.same_edges <- same.eds(imgs,nodes,edges,var="type")
  # list.grph <- function(imgs,
  #                      nodes,
  #                      edges,
  #                      var="type"){
  #   # 'var': field on which the comparison will be done
  #   # create list of graphs
  #   lgrph <- list()
  #   for (r in 1:nrow(imgs)){
  #     # r <- 1
  #     a.enr <- imgs[r,]
  #     a.site <- a.enr$site ; a.decor <- a.enr$decor ; a.idf <- a.enr$idf
  #     g.nodes <- subset(nodes, site == a.site & decor == a.decor) # nodes
  #     g.nodes <- subset(g.nodes, select=-c(site,decor))
  #     g.edges <- subset(edges, site == a.site & decor == a.decor) # edges
  #     g.edges <- subset(g.edges, select=-c(site,decor))
  #     # create graph
  #     g <- igraph::graph_from_data_frame(g.edges, directed = FALSE, vertices= g.nodes)
  #     g.nodes.idf <- igraph::V(g)$name # get name of vertices
  #     igraph::V(g)$name <- igraph::as_data_frame(g, what="vertices")[,var]
  #     # V(g)$name <- V(g)$type # remplace les numeros par leur types # TODO: permit change
  #     igraph::V(g)$idf <- g.nodes.idf
  #     g$name <- a.idf # graph name
  #     # g$name <- paste0(as.character(r),"-",a.site,'.',a.decor) # name
  #     lgrph[[length(lgrph)+1]] <- g
  #   }
  #   return(lgrph)
  # }
  # imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
  # nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
  # edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
  # # create the symetric matix
  # lgrph <- list.grph(imgs,nodes,edges,var="type")
  # # > df.same_edges
  # library(igraph)
  # 
  # g <- lgrph[[1]]
  # 
  # # graph name
  # g$name
  # # [1] 1
  # 
  # # nb of nodes
  # gorder(g)
  # # [1] 7
  # 
  # # nb of edges
  # gsize(g)
  # # [1] 8
  
  #   # df.same_edges <- f.same.edges(lgraphs,c("")) # TODO: grab this function
  #   # df.same_edges <- same.eds(lgraphs)
  #   lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name)) # get names
  #   mat.same_edges <- matrix(nrow = length(lgrph),
  #                            ncol = length(lgrph))
  #   mat.same_edges <- as.data.frame(mat.same_edges)
  #   rownames(mat.same_edges) <- colnames(mat.same_edges)<- lgrph_nmes
  #   mat.same_edges[is.na(mat.same_edges)] <- 0 # replace NA with 0
  #   # lgrph_nmes <- c()
  #   # for (i in 1:length(lgrph)){
  #   #   lgrph_nmes <- c(lgrph_nmes,lgrph[[i]]$name)
  #   #   print (lgrph[[i]]$name)
  #   # }
  #   # identify same edges btw graphs
  #   # return all edges as a vector character
  #   
  #   # list all edges
  #   tot.edges <- data.frame("V1"=character(),
  #                           "V2"=character(),
  #                           "type"=character(),
  #                           stringsAsFactors=FALSE)
  #   # all unique type of edges
  #   for(i in 1:length(lgrph)){
  #     # i <- 1
  #     a.g <- lgrph[[i]]
  #     #print(paste0(i,".",a.g$name))
  #     g.edg <- as.data.frame(as_edgelist(a.g)) # edges
  #     g.edg$type <- edge.attributes(a.g)$type # 
  #     # if (rm.attributes){
  #     #   g.edg <- g.edg[g.edg$typ != "+",]
  #     # }
  #     tot.edges <- rbind(tot.edges,g.edg)
  #   }
  #   #tot.edges$typ[is.na(tot.edges$typ)] <- "=" # change NA to =
  #   # opt suppress duplicated
  #   tot.edges <- tot.edges[!duplicated(t(apply(tot.edges[c("V1", "V2","type")], 1, sort))), ]
  #   sel.edges <- paste0(tot.edges[,1],tot.edges[,"type"],tot.edges[,2]) # like "nez=vide"
  #   # sel.edges <- f.tot.edges(lgrph)
  #   df.typ_edges <- f.typ.edges(sel.edges,lgrph) # call function
  #   # at least a common edge appears 2 times, limit the df
  #   df.typ_edges.sub <- df.typ_edges[,colSums(df.typ_edges) > 1]
  #   for (c in 1:ncol(df.typ_edges.sub)){
  #     #c <- 2
  #     a.col <- df.typ_edges.sub[,c] # get column
  #     # at least 2 decoration without 0
  #     if(length(a.col[!a.col %in% 0]) > 1){
  #       idxs <- which(a.col %in% c(1:100)) # count of egal betw 1 and Inf
  #       all.comb <- subset(expand.grid(rep(list(idxs),2)), Var1 != Var2)
  #       for (r in 1:nrow(all.comb)){
  #         #r <- 1
  #         x <- all.comb[r,"Var1"];y <- all.comb[r,"Var2"]
  #         mat.same_edges[x,y] <- mat.same_edges[x,y]+1
  #         mat.same_edges[y,x] <- mat.same_edges[y,x]+1
  #       }
  #     }
  #   }
  #   # divide all cells by 2 (symetry)
  #   mat.same_edges[] <- lapply(mat.same_edges, function(x) x/2)
  #   colnames(mat.same_edges) <- row.names(mat.same_edges) <- lgrph_nmes
  #   return(mat.same_edges)
  # }
  # # TODO: supress choice on attributes (to conserve all)
  # # TODO: give the possibility to change "type" to any other values (ex: cultural)
  # 
  # 
  # df.same_edges[lower.tri(df.same_edges,diag=T)] <- NA
  # #df.same_edges <- as.data.frame(mat.same_edges)
  # # rownames(df.same_edges) <- seq(1:nrow(df.same_edges))
  # # names(df.same_edges) <- seq(1:ncol(df.same_edges))
  # melt.df.same_edges <- reshape2::melt(as.matrix(df.same_edges))
  # # heatmap
  # heat.mat <- ggplot(data = melt.df.same_edges, aes(x=Var1, y=Var2, fill=value)) + 
  #   ggtitle("a titre")+
  #   geom_tile(na.rm = T) +
  #   scale_fill_gradient2(#low = "blue", high = "red",
  #     name="Symetric matrix\nof the intersections\nbetween graphs",
  #     na.value = 'white',
  #     breaks=c(1,3,8,12,18))+
  #   geom_text(aes(Var1, Var2, label = value),
  #             color = "black", size = 3)+
  #   theme_minimal()+
  #   theme(axis.title = element_blank())+
  #   theme(legend.position = "none")+
  #   scale_x_discrete(position = "top", limits=seq(1:nrow(df.same_edges)))+
  #   scale_y_discrete(limits=seq(1:nrow(df.same_edges)))
  # heat.mat
  # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
  # function: TODO matrix visual
  # = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
}
if (pck.create){
  # devtools::create("iconr")
}
# DATA  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if (data.create){
  ## Get 1 decoration from Pg
  # extract nodes 
  doss.extdata <- "D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata"
  ldecors <- list(list('Cerro Muriano','Cerro Muriano 1'),
                  list('Torrejon Rubio','Torrejon Rubio 1'),
                  list('Brozas','Brozas'),
                  list('Zarza de Montanchez','Zarza De Montanchez'))
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
    sqll.edges.shp <- paste0("SELECT site,decor,typ,a,b,",
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
    a.decoration.edges.shp.df <- subset(a.decoration.edges.shp,select=c("site","decor","typ","a","b"))
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
  a.decoration.nodes.shp <- SpatialPointsDataFrame(coords = xy,data = a.decoration.nodes)
  ### harmonize & write - - - - - - - - - - - - - - - - - 
  ## nodes
  write.table(a.decoration.nodes, file=paste0(doss.extdata,'/nodes.csv'), quote=FALSE, sep='\t') # -> csv
  write.table(a.decoration.nodes, file=paste0(doss.extdata,'/nodes.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.nodes.shp, filename=paste0(doss.extdata,'/nodes.shp'),overwrite=TRUE) # -> shp
  ## edges
  colnames(a.decoration.edges)[which(names(a.decoration.edges) == "typ")] <- "type"
  a.decoration.edges$type[is.na(a.decoration.edges$type)] <- "=" # change NA to =
  write.table(a.decoration.edges, file=paste0(doss.extdata,'/edges.csv'), quote=FALSE, sep='\t') # -> csv
  write.table(a.decoration.edges, file=paste0(doss.extdata,'/edges.tsv'), quote=FALSE, sep='\t') # -> tsv
  shapefile(a.decoration.edges.shp.out, filename=paste0(doss.extdata,'/edges.shp',overwrite=TRUE)) # -> shp
  ## image df
  colnames(a.decoration.img)[which(names(a.decoration.img) == "numero")] <- "decor"
  a.decoration.img$idf <- 1:nrow(a.decoration.img)
  a.decoration.img$img <- gsub('%20',' ',a.decoration.img$img) # remove %20 used by windows
  a.decoration.img$img <- gsub(' ','_',paste0(a.decoration.img$site,'.',a.decoration.img$decor,'.jpg'))
  a.decoration.img <- a.decoration.img[,c(4,1,2,3)]
  write.table(a.decoration.img, file=paste0(doss.extdata,'/imgs.csv'), quote=FALSE, sep='\t') # -> csv
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

# f.edge.plot
# for (edg in 1:nrow(graph.j)){
#   lines(c(graph.j[edg,"xa"],graph.j[edg,"xb"]),
#         c(graph.j[edg,"ya"],graph.j[edg,"yb"]),
#         lwd=4,col="orange")
# }
