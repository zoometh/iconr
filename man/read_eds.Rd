\name{read_eds}
\alias{read_eds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read Edges of a Decoration}
\description{
  Read a '.tsv', a '.csv' or a '.shp' file of edges and extract edges of one decoration
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read_eds(site,
         decor,
         doss = getwd(),
         edges = "edges",
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
            \item{edges}{
%%     ~~Describe \code{x} here~~
    edges
}
            \item{nodes}{
%%     ~~Describe \code{x} here~~
    nodes
}
              \item{dev}{
%%     ~~Describe \code{x} here~~
    a device '.tsv', '.csv' (with ';' separated values) or '.shp'. If '.tsv', '.csv' then
    the coordinates of the edges will be calculated from the same decoration's nodes dataframe or shapefile.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
subset the dataframe of edges depending on 'site' and 'decor'
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
  create a data.frame with, at a minimum, "site", "decor", "a", "b", "xa", "ya", "xb", "yb"
  values for each edge
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

# read .tsv file
eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                   doss = dataDir, edges = "edges", dev = ".tsv")
eds.df
# site           decor a b type       xa        ya       xb        yb
# 1 Cerro Muriano Cerro Muriano 1 1 8    = 349.8148 -298.3244 451.1489 -237.4782
# 2 Cerro Muriano Cerro Muriano 1 4 8    = 446.0222 -381.1697 451.1489 -237.4782
# 3 Cerro Muriano Cerro Muriano 1 1 4    = 349.8148 -298.3244 446.0222 -381.1697
# 4 Cerro Muriano Cerro Muriano 1 1 5    = 349.8148 -298.3244 283.0041 -358.0086
# 5 Cerro Muriano Cerro Muriano 1 3 5    = 238.4637 -298.3244 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1 1 2    + 349.8148 -298.3244 349.8148 -243.9851
# 7 Cerro Muriano Cerro Muriano 1 1 7    + 349.8148 -298.3244 342.6884 -427.4917
# 8 Cerro Muriano Cerro Muriano 1 3 1    = 238.4637 -298.3244 349.8148 -298.3244

# read shapefile
eds.df <- read_eds(site = "Cerro Muriano", decor = "Cerro Muriano 1",
                   doss = dataDir, edges = "edges", dev = ".shp")
eds.df
# site           decor a b type       xa        ya       xb        yb
# 1 Cerro Muriano Cerro Muriano 1 1 8    = 349.8148 -298.3244 451.1489 -237.4782
# 2 Cerro Muriano Cerro Muriano 1 4 8    = 446.0222 -381.1697 451.1489 -237.4782
# 3 Cerro Muriano Cerro Muriano 1 1 4    = 349.8148 -298.3244 446.0222 -381.1697
# 4 Cerro Muriano Cerro Muriano 1 1 5    = 349.8148 -298.3244 283.0041 -358.0086
# 5 Cerro Muriano Cerro Muriano 1 3 5    = 238.4637 -298.3244 283.0041 -358.0086
# 6 Cerro Muriano Cerro Muriano 1 1 2    + 349.8148 -298.3244 349.8148 -243.9851
# 7 Cerro Muriano Cerro Muriano 1 1 7    + 349.8148 -298.3244 342.6884 -427.4917
# 8 Cerro Muriano Cerro Muriano 1 3 1    = 238.4637 -298.3244 349.8148 -298.3244
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
