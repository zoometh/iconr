\name{named_elements}
\alias{named_elements}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Textual Notation of Graph Elements
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
  create a textual notation for nodes or edges.
}
\usage{
named_elements(grphs, focus = "edges", nd.var = "type")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{grph}{
%%     ~~Describe \code{grph} here~~
  A decoration graph.
}
  \item{focus}{
%%     ~~Describe \code{nd.var} here~~
    Textual notation of edges (\code{focus = "edges"}) or nodes (\code{focus = "nodes"}). By default \code{focus = "edges"}.
}
  \item{nd.var}{
%%     ~~Describe \code{nd.var} here~~
    An attribute of the graph nodes containing the node variable (ie, field) on which the comparison will be done. By default \code{nd.var = "type"}.
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
return a vector of named nodes or edges with a disambiguation of nodes or edges adding '#' suffixes when these nodes or edges have the same values
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
}
\examples{
# Read data
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
# Generate list of graphs from the three data.frames
lgrph <- list_dec(imgs, nodes, edges)

# Textual notation of edges
as.character(named_elements(lgrph[[1]], focus = "edges", nd.var="type"))
# [1] "bouclier-=-personnage"      "peigne-=-personnage"
# [3] "lance-=-peigne"             "personnage-+-casque"
# [5] "personnage-+-sexe_masculin" "lance-=-personnage"
# [7] "lingot_pdb-=-personnage"    "bouclier-=-lingot_pdb"
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
