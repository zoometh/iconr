\name{side_plot}
\alias{side_plot}
\title{Plot Two Figures Side-by-Side Identifying Common Elements}
\description{
  Plot two decoration graphs side-by-side identifying common nodes and common edges. This function is called by the function \code{\link[iconr]{plot_compar}}.
}
\usage{
side_plot(grph, doss, nd.var, focus = "nodes",
          nd.color = c("orange", "red"),
          nd.size = c(0.5, 1),
          ed.color = c("orange", "red"),
          ed.width = c(1, 2),
          lbl.size = 0.5)
}
\arguments{
        \item{grph}{
    List of two or more 'igraph' graphs created with the \code{\link[iconr]{list_compar}} function.
}
          \item{doss}{
    Working directory which contains the imgs, nodes, edges dataframes and the decoration images.
}
            \item{nd.var}{
    Field of nodes on which the comparison will be done.
}

            \item{focus}{
    Focus on nodes or on edges, by default \code{focus = "nodes"}.
}
            \item{nd.color, nd.size, ed.color, ed.width}{
    Graphical parameters for the nodes and edges. The \strong{different} nodes/edges will be displayed with the first values of the vectors (eg, "orange") while the \strong{common} nodes/edges will be displayed with the second values of the vectors (eg, "red").
}
            \item{lbl.size}{
%%     ~~Describe \code{x} here~~
    Size of the labels
}
}
\seealso{
  \code{\link[iconr]{plot_compar}}
}
\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
