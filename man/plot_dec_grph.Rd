\name{plot_dec_grph}
\alias{plot_dec_grph}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot Geometric Graph on a Picture of the Decoration}
\description{
  Plot a peometric graph (i.e. planar graph) over a decoration image, for nodes only, for edges only, or for both
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot_dec_grph(nds.df,
              eds.df,
              site,
              decor,
              doss=getwd(),
              shw=c("nodes"),
              lbl.txt='id',
              nd.color='orange',
              nd.size=1.7,
              lbl.color='white',
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
    path of the working folder, by default the working directory
}
            \item{shw}{
%%     ~~Describe \code{x} here~~
    show only 'nodes' (by default), only 'edges', or both c('nodes','edges')
}
              \item{lbl.txt}{
%%     ~~Describe \code{x} here~~
    fieldname of the nodes that will be displayed, by default nodes 'id' 
}
              \item{nd.color,
                    nd.size,
                    lbl.color,
                    lbl.size,
                    ed.color,
                    ed.lwd}{
%%     ~~Describe \code{x} here~~
    graphical parameters for node/edges colors, node/edges size, text size, etc.
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
# set wd to data folder
setwd(system.file("extdata", package = "decorr"))
# read nodes and edges
nds.df <- read_nds(site = "Cerro Muriano",decor = "Cerro Muriano 1",dev = ".tsv")
eds.df <- read_eds(site = "Cerro Muriano",decor = "Cerro Muriano 1",dev = ".tsv")
img.graph <- plot_dec_grph(nds.df = nds.df,
                           eds.df = eds.df,
                           site = "Cerro Muriano",
                           decor = "Cerro Muriano 1",
                           lbl.txt = "type",
                           shw = c("nodes","edges"))
img.graph
## plot the graph of 'Cerro Muriano 1' with nodes' "type" as labels
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
