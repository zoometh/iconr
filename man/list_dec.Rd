\name{list_dec}
\alias{list_dec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Create Decoration's Graphs and Store them in a List}
\description{
  Create undirected graphs for each decoration from \code{nodes}, \code{edges} and \code{imgs} dataframes and store the graphs in a list.
  The join between these dataframes is done on the two fields \code{site} and \code{decor}.
  Graph names refer to \code{imgs$idf}.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
  list_dec(imgs,
           nodes,
           edges)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{imgs}{
%%     ~~Describe \code{x} here~~
    Dataframe of decorations
}
        \item{nodes}{
%%     ~~Describe \code{x} here~~
    Dataframe of nodes
}
          \item{edges}{
%%     ~~Describe \code{x} here~~
    Dataframe of edges
}
}
\value{
  Return a list of graphs \code{igraph}
}
\seealso{
  \code{\link[igraph]{graph_from_data_frame}}
}

\examples{
# Read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.csv", package = "iconr"),
                   sep=";", stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.csv", package = "iconr"),
                    sep=";", stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.csv", package = "iconr"),
                    sep=";", stringsAsFactors = FALSE)
# Create the list of graphs
lgrph <- list_dec(imgs, nodes, edges)

# Get the first graph
g <- lgrph[[1]]
g

# Graph name
g$name

# Graph label
g$lbl

# Graph number of nodes
igraph::gorder(g)

# Graph number of edges
igraph::gsize(g)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
