\name{read.eds}
\alias{read.eds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read Edges}
\description{
  Read a '.tsv' or a '.shp' file of edges
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
eds.df <- read.eds(doss = doss,
                   site = site,
                   decor = decor,
                   edges = "edges",
                   nodes = "nodes",
                   dev = ".tsv")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{doss}{
%%     ~~Describe \code{x} here~~
    path of the working folder
}
        \item{site}{
%%     ~~Describe \code{x} here~~
    name of the site
}
          \item{decor}{
%%     ~~Describe \code{x} here~~
    name of the decoration
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
    a device '.tsv' or '.shp'
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
  create a 'data.frame' with "site"  "decor" "typ"   "a"     "b"     "xa"    "ya"    "xb"    "yb"   values for each edge
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
# read dataframe of edges
eds.df <- read.eds(doss = doss,site = site,decor = decor,edges = "edges",dev = ".tsv")
# read shapefile of edges
eds.df <- read.eds(doss = doss,site = site,decor = decor,edges = "edges",dev = ".shp")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
