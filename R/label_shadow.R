labels_shadow <- function(x, 
                          y = NULL, 
                          labels, 
                          col = "black", 
                          bg = "white", 
                          theta = seq(0, 2 * pi, length.out = 50), 
                          r = 0.1, ...) {
    # all credits of the function go to Greg Snow see
    # https://rdrr.io/cran/TeachingDemos/man/shadowtext.html
    xy <- grDevices::xy.coords(x, y)
    xo <- r * graphics::strwidth("A")
    yo <- r * graphics::strheight("A")
    theta = seq(0, 2 * pi, length.out = 50)
    # background
    for (i in theta) {
        graphics::text(xy$x + cos(i) * xo, xy$y + sin(i) * yo, labels, 
            col = "white", ...)
    }
    # foreground
    graphics::text(xy$x, xy$y, labels, col = col, ...)
}
