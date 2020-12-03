contemp_nds <- function(nds.df, eds.df, selected.nd){
  # nds.df, eds.df, selected.nd
  # selected.nd <- 3
  nds.g.cols <- !(names(nds.df) %in% c("site", "decor"))
  eds.g.cols <- !(names(eds.df) %in% c("site", "decor"))
  g <- igraph::graph_from_data_frame(eds.df[eds.g.cols],
                                     vertices = nds.df[nds.g.cols],
                                     directed=FALSE)
  eds.overlap <- which(igraph::E(g)$type == ">")
  g <- igraph::delete.edges(g, eds.overlap)
  g.member <- igraph::components(g)$membership
  contemp.cases <- g.member == g.member[selected.nd]
  return(list(nds.df[contemp.cases, ], eds.df[eds.df$type != '>', ]))
}
