\name{plot_nds_compar}
\alias{plot_nds_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot and Save a Figure of Nodes Comparison Between Two Graphs}
\description{
  Plot and save two figures side-by-side for a graph pairwise with common nodes identified
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot_nds_compar(listg,
                graph2,
                var)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{listg}{
%%     ~~Describe \code{x} here~~
    a list of graph obtained with the function 'list_nds_compar'
}
    \item{graph2}{
%%     ~~Describe \code{x} here~~
    a vector with the two idf of the graphs
}
        \item{var}{
%%     ~~Describe \code{x} here~~
    the filed on which the comparison will be done, by default 'type'
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

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link[decorr]{list_nds_compar}},\code{\link[decorr]{plot_eds_compar}}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# set wd to data folder
setwd(system.file("extdata", package = "decorr"))
# read data
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
lgrph <- list_dec(imgs,nodes,edges,var="type")
g.compar <- list_nds_compar(lgrph,"type")
plot_nds_compar(g.compar,c(1,4))
# plot graph 1 and graph 4 sid-by-side with common nodes identified
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
