\name{list_nds_compar}
\alias{list_nds_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{List of Graph Pairwise Comparison with Common Nodes}
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
# list graphs
lgrph <- list_dec(imgs,nodes,edges,var="type")
g.compar <- list_nds_compar(lgrph,"type")
g.compar[[1]]
# [[1]]
# IGRAPH 5414981 UN-B 7 8 -- 1
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name (v/c), type (v/c), x
# | (v/n), y (v/n), idf (v/c), color (v/c), cex (v/n), type (e/c)
# + edges from 5414981 (vertex names):
#   [1] personnage--lingot_pdb    bouclier  --lingot_pdb    personnage--bouclier      personnage--peigne       
# [5] lance     --peigne        personnage--casque        personnage--sexe_masculin personnage--lance        
# 
# [[2]]
# IGRAPH 5415a9a UN-B 12 15 -- 2
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name (v/c), type (v/c), x
# | (v/n), y (v/n), idf (v/c), color (v/c), cex (v/n), type (e/c)
# + edges from 5415a9a (vertex names):
#   [1] fibule      --epee     bouclier    --miroir   epee        --lance    chariot_char--bouclier
# [5] chariot_char--cheval   chariot_char--cheval   bouclier    --arc      chariot_char--arc     
# [9] arc         --miroir   bouclier    --fibule   bouclier    --epee     miroir      --epee    
# [13] arc         --fleche   chariot_char--roue     chariot_char--roue    
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
