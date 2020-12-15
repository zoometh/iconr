#' @export
named_elements <- function(grph, focus = "edges", nd.var = "type") {
  # grph <- lgrph[[4]]
  elements <- c()
  if(focus == "edges"){
    directed.types <- c(">", "+")
    infix <- "-"
    grph.eds <- igraph::as_data_frame(grph)[, c("from", "type", "to")]
    grph.nds <- igraph::as_data_frame(grph, "vertices")
    grph.eds[c("from", "to")] <-
      grph.nds[unlist(grph.eds[c("from", "to")]), nd.var]
    if (!igraph::is_directed(grph)) {
      directed.eds = grph.eds$type %in% directed.types
      grph.eds[!directed.eds, c("from","to")] <-
        t(apply(grph.eds[!directed.eds, c("from","to")], 1, sort))
    }
    elements <- as.character(apply(grph.eds, 1, paste0, collapse = infix))
  }
  else if(focus == "nodes"){
    elements <- igraph::vertex_attr(grph, nd.var)
  } else {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }
  return(disambiguate_duplicates(elements))
}

disambiguate_duplicates <- function(x, marker = "#") {
  while(any(dup <- duplicated(x))) {
    x[dup] <- paste0(x[dup], marker)
  }
  return(x)
}
