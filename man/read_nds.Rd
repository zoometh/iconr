\name{read_nds}
\alias{read_nds}
\title{Read Nodes of a Decoration}
\description{
  Read nodes' information from a file including all nodes and extract nodes of one decoration.
  Accepted formats are tab separated values ('tsv'), semicolon separated values ('csv'), or
  shapefile ('shp').
}
\usage{
read_nds(site,
        decor,
        dir = getwd(),
        nodes = "nodes",
        format = "tsv")
}
\arguments{
  \item{site}{
      Name of the site
  }
  \item{decor}{
      Name of the decoration
  }
  \item{dir}{
      Path to the working folder, by default it is the working directory
  }
  \item{nodes}{
      Name of the nodes file (a dataframe or a shapefile)
  }
  \item{format}{
    File extension indicating a file format from 'tsv' (tab separated values),
    'csv' (semicolon separated values) or 'shp' (shapefile). For 'tsv' and 'csv'
    the files must include node coordinates (\code{nodes$x}, \code{nodes$y}).
  }
}
\value{
  Create a dataframe of node with, at a minimum, "site", "decor", "id", "x", "y" values for each node.
}

\examples{
# Set data folder
dataDir <- system.file("extdata", package = "iconr")

# Read dataframe of nodes
nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                    dir = dataDir, format = "tsv")
nds.df
## Dataframe of nodes

# Read shapefile of nodes
nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                    dir = dataDir, format = "shp")
nds.df
## Dataframe of nodes

}

\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
