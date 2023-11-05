#' Create Decoration's Graphs and Store them in a List
#' @name list_dec
#'
#' @description Create undirected graphs for each decoration from \code{nodes}, \code{edges} and \code{imgs} dataframes and store the graphs in a list. The join between these dataframes is done on the two fields \code{site} and \code{decor}. Graph names refer to \code{imgs$idf}.
#'
#' @param imgs dataframe of decorations.
#' @param nodes dataframe of nodes.
#' @param edges dataframe of edges.
#'
#' @return A list of \code{igraph} graphs.
#'
#' @seealso \code{\link[igraph]{graph_from_data_frame}}
#'
#'
#' @examples
#'
#' # Read imgs, nodes and edges dataframes
#' imgs <- read.csv2(system.file("extdata", "imgs.tsv", package = "iconr"),
#'                   sep="\t", stringsAsFactors = FALSE)
#' nodes <- read.csv2(system.file("extdata", "nodes.tsv", package = "iconr"),
#'                    sep="\t", stringsAsFactors = FALSE)
#' edges <- read.csv2(system.file("extdata", "edges.tsv", package = "iconr"),
#'                    sep="\t", stringsAsFactors = FALSE)
#' # Create the list of graphs
#' lgrph <- list_dec(imgs, nodes, edges)
#'
#' # Get the first graph
#' g <- lgrph[[1]]
#' g
#'
#' # Graph name
#' g$name
#'
#' # Graph label
#' g$lbl
#'
#' # Graph number of nodes
#' igraph::gorder(g)
#'
#' # Graph number of edges
#' igraph::gsize(g)
#'
#' @export
list_dec <- function(imgs, nodes, edges) {
    lgrph <- list()
    for (r in seq_len(nrow(imgs))) {
      # r <- 1
        a.enr <- imgs[r, ]
        g.nodes <- nodes[nodes$site == a.enr$site & nodes$decor == a.enr$decor,
                         ! (names(nodes) %in% c("site", "decor"))]
        g.edges <- edges[edges$site == a.enr$site & edges$decor == a.enr$decor,
                         ! (names(edges) %in% c("site", "decor"))]
        # create graph
        g <- igraph::graph_from_data_frame(g.edges, directed = FALSE,
                                           vertices = g.nodes)
        # attributes
        g$name <- a.enr$idf
        g$site <- a.enr$site
        g$decor <- a.enr$decor
        g$lbl <- paste0(g$name, "-", g$site, ".", g$decor)
        g$img <- a.enr$img
        lgrph[[r]] <- g
    }
    return(lgrph)
}

# imgs <- read.table(system.file("extdata", "imgs.csv", package = "iconr"),
#                    sep=";", stringsAsFactors = FALSE)
# nodes <- read.table(system.file("extdata", "nodes.csv", package = "iconr"),
#                     sep=";", stringsAsFactors = FALSE)
# edges <- read.table(system.file("extdata", "edges.csv", package = "iconr"),
#                     sep=";", stringsAsFactors = FALSE)
# lgrph <- list_dec(imgs, nodes, edges)
