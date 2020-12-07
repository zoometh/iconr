\name{plot_dec_grph}
\alias{plot_dec_grph}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot a Graph on a Decoration}
\description{
  Plot nodes only, edges only, or both (graph) over a decoration image
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
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
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nodes}{
%%     ~~Describe \code{x} here~~
    a dataframe of nodes
}
    \item{edges}{
%%     ~~Describe \code{x} here~~
    a dataframe of edges
}
        \item{site}{
%%     ~~Describe \code{x} here~~
    name of the site
}
          \item{decor}{
%%     ~~Describe \code{x} here~~
    name of the decoration
}
        \item{doss}{
%%     ~~Describe \code{x} here~~
    path of the working folder, by default the working directory
}
              \item{nd.var}{
%%     ~~Describe \code{x} here~~
    fieldname of the nodes that will be displayed, by default the identifier \code{nodes$id}
}
              \item{nd.color,
                    nd.size,
                    lbl.color,
                    lbl.size,
                    ed.color,
                    ed.lwd}{
%%     ~~Describe \code{x} here~~
    graphical parameters for node and/or edges colors, size, label size, etc.
}
  \item{img.format}{
    %%     ~~Describe \code{x} here~~
      Format and resolution of the saved images. The handled formats are \code{"png"} (default), \code{"bmp"}, \code{"tiff"}/\code{"tif"}, \code{"jpeg"}/\code{"jpg"}, and \code{"pdf"}.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
  Plot nodes only (\code{edges = NULL} or \code{eds.df} is null), edges only (\code{nodes = NULL} or \code{eds.df} is null), or both (graph) over a decoration image


}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
  create a R 'magick-image' with nodes, edges, or both, overlapping the decoration image
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

\examples{
# set data folder
dataDir <- system.file("extdata", package = "decorr")

# read nodes and edges
nds.df <- read_nds( site = "Brozas", decor = "Brozas",
                    doss = dataDir, dev = ".tsv")
eds.df <- read_eds(	site = "Brozas", decor = "Brozas",
                    doss = dataDir, dev = ".tsv")

# save nodes and edges of 'Cerro Muriano 1' with nodes' "type" as labels
# with the default image format (png) in a new file and return the path
img.graph <- plot_dec_grph(nodes = nds.df,
                           edges = eds.df,
                           site = "Brozas",
                           decor = "Brozas",
                           doss = dataDir,
                           nd.var = "type")
img.graph

# save only edges of 'Cerro Muriano 1' with smaller widths
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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
