\name{contemp_nds}
\alias{contemp_nds}

\title{Select Contemporaneous Nodes}
\description{
  Find the connected component, or subgraph, of contemporaneous nodes (connected by \emph{normal} and \emph{attribute} edges) given a selected node and remove the other components
}
\usage{
  contemp_nds(nds.df, eds.df, selected.nd)
}
\arguments{
  \item{nds.df}{
      Dataframe of the nodes as the one obtained by the function
      \code{\link[iconr]{read_nds}}.
  }
  \item{eds.df}{
      Dataframe of the edges as the one obtained by the function
      \code{\link[iconr]{read_eds}}.
  }
  \item{selected.nd}{
      The node of the decoration graph for which to extract the connected component. It can be either the node order (numeric) or the node name/id (character).
  }
}
\value{
  Returns a list of two dataframes:
  \item{df1}{contemporaneous nodes}
  \item{df2}{contemporaneous edges}
}

\examples{
# Set data folder
dataDir <- system.file("extdata", package = "iconr")

# Read a decoration
nds.df <- read_nds(site = "Ibahernando",
                   decor = "Ibahernando",
                   dir = dataDir)
eds.df <- read_eds(site = "Ibahernando",
                   decor = "Ibahernando",
                   dir = dataDir)

# Extract the subgraph contemporaneous to the node 2
l_dec_df <- contemp_nds(nds.df, eds.df, selected.nd = 2)

l_dec_df
## Return two dataframes, one for nodes, one for edges
}
\keyword{ ~kwd1 graphs}
