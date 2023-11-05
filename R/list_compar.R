#' Graph Pairwise Comparison on Common Elements
#'
#' @name list_compar
#'
#' @aliases list_compar
#'
#' @description \code{nds_compar} identifies \strong{common nodes} in a pair of graphs. \code{eds_compar} identifies \strong{common edges} in a pair of graphs. Given a list of graphs, \code{list_compar} extract all combinations of graph pairs and compare them on common elements (nodes and edges).
#'
#' @param lgrph a list of any number of graphs to be pairwise compared. The list can be typically obtained with the function \code{\link[iconr]{list_dec}}.
#' @param nd.var an attribute of the graph nodes containing the node variable (ie, field) on which the comparison will be done. By default \code{nd.var = "type"}.
#' @param verbose logical. If TRUE, the names of each graph pair combination are listed on the screen. By default \code{verbose = FALSE}.
#'
#' @details \code{list_compar()} calls the functions: \code{nds_compar()} and \code{eds_compar()} which return respectively the \strong{common nodes} and the \strong{common edges} of a graph pairwise. \strong{Nodes} are common when they have the same value for a given variable, for example \code{horse}, \code{sword}, etc., for the variable \code{type} (\code{nd.var = "type"}). \strong{Edges} are common when they have the same value for \emph{starting} and \emph{ending} nodes (\code{horse}, \code{sword}, etc.) and the same type of edge (\code{'='}, \code{'+'}, etc.). For example, \code{a -=- b} in graph 1 is equal to \code{a -=- b} in graph 2, but not equal to \code{a -+- b}. Edges of type \code{=} (\emph{normal} edges) are undirected, so that \code{a -=- b} is equal to \code{b -=- a}. But edges of types \code{+} (\emph{attribute} edges) or \code{>} (\emph{diachronic} edges) are directed, so: \code{a ->- b} is not equal to \code{b ->- a}. If any of the graphs has multiple nodes/edges with the same value, it is considered to count for as many coincidences as the smaller multiplicity. For instance, if there are 2 nodes with value \code{epee} in graph 1, and 3 nodes with value \code{epee} in graph 2, their number of common nodes is \code{min(2, 3) = 2}.
#'
#' @return \code{nds_compar()} returns the input pair of graphs, each complemented with a new node attribute named \code{comm} with value 1 for common nodes and 0 for non-common nodes. \code{eds_compar()} returns the input pair of graphs, each complemented with a new edge attribute named \code{comm} with value 1 for common edges and 0 for non-common edges. \code{list_compar()} returns a list of all combinations of graph pairs. For each pair, both graphs are complemented with the node attribute (\code{comm}) identifying common nodes and the edge attribute (\code{comm}) identifying common edges. Each pair is also complemented with an attribute named \code{nd.var} recording the compared node variable.
#'
#' @seealso \code{\link[iconr]{list_dec}}, \code{\link[iconr]{plot_compar}}, \code{\link[iconr]{same_elements}}.
#'
#'
#' @examples
#'
#' # Read data
#' imgs <- read.csv2(system.file("extdata", "imgs.tsv", package = "iconr"),
#'                   sep="\t", stringsAsFactors = FALSE)
#' nodes <- read.csv2(system.file("extdata", "nodes.tsv", package = "iconr"),
#'                    sep="\t", stringsAsFactors = FALSE)
#' edges <- read.csv2(system.file("extdata", "edges.tsv", package = "iconr"),
#'                    sep="\t", stringsAsFactors = FALSE)
#' # Generate list of graphs from the three data.frames
#' lgrph <- list_dec(imgs, nodes, edges)
#'
#' # Generate list of all graph comparisons depending on the node "type" variable
#' g.compar <- list_compar(lgrph, nd.var = "type")
#'
#' length(g.compar)
#' ## Ten pairwise comparisons
#'
#' # Inspect the second pairwise comparison of the list
#' g.compar[[2]]
#' ## The two compared graphs with the name of the comparison variable
#'
#' # Inspecting nodes:
#' igraph::as_data_frame(g.compar[[2]][[1]], "vertices")
#' ## Vertices from the first decoration graph
#'
#' igraph::as_data_frame(g.compar[[2]][[2]], "vertices")
#' ## Vertices from the second decoration graph
#'
#' # Inspecting edges:
#' igraph::as_data_frame(g.compar[[2]][[1]])
#' ## Edges of the first decoration graph
#'
#' igraph::as_data_frame(g.compar[[2]][[2]])
## Edges of the second decoration graph
#'
#' @export
list_compar <- function(lgrph, nd.var = "type",
                        verbose = FALSE) {
  # Get the vertex names of each graph of the graph list.
  # lgrph <- c(1,4)
  ldec.comp <- utils::combn(seq_len(length(lgrph)), 2)
  if (verbose) {
    print(paste0("there is ", ncol(ldec.comp),
                 " pairwise comparisons to compute"))
  }
  grphAllcompar <- list()
  for (dec in seq_len(ncol(ldec.comp))) {
    idx.g <- ldec.comp[, dec]
    if (verbose) {
      tit <- paste0("compare decorations '", lgrph[[idx.g[1]]]$name,
                    "' and '", lgrph[[idx.g[2]]]$name, "'")
      print(paste0("    ", dec, ") ", tit))
    }
    grph <- eds_compar(lgrph[idx.g], nd.var)
    grph <- nds_compar(grph, nd.var)
    attributes(grph)$nd.var <- nd.var
    grphAllcompar[[dec]] <- grph
  }
  return(grphAllcompar)
}

nds_compar <- function(grphs, nd.var = "type") {
  g.nds <- lapply(grphs, function(x) iconr::named_elements(x, "nodes", nd.var))
  common.nodes <- intersect(g.nds[[1]], g.nds[[2]])
  for (i in 1:2) {
    igraph::V(grphs[[i]])$comm <- as.numeric(g.nds[[i]] %in% common.nodes)
  }
  return(grphs)
}

eds_compar <- function(grphs, nd.var = "type") {
  g.eds <- lapply(grphs, function(x) iconr::named_elements(x, "edges", nd.var))
  common.edges <- intersect(g.eds[[1]], g.eds[[2]])
  for (i in 1:2) {
    igraph::E(grphs[[i]])$comm <- as.numeric(g.eds[[i]] %in% common.edges)
  }
  return(grphs)
}

# imgs <- read.csv2(system.file("extdata", "imgs.tsv", package = "iconr"),
#                    sep="\t", stringsAsFactors = FALSE)
# nodes <- read.csv2(system.file("extdata", "nodes.tsv", package = "iconr"),
#                     sep="\t", stringsAsFactors = FALSE)
# edges <- read.csv2(system.file("extdata", "edges.tsv", package = "iconr"),
#                     sep="\t", stringsAsFactors = FALSE)
# # Generate list of graphs from the three data.frames
# lgrph <- list_dec(imgs, nodes, edges)
#
# # Generate list of all graph comparisons depending on the node "type" variable
# g.compar <- list_compar(lgrph, nd.var = "type")
