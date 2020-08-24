labels_shadow <- function (x, y, labels, col, bg = "white", 
          theta = seq(0, 2 * pi, length.out = 50), r = 0.1, ...) 
{
  # TODO: credits
  xy <- grDevices::xy.coords(x, y)
  r = 0.1
  xo <- r * graphics::strwidth("A")
  yo <- r * graphics::strheight("A")
  theta = seq(0, 2 * pi, length.out = 50)
  # background
  for (i in theta) {
    graphics::text(xy$x + cos(i) * xo, xy$y + sin(i) * yo, 
                   labels, col = "white", ...)
  }
  # foreground
  graphics::text(xy$x, xy$y, labels, col = "orange", ...)
}
