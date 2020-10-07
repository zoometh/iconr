\name{list_dec}
\alias{list_dec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Create graphs for decoration and store them in a list}
\description{
  Create undirected graphs for each decoration from \code{nodes}, \code{edges} and \code{imgs} dataframes and store the graphs in a list.
  The join between these dataframes is done on the two fields \code{site} and \code{decor}.
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
    dataframe of decorations
}
        \item{nodes}{
%%     ~~Describe \code{x} here~~
    dataframe of nodes
}
          \item{edges}{
%%     ~~Describe \code{x} here~~
    dataframe of edges
}
            \item{var}{
%%     ~~Describe \code{x} here~~
    by default 'var' is \code{nodes$type}
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
# read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.csv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.csv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.csv", package = "decorr"),
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
