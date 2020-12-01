same_neds <- function (lgrph, var = "type", focus = c("nodes")) {
  lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name))
  if(focus == "nodes"){
    g.nds <- lapply(lgrph, function(x) igraph::vertex_attr(x, var))
    mat.same_nodes <- outer(g.nds, g.nds,
                            Vectorize(function(x,y) length(intersect(x,y))))
    rownames(mat.same_nodes) <- colnames(mat.same_nodes) <- lgrph_nmes
    return(mat.same_nodes)
  }
  if(focus == "edges"){
    g.eds <- lapply(lgrph, function(x) named_edges(x, var))
    mat.same_edges <- outer(g.eds, g.eds,
                            Vectorize(function(x,y) length(intersect(x,y))))
    rownames(mat.same_edges) <- colnames(mat.same_edges) <- lgrph_nmes
    return(mat.same_edges)
  }
  if(!(focus %in% ("nodes", "edges")){
    stop("the 'focus' must be 'nodes' or 'edges'")
  }
}
