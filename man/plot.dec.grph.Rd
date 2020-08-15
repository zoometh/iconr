\name{plot.dec.grph}
\alias{plot.dec.grph}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot Geometric Graph on a Image of the Decoration}
\description{
  Plot a geometric graph over a decoration image, for nodes only, for edges only, or for both
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot.dec.grph <- function(nds.df,
                          eds.df,
                          doss,
                          site,
                          decor,
                          shw=c("nodes"),
                          nd.color='orange',
                          nd.size=1.7,
                          lbl.txt='id',
                          lbl.color='orange',
                          lbl.size=1.2,
                          ed.color='orange',
                          ed.lwd=4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nds.df}{
%%     ~~Describe \code{x} here~~
    a dataframe of nodes
}
    \item{eds.df}{
%%     ~~Describe \code{x} here~~
    a dataframe of edges
}
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
            \item{shw}{
%%     ~~Describe \code{x} here~~
    show only 'nodes', only 'edges', or both c('nodes','edges')
}
              \item{nd.color, nd.size,...}{
%%     ~~Describe \code{x} here~~
    parameters for node/edges colors, size, text size, etc.
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
  create a 'magick-image'
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
doss <- system.file("extdata", package = "decorr")
site <- "Cerro Muriano"
decor <- "Cerro Muriano 1"
nds.df <- read.nds(doss = doss,site = site,decor = decor,nodes = "nodes",dev = ".tsv")
eds.df <- read.eds(doss = doss,site = site,decor = decor,edges = "edges",dev = ".shp")
img.graph <- plot.dec.grph(nds.df = nds.df,
                           eds.df = eds.df,
                           doss = doss,
                           site = site,
                           decor = decor,
                           lbl.txt = "type",
                           shw = c("nodes","edges"))
img.graph
## plot the graph of 'Cerro Muriano 1' with nodes' "type" as labels
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
