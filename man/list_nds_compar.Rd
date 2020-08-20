\name{list_nds_compar}
\alias{list_nds_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{List Graph with Common Nodes}
\description{
    List of graph pairwise comparisons on common nodes with common nodes identified by different colors and/or sizes
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
list_nds_compar(lgrph,
                var="type",
                common.nds.color="red",
                different.nds.color="orange",
                common.nds.size=1,
                different.nds.size=.5,
                verbose=F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lgrph}{
%%     ~~Describe \code{x} here~~
    a list of graph obtained with the function 'list.grph'
}
    \item{var}{
%%     ~~Describe \code{x} here~~
    the field on which the comparison will be done, by default "type"
}
    \item{common.nds.color}{
%%     ~~Describe \code{x} here~~
    color for nodes common between two graphs
}
      \item{different.nds.color}{
%%     ~~Describe \code{x} here~~
    color for nodes different between two graphs
}
        \item{common.nds.size}{
%%     ~~Describe \code{x} here~~
    size (cex) for common nodes between two graphs
}
          \item{different.eds.width}{
%%     ~~Describe \code{x} here~~
    size (cex) for different nodes between two graphs
}
            \item{verbose}{
%%     ~~Describe \code{x} here~~
    verbose
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
  return a list of pairwise graphs
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
# read graphs
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
# use a sample
imgs <- subset(imgs,site %in% c("Cerro Muriano","Zarza de Montanchez"))
nodes <- subset(nodes,site %in% c("Cerro Muriano","Zarza de Montanchez"))
edges <- subset(edges,site %in% c("Cerro Muriano","Zarza de Montanchez"))
# list graphs
lgrph <- list_dec(imgs,nodes,edges,var="type")
g.compar <- list_nds_compar(lgrph,"type")
g.compar

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
