\name{read_nds}
\alias{read_nds}
\title{Read Nodes of a Decoration}
\description{
  Read a '.tsv', a '.csv' or a '.shp' file of nodes and extract nodes of one decoration
}
\usage{
read_nds(site,
        decor,
        dir = getwd(),
        nodes = "nodes",
        dev = ".tsv")
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
  \item{dev}{
      A device '.tsv' (with '\\t' separated values), '.csv' (with ';' separated values) or '.shp'. If '.tsv' or '.csv' then the nodes coordinates (\code{nodes$x}, \code{nodes$y}) are required.
  }
}
\value{
  Create a dataframe with, at a minimum, "site", "decor", "id", "x", "y" values for each node.
}
  \examples{
# Set data folder
dataDir <- system.file("extdata", package = "iconr")

# Read dataframe of nodes
nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                    dir = dataDir, dev = ".tsv")
nds.df

#            site           decor id          type        x         y
# 1 Cerro Muriano Cerro Muriano 1  1    personnage 349.8148 -298.3244
# 2 Cerro Muriano Cerro Muriano 1  2        casque 349.8148 -243.9851
# 3 Cerro Muriano Cerro Muriano 1  3         lance 238.4637 -298.3244
# 4 Cerro Muriano Cerro Muriano 1  4      bouclier 446.0222 -381.1697
# 5 Cerro Muriano Cerro Muriano 1  5        peigne 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1  7 sexe_masculin 342.6884 -427.4917
# 7 Cerro Muriano Cerro Muriano 1  8    lingot_pdb 451.1489 -237.4782

# Read shapefile of nodes
nds.df <- read_nds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                    dir = dataDir, dev = ".shp")
nds.df

#            site           decor id          type        x         y
# 1 Cerro Muriano Cerro Muriano 1  1    personnage 349.8148 -298.3244
# 2 Cerro Muriano Cerro Muriano 1  2        casque 349.8148 -243.9851
# 3 Cerro Muriano Cerro Muriano 1  3         lance 238.4637 -298.3244
# 4 Cerro Muriano Cerro Muriano 1  4      bouclier 446.0222 -381.1697
# 5 Cerro Muriano Cerro Muriano 1  5        peigne 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1  7 sexe_masculin 342.6884 -427.4917
# 7 Cerro Muriano Cerro Muriano 1  8    lingot_pdb 451.1489 -237.4782
  }

\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
