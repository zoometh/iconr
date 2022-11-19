setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata")
verbose <- T
common.eds.color <- "red"
different.eds.color <- "orange"

zplot <- function(g){
  # a manner to use only plot()
  # g <- 2
  grp <- grph.out[[g]]
  drawing.decor <- as.raster(image_read(grp$img))
  plot(drawing.decor)
  offset.img <- dim(drawing.decor)[1] # offset depend on raster size
  # points(100,300)
  # add all edges
  # igraph::as_data_frame(gA)
  eds.xy <- read.eds(doss = getwd(),site = grp$site,decor = grp$decor)
  eds.xy$ya <- offset.img+eds.xy$ya # add the offset
  eds.xy$yb <- offset.img+eds.xy$yb # add the offset
  # eds.xy$ya <- abs(eds.xy$ya) ; eds.xy$yb <- abs(eds.xy$yb) # abs()
  nds.xy <- read.nds(doss = getwd(),site = grp$site,decor = grp$decor)
  nds.xy$y <- offset.img+nds.xy$y # add the offset
  # nds.xy$y <- abs(nds.xy$y) # abs()
  g.edges <- cbind(igraph::as_data_frame(grp),eds.xy) # bind to get coordinates & colors
  # graph.j <- edges[edges$site==gA$site & edges$decor==gA$decor,]
  for (nd in 1:nrow(nds.xy)){
    points(c(nds.xy[nd,]$x), c(nds.xy[nd,]$y),
           pch=16,cex=0.5,col="orange") 
  }
  for (edg in 1:nrow(g.edges)){
    # edg <- 1
    lines(c(g.edges[edg,"xa"],g.edges[edg,"xb"]),
          c(g.edges[edg,"ya"],g.edges[edg,"yb"]),
          lwd=1,col=g.edges[edg,"color"])
  }
}

lgrph <- list.grph(imgs,nodes,edges,var="type")
ldecors.comp <- t(combn(imgs$idf, 2)) # all pairwise comparisons
print(paste0("there is ",nrow(ldecors.comp)," pairwise comparisons to compute"))
for (dec in 1:nrow(ldecors.comp)){
  # dec <- 2
  A <- ldecors.comp[dec,][1]
  B <- ldecors.comp[dec,][2]
  # g1 <- lgrph[[to.compare[1]]] 
  # g2 <- lgrph[[to.compare[2]]] 
  gA <- lgrph[[A]] 
  gB <- lgrph[[B]] 
  # default colors
  # a.compar <- paste0(ldecors.comp[dec,],collapse=' - ')
  tit <- paste0("compare decorations '",A,"' and '",B,"'")
  if (verbose){
    print (paste0("    ",dec,") ", tit))
  }
  # lgcomp <- list(lgrph[[to.compare[1]]],lgrph[[to.compare[2]]])
  # esss <- igraph::intersection(lgcomp)
  common.edges <- gA %s% gB
  # check on type of edge
  same.type <- E(common.edges)$type_1 == E(common.edges)$type_2
  common.edges.same.type <- E(common.edges)[same.type]
  common.edges <- igraph::set_edge_attr(common.edges, "same", index = E(common.edges), common.edges.same.type)
  # common.edges <- delete.edges(common.edges,E(common.edges))
  # common.edges <- add.edges(common.edges,common.edges.same.type)
  ab <- igraph::as_data_frame(common.edges)
  if(nrow(ab)>0){
    ab.same <- subset(ab, same == 1)
    ab.same <- c(ab.same$from,ab.same$to,ab.same$type_1)
  }
  grph.comp <- list(gA,gB)
  grph.out <- list() # out list
  for(g in 1:length(grph.comp)){
    # g <- 1
    grp <- grph.comp[[g]]
    for (e in 1:gsize(grp)){
      # e <- 1
      grp.ed.from <- igraph::as_data_frame(grp)[e,]$from
      grp.ed.to <- igraph::as_data_frame(grp)[e,]$to
      grp.ed.type <- igraph::as_data_frame(grp)[e,]$type
      grp.ed.is <- c(grp.ed.from,grp.ed.to,grp.ed.type)
      if(all(grp.ed.is %in% ab.same)){
        grp <- igraph::set_edge_attr(grp, "color", index = e, common.eds.color)
      }
      if(!all(grp.ed.is %in% ab.same)){
        grp <- igraph::set_edge_attr(grp, "color", index = e, different.eds.color)
      }
    }
    grph.out[[length(grph.out)+1]] <- grp
  }
  gA <- grph.out[[1]] ; gB <- grph.out[[2]]
  # gA <- igraph::set_edge_attr(gA, "color", index = E(gA), different.eds.color)
  # gB <- igraph::set_edge_attr(gB, "color", index = E(gB), different.eds.color)
  # decor.thumb(1)
  # edge.attributes(gA)
  # chm.out <- paste0(chm.matrix,graphs.nmes[j],'.png')
  # png(chm.out);
  # plot(rast.j)
  out.compar <- paste0("compar_",as.character(A),"_",as.character(B),".png")
  png(out.compar,width = 14,height=7, units = "cm", res=300)
  par(mfrow=c(1,2),
      mar=c(0,0,0,0))    # set the plotting area into a 1*2 array
  zplot(1);zplot(2)
  mtext(tit, side = 1, line = -1, outer = TRUE)  
  dev.off()
}
#   
#     grp <- grph.out[[g]]
#     drawing.decor <- as.raster(image_read(grp$img))
#     p <- plot(drawing.decor)
#     offset.img <- dim(drawing.decor)[1] # offset depend on raster size
#     points(100,300)
#     # add all edges
#     # igraph::as_data_frame(gA)
#     eds.xy <- read.eds(doss = getwd(),site = grp$site,decor = grp$decor)
#     eds.xy$ya <- offset.img+eds.xy$ya # add the offset
#     eds.xy$yb <- offset.img+eds.xy$yb # add the offset
#     # eds.xy$ya <- abs(eds.xy$ya) ; eds.xy$yb <- abs(eds.xy$yb) # abs()
#     nds.xy <- read.nds(doss = getwd(),site = grp$site,decor = grp$decor)
#     nds.xy$y <- offset.img+nds.xy$y # add the offset
#     # nds.xy$y <- abs(nds.xy$y) # abs()
#     g.edges <- cbind(igraph::as_data_frame(grp),eds.xy) # bind to get coordinates & colors
#     # graph.j <- edges[edges$site==gA$site & edges$decor==gA$decor,]
#     for (edg in 1:nrow(g.edges)){
#       # edg <- 1
#       lines(c(g.edges[edg,"xa"],g.edges[edg,"xb"]),
#             c(g.edges[edg,"ya"],g.edges[edg,"yb"]),
#             lwd=4,col=g.edges[edg,"color"])
#     }
#     for (nd in 1:nrow(nds.xy)){
#       points(c(nds.xy[nd,]$x), c(nds.xy[nd,]$y),
#              pch=16,cex=1.5,col="orange") 
#     }
#   }
# }
# 
#   #print (paste0("    ",dec,") decoration ",cat(ldecors[dec,],sep=" - ")))
#   ledges <- lnodes <- list() # list of two graph edges/nodes
#   # function call- -
#   for(n in c(1,2)){
#     # n <- 1
#     sit.1 <- imgs[which(imgs$idf == ldecors.comp[dec,n]), "site"]
#     # sit.1 <- df.icos[which(df.icos$idf == ldecors.comp[dec,n]), "site"]
#     num.1 <- imgs[which(imgs$idf == ldecors.comp[dec,n]), "decor"]
#     # num.1 <- df.icos[which(df.icos$idf == ldecors.comp[dec,n]), "numero"]
#     image.dec <- imgs[which(imgs$idf == ldecors.comp[dec,n]), "img"] # image
#     # rast.1 <- as.raster(image_read(image.dec)) # image to raster
#     # image.dec <- df.icos[which(df.icos$idf == ldecors.comp[dec,n]), "img"] # image
#     rast.1 <- as.raster(image_read(image.dec)) # image to raster
#     offset.img <- dim(rast.1)[1] # offset depend on raster size
#     #print (offset.img)
#     # ledges[[length(ledges)+1]] <- edges.df(n,dec,sit.1,num.1)
#     # lnodes[[length(lnodes)+1]] <- nodes.df(sit.1,num.1)
#     ledges[[length(ledges)+1]] <- read.eds(doss = getwd(),
#                                            site = sit.1,
#                                            decor = num.1,
#                                            edges = "edges",
#                                            nodes = "nodes",
#                                            dev = ".tsv")
#     lnodes[[length(lnodes)+1]] <- nds.df <- read.nds(doss = getwd(),
#                                                      site = sit.1,
#                                                      decor = num.1,
#                                                      nodes = "nodes",
#                                                      dev = ".tsv")
#   }
#   # common edges
#   graph.a <- ledges[[1]];graph.b <- ledges[[2]]
#   nme.a <- unique(paste0(graph.a$site,'.',graph.a$decor))
#   nme.b <- unique(paste0(graph.b$site,'.',graph.b$decor))              
#   graphs.nmes <- c(paste0(nme.a,'_',nme.b),paste0(nme.b,'_',nme.a))
#   l.common.edges <- intersect(unique(graph.a$rel),unique(graph.b$rel))
#   for (j in c(1,2)){
#     #j <- 1
#     nodes.j <- lnodes[[j]];graph.j <- ledges[[j]]
#     common.edges.j <- graph.j[which(graph.j$rel %in% l.common.edges),]
#     a.img <- image_read(unique(graph.j$image.dec))
#     #image.dec.1 <- unique(graph.a$image.dec)
#     #print(unique(graph.j$image.dec))
#     #dec.nme <- unique(paste0(graph.j$site,'.',graph.j$decor))
#     rast.j <- as.raster(a.img) # image to raster
#     # decor + graph - -
#     chm.out <- paste0(chm.matrix,graphs.nmes[j],'.png')
#     png(chm.out);
#     # plot(rast.j)
#     p <- plot(as.raster(image_read(gA$img)))
#     # add all edges
#     for (edg in 1:nrow(graph.j)){
#       lines(c(graph.j[edg,"xa"],graph.j[edg,"xb"]),
#             c(graph.j[edg,"ya"],graph.j[edg,"yb"]),
#             lwd=4,col="orange")
#     }
#     # add common edges
#     for (edg in 1:nrow(common.edges.j)){
#       lines(c(common.edges.j[edg,"xa"],common.edges.j[edg,"xb"]),
#             c(common.edges.j[edg,"ya"],common.edges.j[edg,"yb"]),
#             lwd=8,col="red")
#     }
#     # add nodes
#     points(c(nodes.j$x), c(nodes.j$y),
#            pch=16,cex=1.5,col="orange") 
#     dev.off()
#   }
# }
# # trim images
# for (img in list.files(chm.matrix)){
#   img.dec <- image_read(paste0(chm.matrix,img))
#   img.dec <- image_trim(img.dec) # trim
#   # add white margins
#   img.dec <- image_border(img.dec,"#FFFFFF", size.margins)
#   chm.out <- paste0(chm.matrix,img)
#   image_write(img.dec, chm.out, format = "png")
# }