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
                   doss = dataDir)
eds.df <- read_eds(site = "Ibahernando",
                   decor = "Ibahernando",
                   doss = dataDir)

# Extract the subgraph contemporaneous to the node 2
l_dec_df <- contemp_nds(nds.df, eds.df, selected.nd = 2)

l_dec_df
# $nodes
#           site       decor id     type        x         y
# 39 Ibahernando Ibahernando  2    lance 351.6009 -191.5644
# 40 Ibahernando Ibahernando  3 bouclier 345.0360 -296.6023
# 41 Ibahernando Ibahernando  4     epee 367.3566 -420.6782
#
# $edges
#           site       decor a b type       xa        ya       xb        yb
# 50 Ibahernando Ibahernando 2 3    = 351.6009 -191.5644 345.0360 -296.6023
# 51 Ibahernando Ibahernando 3 4    = 345.0360 -296.6023 367.3566 -420.6782
}
\keyword{ ~kwd1 graphs}
