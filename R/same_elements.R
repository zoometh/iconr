same_elements <- function (lgrph, var = "type", focus = c("nodes")) {
  extract_elements <- list(nodes = function(x) igraph::vertex_attr(x, var),
                           edges = function(x) named_edges(x, var))
  if (!focus %in% names(extract_elements)) {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }
  
  names(lgrph) <- unlist(lapply(lgrph, function(x) x$name))
  g.elements <- lapply(lgrph, extract_elements[[focus]])
  mat.same_elements <- outer(g.elements, g.elements,
                            Vectorize(function(x,y) length(intersect(x,y))))
  return(mat.same_elements)
}
