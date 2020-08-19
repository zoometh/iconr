\name{list_grph_.compar}
\alias{list_grph_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{List Graph with Common Edges}
\description{
  Return a list of graph pairwise with common edges identified
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
list_grph_compar(lgrph,
                             common.eds.color="red",
                             different.eds.color="orange",
                             common.eds.width=2,
                             different.eds.width=1,
                             verbose=F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lgrph}{
%%     ~~Describe \code{x} here~~
    a list of graph obtained with the function 'list.grph'
}
    \item{common.eds.color}{
%%     ~~Describe \code{x} here~~
    color for edges common between two graphs
}
      \item{different.eds.color}{
%%     ~~Describe \code{x} here~~
    color for edges different between two graphs
}
        \item{common.eds.width}{
%%     ~~Describe \code{x} here~~
    width for edges common between two graphs
}
          \item{different.eds.width}{
%%     ~~Describe \code{x} here~~
    width for edges different between two graphs
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
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
lgrph <- list_grph(imgs,nodes,edges,var="type")
g.compar <- list_grph_compar(lgrph)
length(g.compar)
## 6 different pairwise comparisons
g.compar[[1]]
## 1st pairwise comparison between graph 1 and graph 2
# [[1]]
# IGRAPH 7010a0e UN-B 7 8 -- 1
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name (v/c), type (v/c), x
# | (v/n), y (v/n), idf (v/c), type (e/c), color (e/c), width (e/n)
# + edges from 7010a0e (vertex names):
#   [1] personnage--lingot_pdb    bouclier  --lingot_pdb    personnage--bouclier      personnage--peigne
# [5] lance     --peigne        personnage--casque        personnage--sexe_masculin personnage--lance
# 
# [[2]]
# IGRAPH 7011161 UN-B 12 15 -- 2
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name (v/c), type (v/c), x
# | (v/n), y (v/n), idf (v/c), type (e/c), color (e/c), width (e/n)
# + edges from 7011161 (vertex names):
#   [1] fibule      --epee     bouclier    --miroir   epee        --lance    chariot_char--bouclier
# [5] chariot_char--cheval   chariot_char--cheval   bouclier    --arc      chariot_char--arc
# [9] arc         --miroir   bouclier    --fibule   bouclier    --epee     miroir      --epee
# [13] arc         --fleche   chariot_char--roue     chariot_char--roue
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
