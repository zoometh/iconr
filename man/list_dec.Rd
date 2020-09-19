\name{list_dec}
\alias{list_dec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Create graphs for decoration and store them in a list}
\description{
  Create undireted graphs for eac decoration from nodes, edges and images dataframes (\code{imgs$idf},\code{imgs$idf},\code{imgs$idf}). Store the graphs decoration in a list. 
  Graphs names refer to \code{imgs$idf}. Nodes names depend on 'var' value, by default 'var' is \code{nodes$type}.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
  list_dec(imgs,
           nodes,
           edges,
           var="type")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{imgs}{
%%     ~~Describe \code{x} here~~
    listing of decorations
}
        \item{nodes}{
%%     ~~Describe \code{x} here~~
    nodes
}
          \item{edges}{
%%     ~~Describe \code{x} here~~
    edges
}
            \item{var}{
%%     ~~Describe \code{x} here~~
    field name in 'nodes' used for further analysis, by default this is the "type" field
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
  Return a list of graphs
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
# set wd to data folder
setwd(system.file("extdata", package = "decorr"))
# read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
# create the list of graphs
lgrph <- list_dec(imgs,nodes,edges,var="type")
  
# get the first graph
g <- lgrph[[1]]
g
# IGRAPH effa525 UN-B 7 8 -- 1
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name (v/c), type (v/c), x
# | (v/n), y (v/n), idf (v/c), type (e/c)
# + edges from effa525 (vertex names):
#   [1] personnage--lingot_pdb    bouclier  --lingot_pdb    personnage--bouclier      personnage--peigne       
# [5] lance     --peigne        personnage--casque        personnage--sexe_masculin personnage--lance

# graph name
g$name
# [1] 1
  
# nb of nodes
igraph::gorder(g)
# [1] 7

# nb of edges
igraph::gsize(g)
# [1] 8
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
