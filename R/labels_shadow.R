labels_shadow <- function(x,
                          y = NULL,
                          labels,
                          col = "black",
                          bg = "white",
                          theta = seq(0, 2 * pi, length.out = 50),
                          r = 0.1, cex = 1, ...) {
    # all credits of the function go to Greg Snow see
    # https://rdrr.io/cran/TeachingDemos/man/shadowtext.html
    if(length(labels) == 0) return()
    xy <- grDevices::xy.coords(x, y)
    xo <- r * cex * graphics::strwidth("A")
    yo <- r * cex * graphics::strheight("A")
    theta <- seq(0, 2 * pi, length.out = 50)
    disp.x <- rep(xo * cos(theta), each = length(labels))
    disp.y <- rep(yo * sin(theta), each = length(labels))
    # background
    graphics::text(xy$x + disp.x , xy$y + disp.y , labels,
        col = bg, cex = cex, ...)
    # foreground
    graphics::text(xy$x, xy$y, labels, col = col, cex = cex, ...)
}
