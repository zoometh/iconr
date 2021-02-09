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
#          site           decor a b type       xa        ya       xb        yb
# 1 Cerro Muriano Cerro Muriano 1 1 8    = 349.8148 -298.3244 451.1489 -237.4782
# 2 Cerro Muriano Cerro Muriano 1 4 8    = 446.0222 -381.1697 451.1489 -237.4782
# 3 Cerro Muriano Cerro Muriano 1 1 4    = 349.8148 -298.3244 446.0222 -381.1697
# 4 Cerro Muriano Cerro Muriano 1 1 5    = 349.8148 -298.3244 283.0041 -358.0086
# 5 Cerro Muriano Cerro Muriano 1 3 5    = 238.4637 -298.3244 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1 1 2    + 349.8148 -298.3244 349.8148 -243.9851
# 7 Cerro Muriano Cerro Muriano 1 1 7    + 349.8148 -298.3244 342.6884 -427.4917
# 8 Cerro Muriano Cerro Muriano 1 3 1    = 238.4637 -298.3244 349.8148 -298.3244

# Read shapefile
eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                   dir = dataDir, edges = "edges", format = "shp")
eds.df
#          site           decor a b type       xa        ya       xb        yb
# 1 Cerro Muriano Cerro Muriano 1 1 8    = 349.8148 -298.3244 451.1489 -237.4782
# 2 Cerro Muriano Cerro Muriano 1 4 8    = 446.0222 -381.1697 451.1489 -237.4782
# 3 Cerro Muriano Cerro Muriano 1 1 4    = 349.8148 -298.3244 446.0222 -381.1697
# 4 Cerro Muriano Cerro Muriano 1 1 5    = 349.8148 -298.3244 283.0041 -358.0086
# 5 Cerro Muriano Cerro Muriano 1 3 5    = 238.4637 -298.3244 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1 1 2    + 349.8148 -298.3244 349.8148 -243.9851
# 7 Cerro Muriano Cerro Muriano 1 1 7    + 349.8148 -298.3244 342.6884 -427.4917
# 8 Cerro Muriano Cerro Muriano 1 3 1    = 238.4637 -298.3244 349.8148 -298.3244
}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
