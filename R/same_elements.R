same_elements <- function (lgrph, nds.var = "type", focus = c("nodes")) {
  extract_elements <- list(nodes = function(x) named_nodes(x, nds.var),
                           edges = function(x) named_edges(x, nds.var))
  if (!focus %in% names(extract_elements)) {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }

  names(lgrph) <- unlist(lapply(lgrph, function(x) x$name))
  g.elements <- lapply(lgrph, extract_elements[[focus]])
  mat.same_elements <- outer(g.elements, g.elements,
                            Vectorize(function(x,y) length(intersect(x,y))))
  return(mat.same_elements)
}
