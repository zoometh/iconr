#' Select Contemporaneous Nodes
#' @name contemp_nds
#'
#' @description   Find the connected component, or subgraph, of contemporaneous nodes (connected by \emph{normal} and \emph{attribute} edges) given a selected node and remove the other components.
#'
#' @param nds.df dataframe of the nodes as the one obtained by the function \code{\link[iconr]{read_nds}}.
#' @param eds.df dataframe of the edges as the one obtained by the function \code{\link[iconr]{read_eds}}.
#' @param selected.nd The node of the decoration graph for which to extract the connected component. It can be either the node order (numeric) or the node name/id (character).
#'
#' @return A named list of two dataframes: \code{list(nodes, edges)}, collecting the contemporaneous nodes and edges, respectivelly.
#'
#'
#' @examples
#'
#' # Set data folder
#' dataDir <- system.file("extdata", package = "iconr")
#'
#' # Read a decoration
#' nds.df <- read_nds(site = "Ibahernando",
#'                    decor = "Ibahernando",
#'                    dir = dataDir)
#' eds.df <- read_eds(site = "Ibahernando",
#'                    decor = "Ibahernando",
#'                    dir = dataDir)
#'
# Extract the subgraph contemporaneous to the node 2
#' l_dec_df <- contemp_nds(nds.df, eds.df, selected.nd = 2)
#'
#' ## It returns a list of two dataframes, one for nodes and one for edges:
#' l_dec_df
#'
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
