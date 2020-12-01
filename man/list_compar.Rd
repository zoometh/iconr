\name{list_compar}
\alias{list_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Graph Pairwise Comparison on Common Nodes and Common Edges}
\description{
    \code{nds_compar} identifies common nodes in a pair of graphs.
    \code{eds_compar} identifies common edges in a pair of graphs.
    Given a list of graphs, \code{list_compar} extract all combinations of graph pairs and compare them for both common nodes and common edges.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{

nds_compar(grphs, var = "type")
    
eds_compar(grphs, var = "type")

list_compar(lgrph,
            var = "type",
            verbose = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{grphs}{
      a list of two graphs (pair of graphs) to be compared.
  }
  \item{lgrph}{
%%     ~~Describe \code{x} here~~
    a list of any number of graphs to be pairwise compared. The list can be typically obtained with the function \code{list_dec()}
  }
    \item{var}{
%%     ~~Describe \code{x} here~~
    an attribute of the graph vertices containing the node type on which the comparison will be done. By default \code{var = "type"}.
  }
            \item{verbose}{
%%     ~~Describe \code{x} here~~
    logical. If TRUE, the names of each graph pair combination are listed on the screen. By default \code{verbose = FALSE}.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
    \code{list_compar} calls the two other functions: \code{nds_compar()} and \code{eds_compar()}, which were initially designed as internal functions. 
    They return respectively the common nodes and the common edges of a graph pairwise. Nodes are common if they have the the same type ('horse','sword',...) in both graphs.
    Edges are common if they have the same type of starting and ending nodes ('horse', 'sword',...) and the same type of edge ('=','+',...). 
    For example, \code{a -=- b} in graph 1 is equal to \code{a -=- b} in graph 2, but not to \code{a -+- b} or \code{a ->- b}.
    For undirected graphs (the usual case), \code{a -=- b} is also equal to \code{b -= a}.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
  \code{nds_compar} returns the input pair of graphs complemented with a new vertex attribute named \code{comm} with value 1 for common nodes and 0 for non-common nodes.
  \code{eds_compar} returns the input pair of graphs complemented with a new edge attribute named \code{comm} with value 1 for common edges and 0 for non-common edges.
  \code{list_compar} returns a list of all combinations of graph pairs. For each pair, both graphs are complemented with the vertex attribute and edge attribute included by \code{nds_compar} and \code{eds_compar}, identifying the common nodes and edges, respectively.
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
  \code{\link[decorr]{list_dec}}, \code{\link[decorr]{plot_compar}}
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
lgrph <- list_dec(imgs, nodes, edges,var="type")
g.compar <- list_compar(lgrph, "type")
length(g.compar)
# 10 = ten pairwise comparisons

g.compar[[2]]
# [[1]]
# IGRAPH d91bfd7 UN-B 7 8 -- 1
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name
# | (v/c), type (v/c), x (v/n), y (v/n), idf (v/c), comm (v/n), type (e/c),
# | comm (e/n)
# + edges from d91bfd7 (vertex names):
# [1] personnage--bouclier      personnage--peigne        lance     --peigne       
# [4] personnage--casque        personnage--sexe_masculin personnage--lance        
# [7] personnage--lingot_pdb    bouclier  --lingot_pdb   

# [[2]]
# IGRAPH baa4760 UN-B 6 10 -- 3
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name
# | (v/c), type (v/c), x (v/n), y (v/n), idf (v/c), comm (v/n), type (e/c),
# | comm (e/n)
# + edges from baa4760 (vertex names):
# [1] lance   --peigne   lance   --fibule   peigne  --fibule   lance   --miroir  
# [5] fibule  --miroir   lance   --bouclier peigne  --bouclier fibule  --bouclier
# [9] miroir  --bouclier bouclier--epee  

# Inspecting nodes:
igraph::as_data_frame(g.compar[[2]][[1]], "vertices")
#                        name          type        x         y idf comm
# personnage       personnage    personnage 349.8148 -298.3244   1    0
# casque               casque        casque 349.8148 -243.9851   2    0
# lance                 lance         lance 238.4637 -298.3244   3    1
# bouclier           bouclier      bouclier 446.0222 -381.1697   4    1
# peigne               peigne        peigne 283.0041 -358.0086   5    1
# sexe_masculin sexe_masculin sexe_masculin 342.6884 -427.4917   7    0
# lingot_pdb       lingot_pdb    lingot_pdb 451.1489 -237.4782   8    0
igraph::as_data_frame(g.compar[[2]][[2]], "vertices")
#              name     type        x         y idf comm
# lance       lance    lance 354.1114 -123.3621   1    1
# peigne     peigne   peigne 346.3455 -151.8371   2    1
# fibule     fibule   fibule 279.0411 -162.1916   3    0
# miroir     miroir   miroir 211.7366 -206.1984   4    0
# bouclier bouclier bouclier 392.9409 -343.3959   5    1
# epee         epee     epee 387.7636 -564.7240   6    0    

# Inspecting edges:
igraph::as_data_frame(g.compar[[2]][[1]])
#         from            to type comm
# 1 personnage      bouclier    =    0
# 2 personnage        peigne    =    0
# 3      lance        peigne    =    1
# 4 personnage        casque    +    0
# 5 personnage sexe_masculin    +    0
# 6 personnage         lance    =    0
# 7 personnage    lingot_pdb    =    0
# 8   bouclier    lingot_pdb    =    0
igraph::as_data_frame(g.compar[[2]][[2]])
#        from       to type comm
# 1     lance   peigne    =    1
# 2     lance   fibule    =    0
# 3    peigne   fibule    =    0
# 4     lance   miroir    =    0
# 5    fibule   miroir    =    0
# 6     lance bouclier    =    0
# 7    peigne bouclier    =    0
# 8    fibule bouclier    =    0
# 9    miroir bouclier    =    0
# 10 bouclier     epee    =    0
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
