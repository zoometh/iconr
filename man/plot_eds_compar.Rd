\name{plot_eds_compar}
\alias{plot_eds_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot and Save a Figure of Edges Comparison Between Graphs}
\description{
  Save an image of common edges for one or more graphs pairwise comparison
  and return the path of the image. This function is the equivalent of
  the \code{\link[decorr]{plot_nds_compar}} function for the nodes.
  %%\code{plot_eds_compar()} uses the function \code{\link[decorr]{side_plot_eds}}
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot_eds_compar(listg,
                graph2,
                doss=getwd(),
                var="type")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{listg}{
%%     ~~Describe \code{x} here~~
    a list of graph obtained with the function 'list_eds_compar'
}
    \item{graph2}{
%%     ~~Describe \code{x} here~~
    a vector with the two idf of the graphs
}
      \item{doss}{
%%     ~~Describe \code{x} here~~
    the working directory which contains the imgs, nodes, edges dataframes and the decoration images, by default the current wd (\code{getwd()})
}
      \item{var}{
%%     ~~Describe \code{x} here~~
    the filed on which the comparison will be done, by default 'type'
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
   create an image for a pairwise comparisons between two decorations edges and return the path of this image
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
  \code{\link[decorr]{list_eds_compar}},
  \code{\link[decorr]{plot_nds_compar}},
  \code{\link[decorr]{side_plot_eds}}
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
g.compar <- list_eds_compar(lgrph,var="type")

# plot
plot_eds_compar(g.compar, c(1,4), doss = system.file("extdata", package = "decorr"))
# two graphs side-by-side, graph 1 and graph 4, with common edges identified on field 'type'
# by different colors and widths
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
