\name{named_elements}
\alias{named_elements}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Textual Notation of Graph Elements
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
  Create a textual notation for nodes or edges.
}
\usage{
  named_elements(grph, focus = "edges", nd.var = "type")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{grph}{
%%     ~~Describe \code{grph} here~~
    A decoration graph
    (object of class \code{\link[igraph]{igraph}}).
  }
  \item{focus}{
%%     ~~Describe \code{nd.var} here~~
    Textual notation of edges (\code{focus = "edges"}) or nodes
    (\code{focus = "nodes"}). By default \code{focus = "edges"}.
  }
  \item{nd.var}{
%%     ~~Describe \code{nd.var} here~~
    The attribute of the graph nodes containing the node variable (ie, field)
    for the textual anotation. By default \code{nd.var = "type"}.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
  Edges of type "=" (\emph{normal} edges) are undirected, so that the order of
  their nodes is irrelevant and they are presented in alphabetical order.
  Conversely, edges of types "+" (\emph{attribute} edges) and ">" (\emph{overlap} edges)
  are directed, so that the given order of nodes is preserved.

  Repeated node or edge names are
  disambiguated by appending the simbol '#' at the end of the
  second appearance (suffix). Subsequent appearances are marked
  by additional '#'s.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
  A character vector of named nodes or edges.
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
  \code{\link[decorr]{list_compar}},
  \code{\link[decorr]{same_elements}}
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

# Textual notation of disambiguated edges
named_elements(lgrph[[2]], focus = "edges", nd.var="type")
#  [1] "epee-=-fibule"           "bouclier-=-miroir"
#  [3] "epee-=-lance"            "bouclier-=-chariot_char"
#  [5] "chariot_char-+-cheval"   "chariot_char-+-cheval#"
#  [7] "arc-=-bouclier"          "arc-=-chariot_char"
#  [9] "arc-=-miroir"            "bouclier-=-fibule"
# [11] "bouclier-=-epee"         "epee-=-miroir"
# [13] "arc-+-fleche"            "chariot_char-+-roue"
# [15] "chariot_char-+-roue#"

# Textual notation of disambiguated nodes
named_elements(lgrph[[2]], focus = "nodes", nd.var="type")
# [1] "chariot_char" "bouclier"     "arc"          "miroir"
# [5] "fibule"       "epee"         "lance"        "cheval"
# [9] "cheval#"      "roue"         "roue#"        "fleche"
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
