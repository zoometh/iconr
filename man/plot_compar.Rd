\name{plot_compar}
\alias{plot_compar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot and Save Comparison Figures Between Pairs of Graphs}
\description{
  \code{plot_compar} produces images displaying side by side pairs of graphs highlighting common nodes or common edges (see \code{\link[decorr]{list_compar}} for comparison criteria).
  The user can focus the comparison on nodes or edges, and can define several appearance parameters.
  Given a list of pairwise graph comparisons, it plots any given subset selected by graph name.
  The images can be saved in png, bmp, tiff, jpeg, or pdf format.
  %%\code{plot_eds_compar()} uses the function \code{\link[decorr]{side_plot_eds}}
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
  plot_compar(listg, graph2 = NULL, focus = "nodes",
              doss = getwd(),
              nd.color = c("orange", "red"), nd.size = c(0.5, 1),
              ed.color = c("orange", "red"), ed.width = c(1, 2),
              lbl.size = 0.5, img.format = "png", res = 300)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{listg}{
    %%     ~~Describe \code{x} here~~
      A list of graph pairwise comparisons returned by \code{\link[decorr]{list_compar}}.
  }
  \item{graph2}{
    %%     ~~Describe \code{x} here~~
      A vector with the names of the graphs for which comparisons are to be plotted.
    The user can select to plot all pairwise combinations (default), all combinations of a subset, or a single pair.
  }
  \item{focus}{
    %%     ~~Describe \code{x} here~~
      Either \code{"nodes"} (default) or \code{"edges"}. It selects the type of comparison to be plotted, highlighting common nodes or common edges, respectively.
  }
  \item{doss}{
    %%     ~~Describe \code{x} here~~
      The working directory containing the decoration images. The default is the current directory (\code{getwd()}).
  }
  \item{nd.color, nd.size, ed.color, ed.width}{
    %%     ~~Describe \code{x} here~~
      Graphical parameters for color and size/widths of nodes and edges.
    Each of them is a vector with two values for different and common nodes/edges, respectively.
    If only one value is provided, this unique value is taken for both different and common elements.
    Labels are displayed with the same color as common nodes.
    For \code{focus = "nodes"} all edges are plotted with the first value of \code{ed.color} and \code{ed.width}.
  }
  \item{lbl.size}{
    %%     ~~Describe \code{x} here~~
      Graphical parameter for the size of the labels with the node names. The default is 0.4.
  }
  \item{img.format, res}{
    %%     ~~Describe \code{x} here~~
      Format and resolution of the saved images. The handled formats are \code{"png"} (default), \code{"bmp"}, \code{"tiff"}/\code{"tif"}, \code{"jpeg"}/\code{"jpg"}, and \code{"pdf"}.
      The default resolution is 300 (ppi). The resolution does not applies to format pdf.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
As stated in the function \code{\link[decorr]{list_compar}}, if there is multiple nodes/edges with the same value, it is considered to count for as many coincidences as the smaller multiplicity.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
   \code{plot_compar()} generates and save images in the indicated format for pairwise comparisons between two or more decorations, comparing nodes or edges. The return value is a character vector with the the path/name of every saved image.
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
  \code{\link[decorr]{side_plot}}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# Read data
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)

# Generate list of graphs from the three dataframes
lgrph <- list_dec(imgs, nodes, edges)

# Generate all pairwise comparisons of the graphs with respect to nodes "type"
g.compar <- list_compar(lgrph, nd.var="type")

# Return the path of the image showing the comparison on common nodes of graphs '1' and '4',
# and save it as png (default)
plot_compar(g.compar, c(1,4), focus = "nodes",
            doss = system.file("extdata", package = "decorr"))

# Return the path of the image showing the comparison on common edges of graphs '1' and '4',
# and save it as jpeg. Plot all nodes and node labels in brown.
plot_compar(g.compar, c(1,4), focus = "edges",
            doss = system.file("extdata", package = "decorr"),
            nd.color = "brown",
            img.format = "jpg")

# Return the path of the image showing the comparison on common edges of all pairwise combinations
# of graphs '1','3', and '4', and save them as pdf.
# Save the plot of nodes involved in non-common edges in orange and
# nodes involved in common edges and the corresponding labels in brown.
plot_compar(g.compar, c(1,3,4), focus = "edges",
            doss = system.file("extdata", package = "decorr"),
            nd.color = c("orange", "brown"),
            img.format = "pdf")

# Return the path of the image showing the comparison on common nodes of graphs '1' and '4',
# and save it as png (default),
# and plot the image
p <- plot_compar(g.compar, c(1,4), focus = "nodes",
            doss = system.file("extdata", package = "decorr"))
plot(magick::image_read(p))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
