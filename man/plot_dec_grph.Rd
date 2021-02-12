\name{plot_dec_grph}
\alias{plot_dec_grph}
\title{Plot a Graph on a Decoration}
\description{
  Plot with nodes only, edges only, or both (geometric graph) over a decoration image.
}
\usage{
plot_dec_grph(nodes = NULL,
              edges = NULL,
              imgs,
              site,
              decor,
              dir = getwd(),
              nd.var = 'id',
              nd.color = 'orange',
              nd.size = 0.5,
              lbl.color = 'black',
              lbl.size = 0.5,
              ed.color = c("orange", "blue"),
              ed.lwd = 1,
              dir.out = dir,
              out.file.name = NULL,
              img.format = NULL,
              res = 300)
}
\arguments{
  \item{nodes}{
    Dataframe of nodes
}
  \item{edges}{
    Dataframe of edges
}
  \item{imgs}{
    Dataframe of decorations
}
  \item{site}{
    Name of the site
}
  \item{decor}{
    Name of the decoration
}
  \item{dir}{
    Data folder including the decoration images.
    By default the working directory.
}
  \item{nd.var}{
    Field name in the nodes data frame to be displayed as node labels.
    By default the identifier \code{nodes$id}.
}
  \item{nd.color,
        nd.size,
        lbl.color,
        lbl.size,
        ed.color,
        ed.lwd}{
    Graphical parameters for color and size/widths of nodes, edges, and labels.
    \code{ed.color} is a vector with two values (the second value is used for diachronic
    edges).
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
  Plot \strong{nodes only} (if \code{edges = NULL}), \strong{edges only} (if \code{nodes = NULL}), or both (graph) over a decoration image.
}
\value{
   Generates graph decoration images with nodes, edges, or both, overlapping the decoration image.

   If \code{img.format=NULL}, the plot is sent to the active device and no value is returned.

   If \code{img.format=} \code{"png"} or \code{"bmp"} or \code{"tiff"}/\code{"tif"} or \code{"jpeg"}/\code{"jpg"} or \code{"pdf"}, the return value is a character vector with the dir/name of the saved image in the indicated format.
}

\examples{
## Set data folder
dataDir <- system.file("extdata", package = "iconr")
## Decoration to be plotted
site <- "Brozas"
decor <- "Brozas"
## Read nodes, edges, and decorations
nds.df <- read_nds(site, decor, dataDir)
eds.df <- read_eds(site, decor, dataDir)
imgs <- read.table(paste0(dataDir, "/imgs.tsv"),
                   sep="\t", stringsAsFactors = FALSE)

## Plot 'Brozas' nodes and edges on the active device
## with node variable "type" as labels
plot_dec_grph(nds.df, eds.df, imgs,
              site, decor,
              dir = dataDir,
              lbl.size = 0.4,
              nd.var = "type")

## Save only edges of 'Brozas' with bigger widths and in image format jpg.
outDir <- tempdir()
img.filename <- plot_dec_grph(nodes = NULL, eds.df, imgs,
                              site, decor,
                              dir = dataDir,
                              ed.lwd = 2,
                              dir.out = outDir,
                              img.format = "jpg")
## Then read and plot the image.
a.dec <- magick::image_read(img.filename)

## Inspect the output image
magick::image_info(a.dec)

## Plot the output image
plot(a.dec)

}

\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
