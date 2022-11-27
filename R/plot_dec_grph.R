#' Plot a Graph on a Decoration
#' @name plot_dec_grph
#'
#' @description Plot with nodes only, edges only, or both (geometric graph) over a decoration image.
#'
#' @param nodes dataframe of nodes.
#' @param edges dataframe of edges.
#' @param imgs dataframe of decorations.
#' @param site name of the site.
#' @param decor name of the decoration.
#' @param dir data folder including the decoration images. By default the working directory.
#' @param nd.var field name in the nodes data frame to be displayed as node labels. By default the identifier \code{nodes$id}.
#' @param nd.color,nd.size,lbl.color,lbl.size,ed.color,ed.lwd graphical parameters for color and size/widths of nodes, edges, and labels. \code{ed.color} is a vector with two values (the second value is used for diachronic edges).
#' @param dir.out folder for the output image. By default, it coincides with the input \code{dir}.
#' @param out.file.name name of the output image, including path from current directory and extension. By default the name is automatically generated including \code{site}, \code{decor}, \code{nd.var}, and the extension from \code{img.format}. If set, \code{out.file.name} overrides \code{dir.out} and \code{img.format}.
#' @param img.format,res format and resolution of the saved images. The handled formats are \code{"png"}, \code{"bmp"}, \code{"tiff"}/\code{"tif"}, \code{"jpeg"}/\code{"jpg"}, and \code{"pdf"}. The default resolution is 300 (ppi). The resolution does not applies to format pdf. If \code{img.format=NULL} (default), the plot is sent to the active device.
#'
#' @details plot \strong{nodes only} (if \code{edges = NULL}), \strong{edges only} (if \code{nodes = NULL}), or both (graph) over a decoration image.
#'
#' @return Generates graph decoration images with nodes, edges, or both, overlapping the decoration image. If \code{img.format=NULL}, the plot is sent to the active device and no value is returned. If \code{img.format=} \code{"png"} or \code{"bmp"} or \code{"tiff"}/\code{"tif"} or \code{"jpeg"}/\code{"jpg"} or \code{"pdf"}, the return value is a character vector with the dir/name of the saved image in the indicated format.
#'
#'
#' @examples
#'
#' ## Set data folder
#' dataDir <- system.file("extdata", package = "iconr")
#' ## Decoration to be plotted
#' site <- "Brozas"
#' decor <- "Brozas"
#' ## Read nodes, edges, and decorations
#' nds.df <- read_nds(site, decor, dataDir)
#' eds.df <- read_eds(site, decor, dataDir)
#' imgs <- read.table(paste0(dataDir, "/imgs.tsv"),
#'                    sep="\t", stringsAsFactors = FALSE)
#'
#' ## Plot 'Brozas' nodes and edges on the active device
#' ## with node variable "type" as labels
#' plot_dec_grph(nds.df, eds.df, imgs,
#'               site, decor,
#'               dir = dataDir,
#'               lbl.size = 0.4,
#'               nd.var = "type")
#'
#' ## Save only edges of 'Brozas' with bigger widths and in image format jpg.
#' outDir <- tempdir()
#' img.filename <- plot_dec_grph(nodes = NULL, eds.df, imgs,
#'                               site, decor,
#'                               dir = dataDir,
#'                               ed.lwd = 2,
#'                               dir.out = outDir,
#'                               img.format = "jpg")
#' ## Then read and plot the image.
#' a.dec <- magick::image_read(img.filename)
#'
#' ## Inspect the output image
#' magick::image_info(a.dec)
#'
#' ## Plot the output image
#' plot(a.dec)
#'
#' @export
plot_dec_grph <- function(nodes = NULL, edges = NULL, imgs,
                          site, decor,
                          dir = getwd(),
                          nd.var = "id",
                          nd.color = "orange", nd.size = 0.5,
                          lbl.color = "black", lbl.size = 0.5,
                          ed.color = c("orange", "blue"), ed.lwd = 1,
                          dir.out = dir, out.file.name = NULL,
                          img.format = NULL, res = 300) {
    # TODO: add arrow when edges directed
    # Select the image corresponding to site and decor.
    img.select <- imgs[imgs$site == site & imgs$decor == decor, ]
    if (nrow(img.select) != 1){
        stop(paste0("There must be exactly 1 decoration. Here there is ",
                    nrow(img.select)))
    }
    idf <- as.character(img.select$idf)
    dec.img <- magick::image_read(paste0(dir, "/", img.select$img))

    if (is.null(out.file.name)) {
        out.file.name <- paste0(dir.out, "/", idf, "_", site, "_",
                                decor, "_", nd.var, ".", img.format)
    } else {
        img.format <- file_extension(out.file.name)
    }

    if (!is.null(edges) && nrow(edges) > 0) {
        edges <- edges[edges$site  == site & edges$decor == decor, ]
        if(is.na(edges$type)){

        }
        edges$lty <- ifelse(edges$type == "+", "33", "solid")
        edges$col <- ed.color[ifelse(edges$type == ">", 2, 1)]
        edges$lwd <- ed.lwd
    }
    if (!is.null(nodes) && nrow(nodes) > 0) {
        nodes <- nodes[nodes$site  == site & nodes$decor == decor, ]
        nodes$cex <- nd.size
        nodes$col <- nd.color
        nodes$lbl.cex <- lbl.size
        nodes$lbl.col <- lbl.color
    }

    if (!is.null(img.format)) {
        img.ratio <- magick::image_info(dec.img)$width /
                        magick::image_info(dec.img)$height
        curdev <- grDevices::dev.cur()
        on.exit({if(grDevices::dev.cur() != curdev) {
                   grDevices::dev.off()
                   if(curdev > 1) grDevices::dev.set(curdev)
                 } })
        grDeviceOpen(out.file.name, width = 7*img.ratio, height = 7, res = res)
    }
    oldpar <- graphics::par(no.readonly = TRUE)
    on.exit(graphics::par(oldpar), add = TRUE, after = FALSE)
    graphics::par(mar = c(0, 0, 0, 0))

    draw_graph(nodes, edges, TRUE,
               nd.var, dec.img,
               paste0(idf, "\n", site, "\n", decor))

    if (!is.null(img.format)) return(out.file.name)
}
