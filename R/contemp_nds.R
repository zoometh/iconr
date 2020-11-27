contemp_nds <- function(nds.df, eds.df, selected.nd, var = "type"){
  # selected.nd <- 3
  nds.g.cols <- !(names(nds.df) %in% c("site", "decor"))
  eds.g.cols <- !(names(eds.df) %in% c("site", "decor"))
  g <- igraph::graph_from_data_frame(eds.df[eds.g.cols],
                                     vertices = nds.df[nds.g.cols],
                                     directed=FALSE)
  eds.overlap <- which(igraph::edge_attr(g, var) == '>')
  g <- igraph::delete.edges(g, eds.overlap)
  g.member <- igraph::components(g)$membership
  nds.overlap <- which(g.member != g.member[selected.nd])

  nds.df.contemp <- nds.df[-nds.overlap, ]
  eds.df.contemp <- eds.df[-eds.overlap, ]
  return(list(nds.df.contemp, eds.df.contemp))
}
