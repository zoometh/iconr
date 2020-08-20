side_plot_nds <- function(g,idf){
  # a manner to use only plot()
  # idf <- 2 ; g <- g
  grp <- g[[idf]]
  drawing.decor <- grDevices::as.raster(magick::image_read(grp$img))
  graphics::plot(drawing.decor)
  offset.img <- dim(drawing.decor)[1] # offset depend on raster size
  # points(100,300)
  # add all edges
  # igraph::as_data_frame(gA)
  eds.xy <- read_eds(site = grp$site,decor = grp$decor)
  eds.xy$ya <- offset.img+eds.xy$ya # add the offset
  eds.xy$yb <- offset.img+eds.xy$yb # add the offset
  # eds.xy$ya <- abs(eds.xy$ya) ; eds.xy$yb <- abs(eds.xy$yb) # abs()
  nds.xy <- read_nds(site = grp$site,decor = grp$decor)
  nds.xy$y <- offset.img+nds.xy$y # add the offset
  # nds.xy$y <- abs(nds.xy$y) # abs()
  # modify idf of vertex because maybe two identical
  grp <- igraph::set.vertex.attribute(grp, "name", value=1:igraph::gorder(grp))
  # igraph::as_data_frame(grp, what="vertices")
  g.nodes <- igraph::as_data_frame(grp, what="vertices")
  g.nodes$y <- offset.img+g.nodes$y # add the offset
  # g.nodes <- cbind(igraph::as_data_frame(grp, what="vertices"),nds.xy) # bind to get coordinates & colors
  # graph.j <- edges[edges$site==gA$site & edges$decor==gA$decor,]
  g.edges <- cbind(igraph::as_data_frame(grp),eds.xy) # bind to get coordinates & colors
  for (edg in 1:nrow(g.edges)){
    # edg <- 1
    graphics::lines(c(g.edges[edg,"xa"],g.edges[edg,"xb"]),
                    c(g.edges[edg,"ya"],g.edges[edg,"yb"]),
                    lwd=g.edges[edg,"width"],col="orange")
  }
  for (nd in 1:nrow(g.nodes)){
    graphics::points(c(g.nodes[nd,]$x), c(g.nodes[nd,]$y),
                     pch=16,cex=g.nodes[nd,"cex"],col=g.nodes[nd,"color"])
  }
}
