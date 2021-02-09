\name{same_elements}
\alias{same_elements}
\title{Number of Equal Elements Between Each Decoration Pair}
\description{
  Create the (symmetric) dataframe with the count of \strong{common nodes} or \strong{common edges} (see \code{\link[iconr]{list_compar}} for comparison criteria) for each pair of decorations (graphs) from a list. The diagonal of the symmetric dataframe is filled with counts of nodes/edges for each decoration.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
same_elements(lgrph, nd.var = "type",
               focus = "nodes")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{lgrph}{
%%     ~~Describe \code{x} here~~
    A list of any number of graphs to be pairwise compared. The list can
    be typically obtained with the function \code{\link[iconr]{list_dec}}
}
      \item{nd.var}{
%%     ~~Describe \code{x} here~~
    An attribute of the graph vertices containing the node variable (ie, field)
    on which the comparison will be done. By default \code{nd.var = "type"}.
}
      \item{focus}{
%%     ~~Describe \code{x} here~~
      Either \code{"nodes"} (default) or \code{"edges"} to select the
      type of elements to be compared for the count.
}
}
\value{
  A symmetric matrix with the counts of the pairwise coincidences of nodes or edges. The matrix has as row and column names the names of the corresponding graphs in the input list.
}
\seealso{
  \code{\link[iconr]{list_dec}},
  \code{\link[iconr]{list_compar}},
  \code{\link[iconr]{plot_compar}}
}

\examples{
# read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
                    sep="\t",stringsAsFactors = FALSE)
lgrph <- list_dec(imgs,nodes,edges)

# Counting same nodes
df.same_nodes <- same_elements(lgrph, nd.var = "type",
                               focus = "nodes")
df.same_nodes
## a symmetric matrix of nodes comparisons

# same edges
df.same_edges <- same_elements(lgrph, nd.var = "type",
                               focus = "edges")
df.same_edges
## a symmetric matrix of edges comparisons

}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
