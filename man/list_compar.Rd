\name{list_compar}
\alias{list_compar}
\alias{nds_compar}
\alias{eds_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Graph Pairwise Comparison on Common Elements}
\description{
    \code{nds_compar} identifies \strong{common nodes} in a pair of graphs.

    \code{eds_compar} identifies \strong{common edges} in a pair of graphs.

    Given a list of graphs, \code{list_compar} extract all combinations of graph pairs and compare them on common elements (nodes and edges).
}
\usage{
nds_compar(grphs, nd.var = "type")

eds_compar(grphs, nd.var = "type")

list_compar(lgrph, nd.var = "type",
            verbose = FALSE)
}
\arguments{
  \item{grphs}{
      A list of two graphs (pair of graphs) to be compared.
  }
  \item{lgrph}{
    A list of any number of graphs to be pairwise compared. The list can be typically obtained with the function \code{\link[iconr]{list_dec}}
  }
    \item{nd.var}{
    An attribute of the graph nodes containing the node variable (ie, field) on which the comparison will be done. By default \code{nd.var = "type"}.
  }
            \item{verbose}{
%%     ~~Describe \code{x} here~~
    Logical. If TRUE, the names of each graph pair combination are listed on the screen. By default \code{verbose = FALSE}.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
    \code{list_compar()} calls the functions: \code{nds_compar()} and \code{eds_compar()} which return respectively the \strong{common nodes} and the \strong{common edges} of a graph pairwise.

    \strong{Nodes} are common when they have the same value for a given variable, for example \code{horse}, \code{sword}, etc., for the variable \code{type} (\code{nd.var = "type"}).

     \strong{Edges} are common when they have the same value for \emph{starting} and \emph{ending} nodes (\code{horse}, \code{sword}, etc.) and the same type of edge (\code{'='}, \code{'+'}, etc.).
    For example, \code{a -=- b} in graph 1 is equal to \code{a -=- b} in graph 2, but not equal to \code{a -+- b}. Edges of type \code{=} (\emph{normal} edges) are undirected, so that \code{a -=- b} is equal to \code{b -=- a}. But edges of types \code{+} (\emph{attribute} edges) or \code{>} (\emph{diachronic} edges) are directed, so: \code{a ->- b} is not equal to \code{b ->- a}.

If any of the graphs has multiple nodes/edges with the same value, it is considered to count for as many coincidences as the smaller multiplicity. For instance, if there are 2 nodes with value \code{epee} in graph 1, and 3 nodes with value \code{epee} in graph 2, their number of common nodes is \code{min(2, 3) = 2}.
}
\value{
  \code{nds_compar()} returns the input pair of graphs complemented with a new \strong{node} attribute named \code{comm} with value 1 for common nodes and 0 for non-common nodes.

  \code{eds_compar()} returns the input pair of graphs complemented with a new \strong{edge} attribute named \code{comm} with value 1 for common edges and 0 for non-common edges.

  \code{list_compar()} returns a list of all combinations of graph pairs. For each pair, both graphs are complemented with the node attribute and edge attribute included by \code{nds_compar()} and \code{eds_compar()}, identifying respectively the common nodes and edges. To each pair is also added an attribute named \code{nd.var} saving the compared node variable.
}
\seealso{
  \code{\link[iconr]{list_dec}},
  \code{\link[iconr]{plot_compar}},
  \code{\link[iconr]{same_elements}}
}

\examples{
# Read data
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
                    sep="\t",stringsAsFactors = FALSE)
# Generate list of graphs from the three data.frames
lgrph <- list_dec(imgs, nodes, edges)

# Generate list of all graph comparisons depending on the node "type" variable
g.compar <- list_compar(lgrph, nd.var = "type")

length(g.compar)
# 10 = ten pairwise comparisons

# Inspect the second pairwise comparison of the list
g.compar[[2]]
# [[1]]
# IGRAPH 2521a03 UN-B 7 8 -- 1
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name
# | (v/c), type (v/c), x (v/n), y (v/n), comm (v/n), type (e/c), comm (e/n)
# + edges from 2521a03 (vertex names):
# [1] 1--4 1--5 3--5 1--2 1--7 1--3 1--8 4--8

#
# [[2]]
# IGRAPH 68532a5 UN-B 6 10 -- 3
# + attr: name (g/n), site (g/c), decor (g/c), label (g/c), img (g/c), name
# | (v/c), type (v/c), x (v/n), y (v/n), comm (v/n), type (e/c), comm (e/n)
# + edges from 68532a5 (vertex names):
# [1] 1--2 1--3 2--3 1--4 3--4 1--5 2--5 3--5 4--5 5--6
#
# attr(,"nd.var")
# [1] "type"

# Inspecting nodes:
igraph::as_data_frame(g.compar[[2]][[1]], "vertices")
#   name          type        x         y comm
# 1    1    personnage 349.8148 -298.3244    0
# 2    2        casque 349.8148 -243.9851    0
# 3    3         lance 238.4637 -298.3244    1
# 4    4      bouclier 446.0222 -381.1697    1
# 5    5        peigne 283.0041 -358.0086    1
# 7    7 sexe_masculin 342.6884 -427.4917    0
# 8    8    lingot_pdb 451.1489 -237.4782    0
igraph::as_data_frame(g.compar[[2]][[2]], "vertices")
#   name     type        x         y comm
# 1    1    lance 354.1114 -123.3621    1
# 2    2   peigne 346.3455 -151.8371    1
# 3    3   fibule 279.0411 -162.1916    0
# 4    4   miroir 211.7366 -206.1984    0
# 5    5 bouclier 392.9409 -343.3959    1
# 6    6     epee 387.7636 -564.7240    0

# Inspecting edges:
igraph::as_data_frame(g.compar[[2]][[1]])
#   from to type comm
# 1    1  4    =    0
# 2    1  5    =    0
# 3    3  5    =    1
# 4    1  2    +    0
# 5    1  7    +    0
# 6    1  3    =    0
# 7    1  8    =    0
# 8    4  8    =    0
igraph::as_data_frame(g.compar[[2]][[2]])
#    from to type comm
# 1     1  2    =    1
# 2     1  3    =    0
# 3     2  3    =    0
# 4     1  4    =    0
# 5     3  4    =    0
# 6     1  5    =    0
# 7     2  5    =    0
# 8     3  5    =    0
# 9     4  5    =    0
# 10    5  6    =    0
}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
