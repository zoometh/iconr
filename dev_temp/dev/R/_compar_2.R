zplot <- function(g){
  # a manner to use only plot()
  # g <- 2
  grp <- grph2compar[[g]]
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

zplot1 <- function(g,idf){
  # a manner to use only plot()
  # idf <- 1 ; g <- g
  grp <- g[[idf]]
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

plot.dec.comp <- function(listg,df.compar,graph2){
  # a manner to use only plot()
  # listg <- grphAllcompar ; df.compar <- ldecors.comp ; graph2 <- c(1,3)
  # get row index in tcompar
  A <- graph2[1] ; B <- graph2[2]
  ridx <- which(df.compar[,1] == A & df.compar[,2] == B, arr.ind = T)
  g <- grphAllcompar[[ridx]]
  out.compar <- paste0("compar_",as.character(graph2[1]),"_",as.character(B),".png")
  png(out.compar,width = 14,height=7, units = "cm", res=300)
  par(mfrow=c(1,2),
      mar=c(0,0,0,0))    # set the plotting area into a 1*2 array
  zplot1(g,1);zplot1(g,2) # call to plot
  mtext(tit, side = 1, line = -1, outer = TRUE)
  dev.off()
}

plot.dec.comp(grphAllcompar,ldecors.comp,c(1,4))

#   for (i in 1:2){
#     grp <- listg[[g]]
#     drawing.decor <- as.raster(image_read(grp$img))
#     plot(drawing.decor)
#     offset.img <- dim(drawing.decor)[1] # offset depend on raster size
#     # points(100,300)
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
#     for (nd in 1:nrow(nds.xy)){
#       points(c(nds.xy[nd,]$x), c(nds.xy[nd,]$y),
#              pch=16,cex=0.5,col="orange")
#     }
#     for (edg in 1:nrow(g.edges)){
#       # edg <- 1
#       lines(c(g.edges[edg,"xa"],g.edges[edg,"xb"]),
#             c(g.edges[edg,"ya"],g.edges[edg,"yb"]),
#             lwd=1,col=g.edges[edg,"color"])
#     }
#   }
# }

setwd("D:/Projet Art Rupestre/scripts/scripts_r/package_create/iconr/inst/extdata")
verbose <- T
common.eds.color <- "red"
different.eds.color <- "orange"
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
lgrph <- list.grph(imgs,nodes,edges,var="type")
ldecors.comp <- t(combn(imgs$idf, 2)) # all pairwise comparisons
print(paste0("there is ",nrow(ldecors.comp)," pairwise comparisons to compute"))
grphAllcompar <- list()
for (dec in 1:nrow(ldecors.comp)){
  # dec <- 1
  A <- ldecors.comp[dec,][1]
  B <- ldecors.comp[dec,][2]
  gA <- lgrph[[A]]
  gB <- lgrph[[B]]
  # default colors
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
  if(nrow(ab)==0){
    ab.same <- NA
  }
  grph.comp <- list(gA,gB)
  grph2compar <- list() # out list
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
    grph2compar[[length(grph2compar)+1]] <- grp
  }
  grphAllcompar[[length(grphAllcompar)+1]] <- grph2compar
}

out.compar <- paste0("compar_",as.character(A),"_",as.character(B),".png")
png(out.compar,width = 14,height=7, units = "cm", res=300)
par(mfrow=c(1,2),
    mar=c(0,0,0,0))    # set the plotting area into a 1*2 array
zplot(1);zplot(2)
mtext(tit, side = 1, line = -1, outer = TRUE)
dev.off()

