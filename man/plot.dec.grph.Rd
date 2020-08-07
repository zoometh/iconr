\name{plot.dec.grph.Rd}
\alias{plot.dec.grph.Rd}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot Geometric Graph on a Decoration Image}
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
    parameters for node/edges colors, size, taxt size, etc.
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
  create o ggplot and cowplot set of plots
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

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link[stats]{chisq.test}}
}
\examples{
# load sample and plot histograms with Chi-square values showing (un)significant evolution 
nisp.df <- read.table(system.file("extdata", "nispdf.tsv", package = "aritmek4"))
g <- NispDiachr2(nisp.df)
## [1] "compare period: 1--2"
## [1] "0.06"
## [1] "compare period: 2--3"
## [1] "0"
## Warning message:
## In rbind(lhisto, lchi) :
##   number of columns of result is not a multiple of vector length (arg 2)
g

# append row to the dataset and replot
library(tidyverse)
nisp.df2 <- nisp.df %>% add_row(period = 4, BOTA = 50, SUDO = 75, OC = 10)
g2 <- NispDiachr2(nisp.df2)
g2

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
