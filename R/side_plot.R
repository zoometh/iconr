#' Plot Two Figures Side-by-Side Identifying Common Elements
#' @name side_plot
#'
#' @description Plot two decoration graphs side-by-side identifying common nodes and common edges. This function is called by the function \code{\link[iconr]{plot_compar}}.
#'
#' @param grph list of two or more 'igraph' graphs created with the \code{\link[iconr]{list_compar}} function.
#' @param dir Working directory which contains the imgs, nodes, edges dataframes and the decoration images.
#' @param nd.var Field of nodes on which the comparison will be done.
#' @param focus Focus on nodes or on edges, by default \code{focus = "nodes"}.
#' @param nd.color,nd.size,ed.color,ed.width Graphical parameters for the nodes and edges. The \strong{different} nodes/edges will be displayed with the first values of the vectors (eg, "orange") while the \strong{common} nodes/edges will be displayed with the second values of the vectors (eg, "red").
#' @param lbl.size size of the labels
#'
#' @seealso \code{\link[iconr]{plot_compar}}.
#'
#' @return No return value, group images side-by-side.
#'
#'
#' @export
side_plot <- function(grph, dir, nd.var, focus = "nodes",
                      nd.color = c("orange", "red"), nd.size = c(0.5, 1),
                      ed.color = c("orange", "red"), ed.width = c(1, 2),
                      lbl.size = 0.5) {
  igraph::V(grph)$name <- 1:igraph::gorder(grph)
  nodes <- igraph::as_data_frame(grph, what = "vertices")
  edges <- igraph::as_data_frame(grph)
  # Set edge positions
  edg.vert <- unlist(edges[, c("from","to")])
  edges[, c("xa", "xb", "ya", "yb")] <- unlist(nodes[edg.vert, c("x", "y")])

  if (focus == "nodes") {
    nodes.group <- nodes$comm + 1
    edges.group <- rep(1, nrow(edges))
  } else if (focus == "edges") {
    comm.eds.subgr <- igraph::subgraph.edges(grph, which(edges$comm == 1))
    nodes.group <- as.numeric(
      nodes$name %in% igraph::V(comm.eds.subgr)$name) + 1
    edges.group <- edges$comm + 1
  }
  edges$lty <- ifelse(edges$type %in% c("+"), "33", "solid")
  edges$col <- ed.color[edges.group]
  edges$lwd <- ed.width[edges.group]
  nodes$cex <- nd.size[nodes.group]
  nodes$lbl.col <- nodes$col <- nd.color[nodes.group]
  nodes$lbl.cex <- lbl.size
  # Get common nodes to plot labels
  lbl.nds <- nodes.group == 2

  dec.img <- magick::image_read(paste0(dir, "/", grph$img))

  draw_graph(nodes, edges, lbl.nds,
             nd.var, dec.img,
             paste0(grph$name, "\n", grph$site, "\n", grph$decor))
}

draw_edges <- function(edges, offset) {
  if(is.null(edges) || nrow(edges) == 0) return()
  edges$lwd <- edges$lwd * scale_factor()
  edges[, c("ya", "yb")] <- edges[, c("ya", "yb")] + offset
  for (edg in seq_len(nrow(edges))) {
    graphics::lines(edges[edg, c("xa", "xb")],
                    edges[edg, c("ya", "yb")],
                    lty = edges$lty[edg],
                    lwd = edges$lwd[edg],
                    col = edges$col[edg])
  }
}

draw_nodes <- function(nodes, lbl.nds, nd.var, offset) {
  if(is.null(nodes) || nrow(nodes) == 0) return()
  nodes$y <- nodes$y + offset
  graphics::points(nodes$x, nodes$y, pch = 16,
                   cex = nodes$cex,
                   col = nodes$col)
  labels <- nodes[lbl.nds, ]
  labels_shadow(labels$x, labels$y, labels = labels[, nd.var],
                col = labels$lbl.col, bg = "white",
                cex = labels$lbl.cex, r = 0.15, adj = c(0.5, -0.2))
}

annotate_dec <- function(dec.img, title, nd.var) {
  # Add the decoration name, site and decor at the top-left corner:
  graphics::text(1, magick::image_info(dec.img)$height - 4,
                 title,
                 cex = 0.5, adj = c(0, 1))
  # Add the nd.vars at the top-right corner:
  graphics::text(magick::image_info(dec.img)$width - 1,
                 magick::image_info(dec.img)$height - 4,
                 nd.var, cex = 0.5, adj = c(1, 1))
}


draw_graph <- function(nodes, edges, lbl.nds,
                       nd.var, dec.img, title) {
  graphics::plot(dec.img)
  # the par() user's parameters will be restore after the
  # run of the plot_compar() function
  graphics::par(cex = scale_factor())
  annotate_dec(dec.img, title, nd.var)
  # The y-coordinate requires to be added the image offset
  offset <- magick::image_info(dec.img)$height
  draw_edges(edges, offset)
  draw_nodes(nodes, lbl.nds, nd.var, offset)
}

scale_factor <- function() {
  # The text, labels and point sizes have been calibrated with the plot size
  # used in plot_compar() and plot_dec_graph() (height=7cm). In case it is
  # used with different sizes a global cex variable is defined dependent on
  # plot height to make them appear with the same relative sizes.
  # The plot width is secondarily taken into account. If plot aspect ratio
  # is above 750/666, then the sizes are further corrected considering the
  # plot width instead of the height.
  dec.asp <- grDevices::dev.size()[2]/grDevices::dev.size()[1]
  # the par() user's parameters will be restore after the
  # run of the plot_compar() function
  exp.dec.asp <- 750/(666*graphics::par("mfrow")[2])
  return(grDevices::dev.size(units = "cm")[1] * min(dec.asp, exp.dec.asp) / 7)
}
