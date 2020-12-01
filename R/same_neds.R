same_neds <- function (lgrph, var = "type", focus = c("nodes")) {
  lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name))
  if(focus == "nodes"){
    extract_features <- function(x) igraph::vertex_attr(x, var)
  } else if(focus == "edges"){
    extract_features <- function(x) named_edges(x, var)
  } else {
    stop("The 'focus' must be 'nodes' or 'edges'")
  }
  
  g.features <- lapply(lgrph, extract_features)
  mat.same_feature <- outer(g.features, g.features,
                            Vectorize(function(x,y) length(intersect(x,y))))
  rownames(mat.same_features) <- colnames(mat.same_features) <- lgrph_nmes
  return(mat.same_features)
}
