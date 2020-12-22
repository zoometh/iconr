\name{plot_dec_grph}
\alias{plot_dec_grph}
\title{Plot a Graph on a Decoration}
\description{
  Plot with nodes only, edges only, or both (geometric graph) over a decoration image
}
\usage{
plot_dec_grph(nodes = NULL,
              edges = NULL,
              site,
              decor,
              doss = getwd(),
              nd.var = 'id',
              nd.color = 'orange',
              nd.size = 1.7,
              lbl.color = 'black',
              lbl.size = 1.2,
              ed.color = c("orange", "blue"),
              ed.lwd = 4,
              img.format = "png")
}
\arguments{
  \item{nodes}{
    Dataframe of nodes
}
    \item{edges}{
    Dataframe of edges
}
        \item{site}{
    Name of the site
}
          \item{decor}{
    Name of the decoration
}
        \item{doss}{
    Path of the working folder, by default the working directory
}
              \item{nd.var}{
    Fieldname of the nodes that will be displayed, by default the identifier \code{nodes$id}
}
              \item{nd.color,
                    nd.size,
                    lbl.color,
                    lbl.size,
                    ed.color,
                    ed.lwd}{
    Graphical parameters for node and/or edges colors, size, label size, etc.
}
  \item{img.format}{
      Format and resolution of the saved images. The handled formats are \code{"png"} (default), \code{"bmp"}, \code{"tiff"}/\code{"tif"}, \code{"jpeg"}/\code{"jpg"}, and \code{"pdf"}.
  }
}
\details{
  Plot \strong{nodes only} (\code{edges = NULL} or \code{eds.df} is null), \strong{edges only} (\code{nodes = NULL} or \code{eds.df} is null), or both (graph) over a decoration image


}
\value{
  Create a R 'magick-image' with nodes, edges, or both, overlapping the decoration image
}

\examples{
# Set data folder
dataDir <- system.file("extdata", package = "iconr")

# Read nodes and edges
nds.df <- read_nds( site = "Brozas", decor = "Brozas",
                    doss = dataDir, dev = ".tsv")
eds.df <- read_eds(	site = "Brozas", decor = "Brozas",
                    doss = dataDir, dev = ".tsv")

# Save nodes and edges of 'Cerro Muriano 1' with nodes' "type" as labels
# with the default image format (png) in a new file and return the path
img.graph <- plot_dec_grph(nodes = nds.df,
                           edges = eds.df,
                           site = "Brozas",
                           decor = "Brozas",
                           doss = dataDir,
                           nd.var = "type")
img.graph

# Save only edges of 'Cerro Muriano 1' with smaller widths
# with a new image format (jpg) in a new file,
# and open the file with 'magick::image_read()'
img.graph <- plot_dec_grph(nodes = NULL,
                           edges = eds.df,
                           site = "Brozas",
                           decor = "Brozas",
                           doss = dataDir,
                           ed.lwd = 2,
                           img.format = "jpg")
magick::image_read(img.graph)
}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
