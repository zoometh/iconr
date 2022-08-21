#' Plot Labels with Contrasting Shadow
#' @name labels_shadow
#'
#' @description   Plot labels (text) with a contrasting buffer to make them more visible when located on a similar color background. This function is the \code{shadowtext()} function developed by Greg Snow. Called by plot functions: \code{\link[iconr]{plot_dec_grph}}, \code{\link[iconr]{plot_compar}}
#'
#' @param x,y numeric vector of coordinates where the labels should be plotted. Alternatively, a single argument \code{x} can be provided with the same syntax as in \code{\link[grDevices]{xy.coords}}.
#' @param labels set of labels provided as a character vector.
#' @param col,bg graphical parameters for the label color and background (buffer) color.
#' @param theta angles for generating the buffer with possible anisotropy along one direction (default is isotropic) and controlling buffer smoothness (angular resolution).
#' @param r thickness of the buffer relative to the size of the used font, by default 0.1.
#' @param cex size of the label, by default 1.
#' @param ... Further graphical parameter accepted by \code{\link[graphics]{text}}, such as \code{pos}, \code{offset}, or \code{family}.
#'
#'
#' @return Don't return value. It creates a contrasting buffer to make labels more visible.
#'
#' @references https://rdrr.io/cran/TeachingDemos/man/shadowtext.html
#'
#' @export
labels_shadow <- function(x, y = NULL, labels,
                          col = "black", bg = "white",
                          theta = seq(0, 2 * pi, length.out = 50),
                          r = 0.1,
                          cex = 1, ...) {
    # All credits of the function go to Greg Snow. See:
    # https://rdrr.io/cran/TeachingDemos/man/shadowtext.html
    # Note that this code has license Artistic-2.0:
    # https://opensource.org/licenses/Artistic-2.0
    if(length(labels) == 0) return()
    xy <- grDevices::xy.coords(x, y)
    xo <- r * graphics::strwidth("A", cex = cex)
    yo <- r * graphics::strheight("A", cex = cex)
    disp.x <- rep(xo * cos(theta), each = length(labels))
    disp.y <- rep(yo * sin(theta), each = length(labels))
    # background
    graphics::text(xy$x + disp.x , xy$y + disp.y , labels,
        col = bg, cex = cex, ...)
    # foreground
    graphics::text(xy$x, xy$y, labels, col = col, cex = cex, ...)
}
