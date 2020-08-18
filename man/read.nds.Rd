\name{read.nds}
\alias{read.nds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read Nodes of a Decoration}
\description{
  Read a '.tsv' or a '.shp' file of nodes
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.nds(site, decor, doss = getwd(), nodes = "nodes", dev =
                    ".tsv")
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
  create a 'data.frame' with "site"  "decor" "id"    "type"  "x"     "y"  values for each node
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
# read dataframe of nodes
nds.df <- read.nds(doss = doss,site = site,decor = decor,nodes = "nodes",dev = ".tsv")
# read shapefile of nodes
nds.df <- read.nds(doss = doss,site = site,decor = decor,nodes = "nodes",dev = ".shp")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
