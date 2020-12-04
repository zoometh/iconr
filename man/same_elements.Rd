\name{same_elements}
\alias{same_elements}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Number of Equal Nodes or Edges Between Each Decoration Pair}
\description{
  Create the (simmetric) matrix with the count of common nodes/edges for each
  pair of decorations (graphs) from a list.
  The comparison is performed with respect to a given node variable (attribute).
  In addition, edges equality requires also same edge type.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
same_elements(lgrph, nds.var = "type",
               focus = "nodes")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{lgrph}{
%%     ~~Describe \code{x} here~~
    A list of any number of graphs to be pairwise compared. The list can
    be typically obtained with the function \code{list_dec()}
}
      \item{nds.var}{
%%     ~~Describe \code{x} here~~
    An attribute of the graph vertices containing the node variable (ie, field)
    on which the comparison will be done. By default \code{nds.var = "type"}.
}
      \item{focus}{
%%     ~~Describe \code{x} here~~
      Either \code{"nodes"} (default) or \code{"edges"}. It selects the
      type of elements to be compared for the count.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
  Observe that the output diagonal elements show the coincidences of each decoration with itself. Thus, it coincides with the total number of nodes or edges.

  Nodes are common when they have the same value for a given variable, for example 'horse', 'sword', etc., for \code{nds.var = "type"}.

  Edges are common when they have the same value for \emph{starting} and \emph{ending} nodes ('horse', 'sword', etc.) and the same type of edge ('=', '+', etc.).
  For example, \code{a -=- b} in graph 1 is equal to \code{a -=- b} in graph 2, but not equal to \code{a -+- b}. Edges of type "=" are undirected, so that \code{a -=- b} is equal to \code{b -=- a}. But edges of types "+" or ">" are directed, so that \code{a ->- b} is not equal to \code{b ->- a}.

  If any of the graphs has multiple nodes/edges with the same value, it is considered to count for as many coincidences as the smaller multiplicity. For instance, if there are 2 nodes with value "sword" in graph 1, and 3 nodes with value "sword" in graph 2, they count as 2 coincidences.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
  A symetric matrix with the counts of the pairwise coincidences of nodes or edges. The matrix has as row and column names the names of nodes or edges, respectively.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link[decorr]{list_dec}},
  \code{\link[decorr]{list_compar}},
  \code{\link[decorr]{plot_compar}}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
lgrph <- list_dec(imgs,nodes,edges)

# Counting same nodes
df.same_nodes <- same_elements(lgrph, nds.var = "type",
                               focus = "nodes")
df.same_nodes
#   1  2 3  4 5
# 1 7  2 3  4 2
# 2 2 12 5  9 3
# 3 3  5 6  4 3
# 4 4  9 4 12 3
# 5 2  3 3  3 4

# same edges
df.same_edges <- same_elements(lgrph, nds.var = "type",
                               focus = "edges")
df.same_edges
#   1  2  3  4 5
# 1 8  0  1  2 0
# 2 0 15  3  7 1
# 3 1  3 10  1 2
# 4 2  7  1 14 1
# 5 0  1  2  1 4
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
