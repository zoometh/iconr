\name{read_eds}
\alias{read_eds}
\title{Read Edges of a Decoration}
\description{
  Read edges' information from a file including all edges and extract edges of one decoration.
  Accepted formats are tab separated values ('tsv'), semicolon separated values ('csv'), or
  shapefile ('shp').
}
\usage{
read_eds(site,
         decor,
         dir = getwd(),
         edges = "edges",
         nodes = "nodes",
         format = "tsv")
}
\arguments{
        \item{site}{
    Name of the site.
}
          \item{decor}{
    Name of the decoration.
}
        \item{dir}{
    Path to the working folder, by default it is the working directory.
}
            \item{edges}{
    Name of the edges file (a dataframe or a shapefile).
}
            \item{nodes}{
    Name of the nodes file (a dataframe or a shapefile).
}
              \item{format}{
    File extension indicating a file format from 'tsv' (tab separated values),
    'csv' (semicolon separated values) or 'shp' (shapefile). For 'tsv' and 'csv'
    the coordinates of the edges will be calculated from the same decoration's
    node dataframe.
}
}
\details{
Subset the dataframe of edges depending on 'site' and 'decor'.
}
\value{
  Create a dataframe of edges with, at a minimum, "site", "decor", "a", "b", "xa", "ya", "xb", "yb"
  values for each edge.
}

\examples{
# Set data folder
dataDir <- system.file("extdata", package = "iconr")

# Read .tsv file
eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                   dir = dataDir, edges = "edges", format = "tsv")
eds.df
## Dataframe of edges

# Read shapefile
eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                   dir = dataDir, edges = "edges", format = "shp")
eds.df
## Dataframe of edges

}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
