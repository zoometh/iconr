#' Number of Equal Elements Between Each Decoration Pair
#' @name same_elements
#'
#' @description   Create the (symmetric) dataframe with the count of \strong{common nodes} or \strong{common edges} (see \code{\link[iconr]{list_compar}} for comparison criteria) for each pair of decorations (graphs) from a list. The diagonal of the symmetric dataframe is filled with counts of nodes/edges for each decoration.
#'
#' @param lgrph a list of any number of graphs to be pairwise compared. The list can be typically obtained with the function \code{\link[iconr]{list_dec}}.
#' @param nd.var an attribute of the graph vertices containing the node variable (ie, field) on which the comparison will be done. By default \code{nd.var = "type"}.
#' @param focus either \code{"nodes"} (default) or \code{"edges"} to select the type of elements to be compared for the count.
#'
#' @seealso \code{\link[iconr]{list_dec}}, \code{\link[iconr]{list_compar}}, \code{\link[iconr]{plot_compar}}.
#'
#' @return A symmetric matrix with the counts of the pairwise coincidences of nodes or edges. The matrix has as row and column names the names of the corresponding graphs in the input list.
#'
#'
#' @examples
#'
#' # read imgs, nodes and edges dataframes
#' imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
#'                    sep="\t",stringsAsFactors = FALSE)
#' nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
#'                     sep="\t",stringsAsFactors = FALSE)
#' edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
#'                     sep="\t",stringsAsFactors = FALSE)
#' lgrph <- list_dec(imgs,nodes,edges)
#'
#' # Counting same nodes
#' df.same_nodes <- same_elements(lgrph, nd.var = "type",
#'                                focus = "nodes")
#' df.same_nodes
#' ## a symmetric matrix of nodes comparisons
#'
#' # same edges
#' df.same_edges <- same_elements(lgrph, nd.var = "type",
#'                                focus = "edges")
#' df.same_edges
#' ## a symmetric matrix of edges comparisons
#'
same_elements <- function (lgrph, nd.var = "type", focus = "nodes") {
  extract_elements <- list(nodes = function(x) iconr::named_elements(x, focus = "nodes", nd.var),
                           edges = function(x) iconr::named_elements(x, focus = "edges", nd.var))
  if (!focus %in% names(extract_elements)) {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }

  names(lgrph) <- unlist(lapply(lgrph, function(x) x$name))
  g.elements <- lapply(lgrph, extract_elements[[focus]])
  mat.same_elements <- outer(g.elements, g.elements,
                            Vectorize(function(x,y) length(intersect(x,y))))
  return(mat.same_elements)
}
