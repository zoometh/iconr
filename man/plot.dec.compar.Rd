\name{plot.dec.compar}
\alias{plot.dec.compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot and Save Drawings of a Comparison Between Two Graphs}
\description{
  Plot and save two drawings side-by-side for a graph pairwise with common edges identified
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot.dec.comp <- function(listg,graph2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{listg}{
%%     ~~Describe \code{x} here~~
    a list of graph obtained with the function 'list.grph.compar'
}
    \item{graph2}{
%%     ~~Describe \code{x} here~~
    a vector with the two idf of the graphs
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
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
lgrph <- list.grph(imgs,nodes,edges,var="type")
g.compar <- list.grph.compar(lgrph)
plot.dec.comp(g.compar,c(1,4))
# plot graph 1 and graph 4 sid-by-sid with common edges identified
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
