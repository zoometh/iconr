\name{side_plot}
\alias{side_plot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot Two Figures Side-by-Side Identifying Common Nodes or Common Edges}
\description{
  Plot figures side-by-side for nodes and edges comparisons
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
side_plot(grp, doss, nd.var, focus = "nodes",
          nd.color = c("orange", "red"),
          nd.size = c(0.5, 1),
          ed.color = c("orange", "red"),
          ed.width = c(1, 2),
          lbl.size = 0.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
        \item{grp}{
%%     ~~Describe \code{x} here~~
    a list of two or more 'igraph' graphs created with the list_compar() function
}
          \item{doss}{
%%     ~~Describe \code{x} here~~
    the working directory which contains the imgs, nodes, edges dataframes and the decoration images
}
            \item{nd.var}{
%%     ~~Describe \code{x} here~~
    the field of nodes on which the comparison will be done
}

            \item{focus}{
%%     ~~Describe \code{x} here~~
    focus on nodes or on edges
}
            \item{nd.color, nd.size, ed.color, ed.width}{
%%     ~~Describe \code{x} here~~
    graphical parameters for the nodes and edges. The different nodes/edges will be displayed with the first values of the vectors (eg, "orange") while the common nodes/edges will be displayed with the second values of the vectors (eg, "red")
}
            \item{lbl.size}{
%%     ~~Describe \code{x} here~~
    size of the labels
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


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
