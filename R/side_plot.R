side_plot_eds <- function(g,idf){
  # a manner to use only plot()
  # idf <- 1 ; g <- g
  grp <- g[[idf]]
  drawing.decor <- grDevices::as.raster(magick::image_read(grp$img))
  graphics::plot(drawing.decor)
  offset.img <- dim(drawing.decor)[1] # offset depend on raster size
  # points(100,300)
  # add all edges
  # igraph::as_data_frame(gA)
  eds.xy <- read_eds(doss = getwd(),site = grp$site,decor = grp$decor)
  eds.xy$ya <- offset.img+eds.xy$ya # add the offset
  eds.xy$yb <- offset.img+eds.xy$yb # add the offset
  # eds.xy$ya <- abs(eds.xy$ya) ; eds.xy$yb <- abs(eds.xy$yb) # abs()
  nds.xy <- read_nds(doss = getwd(),site = grp$site,decor = grp$decor)
  nds.xy$y <- offset.img+nds.xy$y # add the offset
  # nds.xy$y <- abs(nds.xy$y) # abs()
  g.edges <- cbind(igraph::as_data_frame(grp),eds.xy) # bind to get coordinates & colors
  # graph.j <- edges[edges$site==gA$site & edges$decor==gA$decor,]
  for (nd in 1:nrow(nds.xy)){
    graphics::points(c(nds.xy[nd,]$x), c(nds.xy[nd,]$y),
           pch=16,cex=0.5,col="orange")
  }
  for (edg in 1:nrow(g.edges)){
    # edg <- 1
    graphics::lines(c(g.edges[edg,"xa"],g.edges[edg,"xb"]),
          c(g.edges[edg,"ya"],g.edges[edg,"yb"]),
          lwd=g.edges[edg,"width"],col=g.edges[edg,"color"])
  }
}
