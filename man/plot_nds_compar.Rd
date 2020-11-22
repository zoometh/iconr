\name{plot_nds_compar}
\alias{plot_nds_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot and Save a Figure of Nodes Comparison Between Graphs}
\description{
  Save an image of common edges for one or more graphs pairwise comparison
  and return the path of the image. This function is the equivalent of
  the \code{\link[decorr]{plot_eds_compar}} function for the edges.
  %% \code{plot_nds_compar()} uses the function \code{\link[decorr]{side_plot_nds}}
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot_nds_compar(listg,
                graph2 = NULL,
                doss = getwd(),
                var = "type",
                common.nds.color = "red",
                different.nds.color = "orange",
                common.nds.size = 1,
                different.nds.size = 0.5,
                lbl.size = 0.4,
                eds.color = "orange")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{listg}{
%%     ~~Describe \code{x} here~~
    a list of graph obtained with the function \code{\link[decorr]{list_nds_compar}}
}
    \item{graph2}{
%%     ~~Describe \code{x} here~~
    a vector with two or more identifiers of the graphs
}
        \item{doss}{
%%     ~~Describe \code{x} here~~
    the working directory which contains the imgs, nodes, edges dataframes and the decoration images, by default the current wd (\code{getwd()})
}
        \item{var}{
%%     ~~Describe \code{x} here~~
    the field on which the comparison will be done, by default 'type'
}
        \item{common.nds.color}{
%%     ~~Describe \code{x} here~~
    the colors of the common nodes for graph comparison pairwises
}
        \item{different.nds.color}{
%%     ~~Describe \code{x} here~~
    the colors of the different nodes for graph comparison pairwises
}
        \item{common.nds.size}{
%%     ~~Describe \code{x} here~~
    the size of the common nodes for graph comparison pairwises
}
        \item{different.nds.size}{
%%     ~~Describe \code{x} here~~
    the size of the different nodes for graph comparison pairwises
}
        \item{lbl.size}{
%%     ~~Describe \code{x} here~~
    the size of the nodes labels for graph comparison pairwises. Only common nodes labels will be displayed
}
        \item{eds.color}{
%%     ~~Describe \code{x} here~~
    the color of the edges
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
  create one or more images for pairwise comparisons between two or more decorations nodes shown side-by-side. Return the path of this image.
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
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# read data
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
lgrph <- list_dec(imgs,nodes,edges,var="type")
g.compar <- list_nds_compar(lgrph,"type")

# plot
plot_nds_compar(listg = g.compar,
                graph2 = c(1,4),
                common.nds.color = "red",
                different.nds.color = "grey",
                common.nds.size = 1.5,
                different.nds.size = .5,
                eds.color = "grey",
                doss = system.file("extdata", package = "decorr"))
# two graphs side-by-side, graph 1 and graph 4, with common nodes identified on field 'type'
# by different colors and widths
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
