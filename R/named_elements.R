#' Textual Notation of Graph Elements
#' @name named_elements
#'
#' @description Create a textual notation for nodes or edges.
#'
#' @param grph A decoration graph (object of class \code{igraph}).
#' @param focus Textual notation of edges (\code{focus = "edges"}) or nodes (\code{focus = "nodes"}). By default \code{focus = "edges"}.
#' @param nd.var The attribute of the graph nodes containing the node variable (ie, field) for the textual annotation. By default \code{nd.var = "type"}.
#' @param disamb.marker Marker used to disambiguated repeated elements. By default \code{disamb.marker = "#"}.
#'
#' @details   Edges of type \code{'='} (\emph{normal} edges) are \strong{undirected}, so that the order of their nodes is irrelevant and they are presented in alphabetical order. Conversely, edges of types \code{'+'} (\emph{attribute} edges) and \code{'>'} (\emph{diachronic} edges) are \strong{directed}, so that the given order of nodes is preserved. Repeated node or edge names are disambiguated by appending the symbol \code{disamb.marker} (\code{'#'} by default) at the end of the second appearance (suffix). Subsequent appearances are marked by additional \code{disamb.marker}s.
#'
#' @seealso \code{\link[iconr]{list_compar}}, \code{\link[iconr]{same_elements}}.
#'
#' @return A character vector of named nodes or edges.
#'
#' @examples
#'
#' # Read data
#' imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
#'                    sep="\t", stringsAsFactors = FALSE)
#' nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
#'                     sep="\t", stringsAsFactors = FALSE)
#' edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
#'                     sep="\t", stringsAsFactors = FALSE)
#'
#' # Generate list of graphs from the three data.frames
#' lgrph <- list_dec(imgs, nodes, edges)
#'
#' # Textual notation of disambiguated edges
#' named_elements(lgrph[[2]], focus = "edges", nd.var="type")
#'
#' # Textual notation of disambiguated nodes
#' named_elements(lgrph[[2]], focus = "nodes", nd.var="type")
#'
#' @export
named_elements <- function(grph, focus = "edges", nd.var = "type",
                           disamb.marker = "#") {
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
      directed.eds <- grph.eds$type %in% directed.types
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
  return(disambiguate_duplicates(elements, disamb.marker))
}

disambiguate_duplicates <- function(x, marker = "#") {
  if(marker != "") {
    while(any(dup <- duplicated(x))) {
      x[dup] <- paste0(x[dup], marker)
    }
  }
  return(x)
}
