side_plot <- function(grp, doss, nds.var, focus = "nodes",
                          nds.color = c("orange", "red"), nds.size = c(0.5, 1),
                          eds.color = c("orange", "red"), eds.width = c(1, 2),
                          lbl.size = 0.5) {
  dec.img <- magick::image_read(paste0(doss, "/", grp$img))
  # add the decor site and name
  dec.img <- magick::image_annotate(dec.img,
                                    paste0(grp$site, "\n", grp$decor),
                                    gravity = "northwest", size = 20)
  drawing.decor <- grDevices::as.raster(dec.img)
  graphics::plot(drawing.decor)
  offset.img <- nrow(drawing.decor)  # offset depends on raster size

  igraph::V(grp)$name <- 1:igraph::gorder(grp)
  g.nodes <- igraph::as_data_frame(grp, what = "vertices")
  g.nodes$y <- g.nodes$y + offset.img  # add the offset
  g.edges <- igraph::as_data_frame(grp)
  ed.type <- ifelse(g.edges$type %in% c("+", ">"), "21", "solid")

  if (focus == "nodes") {
    nodes.group <- g.nodes$comm + 1
    edges.group <- rep(1, nrow(g.edges))
  } else if (focus == "edges") {
    comm.eds.subgr <- igraph::subgraph.edges(grp, which(g.edges$comm == 1))
    nodes.group <- as.numeric(
      g.nodes$name %in% igraph::V(comm.eds.subgr)$name) + 1
    edges.group <- g.edges$comm + 1
  } else {
    nodes.group <- rep(1, nrow(g.nodes))
    edges.group <- rep(1, nrow(g.edges))
  }

  for (edg in 1:nrow(g.edges)) {
    edg.vert <- as.numeric(g.edges[edg, c("from","to")]) # Edge vertices.
    graphics::lines(g.nodes$x[edg.vert],
                    g.nodes$y[edg.vert],
                    lty = ed.type[edg],
                    lwd = eds.width[edges.group[edg]],
                    col = eds.color[edges.group[edg]])
  }
  graphics::points(g.nodes$x, g.nodes$y, pch = 16,
                   cex = nds.size[nodes.group],
                   col = nds.color[nodes.group])
  # Get common nodes to plot labels
  nds.lbl <- g.nodes[nodes.group == 2, ]
  labels_shadow(nds.lbl$x, nds.lbl$y, label = nds.lbl[, nds.var],
                col = nds.color[2], bg = "white", cex = lbl.size, r = 0.15)
}
