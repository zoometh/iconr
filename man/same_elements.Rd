\name{same_elements}
\alias{same_elements}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Matching Nodes and Edges in a Pairwise Comparison}
\description{
  Create a symetrical matrix with the count of common nodes/edges for each pairwise of decorations, show the total number of nodes/edges in the diagonal of the matrix. 
  For example "casque" node from decoration A match with "casque" node from decoration B.
  For example "epee-=-casque" edge from decoration A match with "epee-=-casque" or "casque-=-epee" edge from decoration B
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
 same_neds(lgrph,
           var = "type",
           focus = c("nodes"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{lgrph}{
%%     ~~Describe \code{x} here~~
    list of decorations coming from the 'list_dec' function
}
            \item{var}{
%%     ~~Describe \code{x} here~~
    field name in 'nodes' dataframe on which the comparisons will be done, by default the fieldname is "type"
}
              \item{focus}{
%%     ~~Describe \code{x} here~~
    comparisons on \code{nodes} (by default) or \code{edges}
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
  create a symetric matrix of coincidences for nodes/edges
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
  \code{\link[decorr]{list_dec}}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
lgrph <- list_dec(imgs,nodes,edges,"type")
  
# same nodes
df.same_nodes <- same_elements(lgrph, "type", "nodes")
df.same_nodes
#   1  2 3  4 5
# 1 7  2 3  4 2
# 2 2 10 5  7 3
# 3 3  5 6  4 3
# 4 4  7 4 10 3
# 5 2  3 3  3 4

# same edges
df.same_edges <- same_elements(lgrph, "type", "edges")
df.same_edges
#   1  2  3  4 5
# 1 8  0  1  2 0
# 2 0 13  3  5 1
# 3 1  3 10  1 2
# 4 2  5  1 12 1
# 5 0  1  2  1 4
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
