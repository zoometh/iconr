\name{list_compar}
\alias{list_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Graph Pairwise Comparison on Common Nodes and Common Edges}
\description{
    \textbf{nodes} List of graph pairwise comparisons on common nodes. Common nodes are those having the same type of nodes ('horse','sword',...).
     \textbf{edges} List of undirected graph pairwise comparisons on common edges. Common edges between two graphs are edges that have the same type of starting and ending nodes ('horse', 'sword',...) and the same type of edge ('=','+',...). For example \code{a -=- b} in graph 1 is equal to \code{b -=- a} in graph 2, but not to \code{b -+- a}, \code{b ->- a} or \code{a -+- b}.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{

list_compar(lgrph,
            var = "type",
            verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lgrph}{
%%     ~~Describe \code{x} here~~
    a list of graph obtained with the function \code{list_dec()}
}
    \item{var}{
%%     ~~Describe \code{x} here~~
    a field of \code{nodes} dataframe on which the comparison will be done, by default \code{nodes$type}
}
            \item{verbose}{
%%     ~~Describe \code{x} here~~
    verbose, by default FALSE
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
This function calls two other functions: \code{nds_compar()} and \code{eds_compar()} which return respectively the common nodes and the common edges of a graph pairwise.
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

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link[decorr]{list_dec}}
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

# list graphs
lgrph <- list_dec(imgs,nodes,edges,var="type")
g.compar <- list_compar(lgrph,"type")
length(g.compar)
# 10 = ten pairwise comparisons

g.compar[[1]]
# [[1]]
# IGRAPH eb2a10a UN-B 7 8 -- 1
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name (v/c), type (v/c), x (v/n),
# | y (v/n), idf (v/c), comm (v/n), type (e/c), comm (e/n)
# + edges from eb2a10a (vertex names):
#   [1] personnage--bouclier      personnage--peigne        lance     --peigne        personnage--casque
# [5] personnage--sexe_masculin personnage--lance         personnage--lingot_pdb    bouclier  --lingot_pdb
#
# [[2]]
# IGRAPH eb2a85f UN-B 12 15 -- 2
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name (v/c), type (v/c), x (v/n),
# | y (v/n), idf (v/c), comm (v/n), type (e/c), comm (e/n)
# + edges from eb2a85f (vertex names):
#   [1] fibule      --epee     bouclier    --miroir   epee        --lance    chariot_char--bouclier
# [5] chariot_char--cheval   chariot_char--cheval   bouclier    --arc      chariot_char--arc
# [9] arc         --miroir   bouclier    --fibule   bouclier    --epee     miroir      --epee
# [13] arc         --fleche   chariot_char--roue     chariot_char--roue
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
