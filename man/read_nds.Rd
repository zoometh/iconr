\name{read_nds}
\alias{read_nds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read Nodes of a Decoration}
\description{
  Read a '.tsv', a '.csv' or a '.shp' file of nodes and extract nodes of one decoration
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read_nds(site,
        decor,
        doss = getwd(),
        nodes = "nodes",
        dev = ".tsv")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{site}{
    %%     ~~Describe \code{x} here~~
      name of the site
  }
  \item{decor}{
    %%     ~~Describe \code{x} here~~
      name of the decoration
  }
  \item{doss}{
    %%     ~~Describe \code{x} here~~
      path of the working folder, by default working directory
  }
  \item{nodes}{
    %%     ~~Describe \code{x} here~~
      nodes
  }
  \item{dev}{
    %%     ~~Describe \code{x} here~~
      a device '.tsv', '.csv' (with ';' separated values) or '.shp'. If '.tsv' or '.csv' then
    the nodes coordinates (\code{nodes$x}, \code{nodes$y}) are required.
  }
}
\details{
  %%  ~~ If necessary, more details than the description above ~~
}
\value{
  %%  ~Describe the value returned
  %%  If it is a LIST, use
  %%  \item{comp1 }{Description of 'comp1'}
  %%  \item{comp2 }{Description of 'comp2'}
  %% ...
  create a dataframe with, at a minimum, "site", "decor", "id", "x", "y" values for each node.
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

%% ~Make other sections like Warning with \section{Warning }{....} ~


  \examples{
# set data folder
dataDir <- system.file("extdata", package = "decorr")

# read dataframe of nodes
nds.df <- read_nds(	site = "Cerro Muriano", decor = "Cerro Muriano 1",
                    doss = dataDir, dev = ".tsv")
nds.df

# site           decor id          type        x         y
# 1 Cerro Muriano Cerro Muriano 1  1    personnage 349.8148 -298.3244
# 2 Cerro Muriano Cerro Muriano 1  2        casque 349.8148 -243.9851
# 3 Cerro Muriano Cerro Muriano 1  3         lance 238.4637 -298.3244
# 4 Cerro Muriano Cerro Muriano 1  4      bouclier 446.0222 -381.1697
# 5 Cerro Muriano Cerro Muriano 1  5        peigne 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1  7 sexe_masculin 342.6884 -427.4917
# 7 Cerro Muriano Cerro Muriano 1  8    lingot_pdb 451.1489 -237.4782

# read shapefile of nodes
nds.df <- read_nds(	site = "Cerro Muriano", decor = "Cerro Muriano 1",
                    doss = dataDir, dev = ".shp")
nds.df

# site           decor id          type        x         y
# 1 Cerro Muriano Cerro Muriano 1  1    personnage 349.8148 -298.3244
# 2 Cerro Muriano Cerro Muriano 1  2        casque 349.8148 -243.9851
# 3 Cerro Muriano Cerro Muriano 1  3         lance 238.4637 -298.3244
# 4 Cerro Muriano Cerro Muriano 1  4      bouclier 446.0222 -381.1697
# 5 Cerro Muriano Cerro Muriano 1  5        peigne 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1  7 sexe_masculin 342.6884 -427.4917
# 7 Cerro Muriano Cerro Muriano 1  8    lingot_pdb 451.1489 -237.4782
  }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
