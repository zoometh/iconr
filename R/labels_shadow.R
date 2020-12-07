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
