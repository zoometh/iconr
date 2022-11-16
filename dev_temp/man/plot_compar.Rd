\name{plot_compar}
\alias{plot_compar}
\title{Plot and Save Comparison Figures Between Pairs of Graphs}
\description{
  Given a list of pairwise graph comparisons, the function plots any given subset selected by graph name, displaying side-by-side pairs of graphs and highlighting common nodes or common edges with a choice of several graphical parameters.
}
\usage{
  plot_compar(listg, dec2comp = NULL, focus = "nodes",
              dir = getwd(),
              nd.color = c("orange", "red"), nd.size = c(0.5, 1),
              ed.color = c("orange", "red"), ed.width = c(1, 2),
              lbl.size = 0.5,
              dir.out = dir, out.file.name = NULL,
              img.format = NULL, res = 300)
}
\arguments{
  \item{listg}{
      A list of graph pairwise comparisons as returned by \code{\link[iconr]{list_compar}}.
  }
  \item{dec2comp}{
      A vector with the names of the graphs for which comparisons are to be plotted.
    The user can select to plot all pairwise combinations (by default), all combinations of a subset, or a single pair.
  }
  \item{focus}{
      Either \code{"nodes"} (default) or \code{"edges"}. It selects the type of comparison to be plotted, highlighting common nodes or common edges, respectively.
  }
  \item{dir}{
    Data folder including the decoration images.
    By default the working directory.
  }
  \item{nd.color, nd.size, ed.color, ed.width}{
    Graphical parameters for color and size/widths of nodes and edges.
    Each of them is a vector with two values for different and common nodes/edges, respectively.
    If only one value is provided, this unique value is taken for both different and common elements.
    Labels are displayed with the same color as common nodes.
    For \code{focus = "nodes"} all edges are plotted with the first value of \code{ed.color} and \code{ed.width}.
  }
  \item{lbl.size}{
      Graphical parameter for the size of the labels with the node names. The default is 0.5.
  }
  \item{dir.out}{
    Folder for the output image. By default, it coincides with the input \code{dir}.
}
  \item{out.file.name}{
    Name of the output image, including path from current directory and extension.
    By default the name is automatically generated including \code{site},
    \code{decor}, \code{nd.var}, and the extension from \code{img.format}.

    If set, \code{out.file.name} overrides \code{dir.out} and \code{img.format}.
}
  \item{img.format, res}{
      Format and resolution of the saved images. The handled formats are
      \code{"png"}, \code{"bmp"}, \code{"tiff"}/\code{"tif"},
      \code{"jpeg"}/\code{"jpg"}, and \code{"pdf"}.
      The default resolution is 300 (ppi). The resolution does not applies to format pdf.

      if \code{img.format=NULL} (default), the plot is sent to the active device.
  }
}
\details{
  To highlight common elements between a list of graphs, the user can focus on nodes \code{(focus = "nodes")} or edges \code{(focus = "edges")}. As stated in the function \code{\link[iconr]{list_compar}}, for a given comparison variable (eg. \code{nd.var="type"}) if there is multiple nodes/edges with the same value, it is considered to count for as many coincidences as the smaller multiplicity.

  \code{img.format=NULL} (plot to the active device) does not make sense for
  more than one comparison.
}
\value{
    Generates graph decoration images, for pairwise comparisons between two or more decorations, comparing graphs elements (nodes or edges).

   If \code{img.format=NULL}, the plot is sent to the active device and no value is returned.

   If \code{img.format=} \code{"png"} or \code{"bmp"} or \code{"tiff"}/\code{"tif"} or \code{"jpeg"}/\code{"jpg"} or \code{"pdf"}, the return value is a character vector with the dir/name of every saved image in the indicated format.

}
\seealso{
  \code{\link[iconr]{list_compar}}
  \code{\link[iconr]{plot_dec_grph}}
}

\examples{
# Read data
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
                    sep="\t",stringsAsFactors = FALSE)

# Generate list of graphs from the three dataframes
lgrph <- list_dec(imgs, nodes, edges)

# Generate all pairwise comparisons of the graphs with respect to nodes "type"
g.compar <- list_compar(lgrph, nd.var="type")

# Generate the image showing the comparison on common nodes of graphs
# '1' and '4', save it in png format, and return its path.
dataDir <- system.file("extdata", package = "iconr")
outDir <- tempdir()
plot_compar(g.compar, c(1,4), focus = "nodes",
            dir = dataDir,
            dir.out = outDir,
            img.format = "png")

# Generate the image showing the comparison on common edges of all pairwise
# combinations of graphs '1','3', and '4', save them in pdf format, and return
# their path.
# Plot nodes involved in non-common edges in orange and
# nodes involved in common edges and the corresponding labels in brown.
plot_compar(g.compar, c(1, 3, 4), focus = "edges",
            dir = dataDir,
            nd.color = c("orange", "brown"),
            dir.out = outDir,
            img.format = "pdf")

# Save the png image showing the comparison on common nodes of graphs
# '1' and '4'.
# Then read and plot the image.
img.filename <- plot_compar(g.compar, c(1, 4), focus = "nodes",
                            dir = dataDir,
                            dir.out = outDir,
                            img.format = "png")
plot(magick::image_read(img.filename))

# Plot directly on the active device (default) the comparison on common nodes
# of graphs '1' and '4'.
plot_compar(g.compar, c(1, 4), focus = "nodes",
            dir = dataDir)
}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
