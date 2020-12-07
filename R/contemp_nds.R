#' @export
contemp_nds <- function(nds.df, eds.df, selected.nd){
  # nds.df, eds.df, selected.nd
  # selected.nd <- 3
  nds.g.cols <- !(names(nds.df) %in% c("site", "decor"))
  eds.g.cols <- !(names(eds.df) %in% c("site", "decor"))
  g <- igraph::graph_from_data_frame(eds.df[eds.g.cols],
                                     vertices = nds.df[nds.g.cols],
                                     directed=FALSE)
  eds.overlap <- which(igraph::E(g)$type == ">")
  g.split <- igraph::delete.edges(g, eds.overlap)
  nds.member <- igraph::components(g.split)$membership
  contemp.nds <- nds.member == nds.member[selected.nd]
  contemp.eds <- eds.df$type != '>' &
                 contemp.nds[igraph::ends(g,igraph::E(g))[, 1]]
  return(list(nodes = nds.df[contemp.nds, ],
              edges = eds.df[contemp.eds, ]))
}
