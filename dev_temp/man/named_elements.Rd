\name{named_elements}
\alias{named_elements}
\title{Textual Notation of Graph Elements
}
\description{
  Create a textual notation for nodes or edges.
}
\usage{
  named_elements(grph,
                 focus = "edges",
                 nd.var = "type",
                 disamb.marker = "#")
}
\arguments{
  \item{grph}{
    A decoration graph
    (object of class \code{igraph}).
  }
  \item{focus}{
    Textual notation of edges (\code{focus = "edges"}) or nodes
    (\code{focus = "nodes"}). By default \code{focus = "edges"}.
  }
  \item{nd.var}{
    The attribute of the graph nodes containing the node variable (ie, field)
    for the textual annotation. By default \code{nd.var = "type"}.
  }
  \item{disamb.marker}{
    Marker used to disambiguated repeated elements.
    By default \code{disamb.marker = "#"}.
  }
}
\details{
  Edges of type \code{'='} (\emph{normal} edges) are \strong{undirected}, so
  that the order of their nodes is irrelevant and they are presented in
  alphabetical order.
  Conversely, edges of types \code{'+'} (\emph{attribute} edges) and \code{'>'}
  (\emph{diachronic} edges) are \strong{directed}, so that the given order of
  nodes is preserved.

  Repeated node or edge names are
  disambiguated by appending the symbol \code{disamb.marker} (\code{'#'} by
  default) at the end of the second appearance (suffix). Subsequent appearances
  are marked by additional \code{disamb.marker}s.
}
\value{
  A character vector of named nodes or edges.
}

\seealso{
  \code{\link[iconr]{list_compar}},
  \code{\link[iconr]{same_elements}}
}
\examples{
# Read data
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
                   sep="\t", stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
                    sep="\t", stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
                    sep="\t", stringsAsFactors = FALSE)

# Generate list of graphs from the three data.frames
lgrph <- list_dec(imgs, nodes, edges)

# Textual notation of disambiguated edges
named_elements(lgrph[[2]], focus = "edges", nd.var="type")

# Textual notation of disambiguated nodes
named_elements(lgrph[[2]], focus = "nodes", nd.var="type")

}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
