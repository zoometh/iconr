#' Plot and Save Comparison Figures Between Pairs of Graphs
#' @name plot_compar
#'
#' @description Given a list of pairwise graph comparisons, the function plots any given subset selected by graph name, displaying side-by-side pairs of graphs and highlighting common nodes or common edges with a choice of several graphical parameters.
#'
#' @param listg a list of graph pairwise comparisons as returned by \code{\link[iconr]{list_compar}}.
#' @param dec2comp a vector with the names of the graphs for which comparisons are to be plotted. The user can select to plot all pairwise combinations (by default), all combinations of a subset, or a single pair.
#' @param focus either \code{"nodes"} (default) or \code{"edges"}. It selects the type of comparison to be plotted, highlighting common nodes or common edges, respectively.
#' @param dir Data folder including the decoration images. By default the working directory.
#' @param nd.color,nd.size,ed.color,ed.width graphical parameters for color and size/widths of nodes and edges. Each of them is a vector with two values for different and common nodes/edges, respectively. If only one value is provided, this unique value is taken for both different and common elements. Labels are displayed with the same color as common nodes. For \code{focus = "nodes"} all edges are plotted with the first value of \code{ed.color} and \code{ed.width}.
#' @param lbl.size graphical parameter for the size of the labels with the node names. The default is 0.5.
#' @param dir.out folder for the output image. By default, it coincides with the input \code{dir}.
#' @param out.file.name name of the output image, including path from current directory and extension. By default the name is automatically generated including \code{site},\code{decor}, \code{nd.var}, and the extension from \code{img.format}. If set, \code{out.file.name} overrides \code{dir.out} and \code{img.format}.
#' @param img.format,res format and resolution of the saved images. The handled formats are \code{"png"}, \code{"bmp"}, \code{"tiff"}/\code{"tif"}, \code{"jpeg"}/\code{"jpg"}, and \code{"pdf"}. The default resolution is 300 (ppi). The resolution does not applies to format pdf. If \code{img.format=NULL} (default), the plot is sent to the active device.
#'
#' @details To highlight common elements between a list of graphs, the user can focus on nodes \code{(focus = "nodes")} or edges \code{(focus = "edges")}. As stated in the function \code{\link[iconr]{list_compar}}, for a given comparison variable (eg. \code{nd.var="type"}) if there is multiple nodes/edges with the same value, it is considered to count for as many coincidences as the smaller multiplicity. \code{img.format=NULL} (plot to the active device) does not make sense for more than one comparison.
#'
#' @return Generates graph decoration images, for pairwise comparisons between two or more decorations, comparing graphs elements (nodes or edges). If \code{img.format=NULL}, the plot is sent to the active device and no value is returned. If \code{img.format=} \code{"png"} or \code{"bmp"} or \code{"tiff"}/\code{"tif"} or \code{"jpeg"}/\code{"jpg"} or \code{"pdf"}, the return value is a character vector with the dir/name of every saved image in the indicated format.
#'
#' @seealso \code{\link[iconr]{list_compar}}, \code{\link[iconr]{plot_dec_grph}}.
#'
#' @examples
#'
#' # Read data
#' imgs <- read.table(system.file("extdata", "imgs.tsv", package = "iconr"),
#'                    sep="\t",stringsAsFactors = FALSE)
#' nodes <- read.table(system.file("extdata", "nodes.tsv", package = "iconr"),
#'                     sep="\t",stringsAsFactors = FALSE)
#' edges <- read.table(system.file("extdata", "edges.tsv", package = "iconr"),
#'                     sep="\t",stringsAsFactors = FALSE)
#'
#' # Generate list of graphs from the three dataframes
#' lgrph <- list_dec(imgs, nodes, edges)
#'
#' # Generate all pairwise comparisons of the graphs with respect to nodes "type"
#' g.compar <- list_compar(lgrph, nd.var="type")
#'
#' # Generate the image showing the comparison on common nodes of graphs
#' # '1' and '4', save it in png format, and return its path.
#' dataDir <- system.file("extdata", package = "iconr")
#' outDir <- tempdir()
#' plot_compar(g.compar, c(1,4), focus = "nodes",
#'             dir = dataDir,
#'             dir.out = outDir,
#'             img.format = "png")
#'
#' # Generate the image showing the comparison on common edges of all pairwise
#' # combinations of graphs '1','3', and '4', save them in pdf format, and return
#' # their path.
#' # Plot nodes involved in non-common edges in orange and
#' # nodes involved in common edges and the corresponding labels in brown.
#' plot_compar(g.compar, c(1, 3, 4), focus = "edges",
#'             dir = dataDir,
#'             nd.color = c("orange", "brown"),
#'             dir.out = outDir,
#'             img.format = "pdf")
#'
#' # Save the png image showing the comparison on common nodes of graphs
#' # '1' and '4'.
#' # Then read and plot the image.
#' img.filename <- plot_compar(g.compar, c(1, 4), focus = "nodes",
#'                             dir = dataDir,
#'                             dir.out = outDir,
#'                             img.format = "png")
#' plot(magick::image_read(img.filename))
#'
#' # Plot directly on the active device (default) the comparison on common nodes
#' # of graphs '1' and '4'.
#' plot_compar(g.compar, c(1, 4), focus = "nodes",
#'             dir = dataDir)
#'
#' @export
plot_compar <- function(listg, dec2comp = NULL, focus = "nodes",
                        dir = getwd(),
                        nd.color = c("orange", "red"), nd.size = c(0.5, 1),
                        ed.color = c("orange", "red"), ed.width = c(1, 2),
                        lbl.size = 0.5,
                        dir.out = dir, out.file.name = NULL,
                        img.format = NULL, res = 300) {
# If a single value is set for an nds or eds parameter, it affects both types:
  if (length(nd.color) == 1) nd.color[2] <- nd.color[1]
  if (length(nd.size) == 1) nd.size[2] <- nd.size[1]
  if (length(ed.color) == 1) ed.color[2] <- ed.color[1]
  if (length(ed.width) == 1) ed.width[2] <- ed.width[1]
# Focus-specific parameter defaults and names:
  if (focus == "nodes") {
    img.prefix <- "_compar_nds_"
  } else if (focus == "edges") {
    if (missing(nd.color)) nd.color <- ed.color
    if (missing(nd.size)) nd.size[2] <- nd.size[1]
    img.prefix <- "_compar_eds_"
  } else {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }

  out.list <- character(0)
  out.i <- 0
  for(i in seq_len(length(listg))) {
    g <- listg[[i]]
    g.names <- unlist(lapply(g, function(x) x$name))
    if(is.null(dec2comp) || all(g.names %in% dec2comp)) {
      out.i <- out.i + 1
      nd.var <- attributes(g)$nd.var
      if (is.null(out.file.name) || length(out.file.name) < out.i) {
        out.list[out.i] <- paste0(dir.out, "/", img.prefix, g.names[1],
                                  "_", g.names[2], ".", img.format)
      } else {
        img.format <- file_extension(out.file.name[out.i])
        out.list[out.i] <- out.file.name[out.i]
      }
      com.elm.num <- ifelse(focus == "nodes", sum(igraph::V(g[[1]])$comm),
                                              sum(igraph::E(g[[1]])$comm))
      tit <- paste0("Common ", focus, " (n=", com.elm.num, ")")

      plot_pair(img.format, out.list[out.i],
                g, dir, nd.var, focus,
                nd.color, nd.size, ed.color, ed.width, lbl.size,
                tit, res)
    }
  }
  if (!is.null(img.format)) return(out.list)
}

plot_pair <- function(img.format, img.filename,
                      g, dir, nd.var, focus,
                      nd.color, nd.size, ed.color, ed.width, lbl.size,
                      title, res)
{
  if (!is.null(img.format)) {
    curdev <- grDevices::dev.cur()
    on.exit({if(grDevices::dev.cur() != curdev) {
               grDevices::dev.off()
               if(curdev > 1) grDevices::dev.set(curdev)
             } })
    grDeviceOpen(img.filename, width = 14, height = 7, res = res)
  }

  # Set the plotting area into a 1*2 array
  oldpar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(oldpar), add = TRUE, after = FALSE)
  graphics::par(mfrow = c(1, 2), mar = c(0, 0, 0, 0))
  side_plot(g[[1]], dir, nd.var, focus,
            nd.color, nd.size, ed.color, ed.width, lbl.size)
  side_plot(g[[2]], dir, nd.var, focus,
            nd.color, nd.size, ed.color, ed.width, lbl.size)
  graphics::mtext(title, side = 1, line = -1, outer = TRUE,
                  cex = 0.6 * scale_factor())
}


grDeviceOpen <- function(img.file.name, width, height, res = 300)
{
  img.format <- file_extension(img.file.name)

  devices <- list(png = grDevices::png,
                  bmp = grDevices::bmp,
                  tiff = grDevices::tiff, tif = grDevices::tiff,
                  jpeg = grDevices::jpeg, jpg = grDevices::jpeg)
  # pdf is treated separately because it has different syntax.
  if (img.format %in% names(devices)){
    devices[[img.format]](img.file.name,
                          width = width, height = height,
                          units = "cm", res = res)
  } else if (img.format == "pdf") {
    cm <- 1/2.54 #inches
    grDevices::pdf(img.file.name,
                   width = width*cm, height = height*cm)
  } else {
    stop(paste0("Image format ", img.format, " not recognized."))
  }
}

file_extension <- function(file.name)
{
  return(sub("([[:print:]])+\\.", "", file.name))
}

rm_file_extension <- function(file.name)
{
  m <- regexpr("([[:print:]])+\\.", file.name)
  return(regmatches(file.name, m-1))
}
