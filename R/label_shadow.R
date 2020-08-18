labels.shadow <- function(x, y=NULL, labels, col='white', bg='black',
                          theta= seq(0, 2*pi, length.out=50), r=0.1, ... ) {
  # TODO: credits
  # drop shadow
  xy <- grDevices::xy.coords(x,y)
  r=0.1
  xo <- r*graphics::strwidth('A')
  yo <- r*graphics::strheight('A')
  # draw background text with small shift in x and y in background colour
  theta= seq(0, 2*pi, length.out=50)
  for (i in theta) {
    graphics::text(xy$x + cos(i)*xo, xy$y + sin(i)*yo, labels,col='black', ... )
  }
  # draw actual text in exact xy position in foreground colour
  graphics::text(xy$x, xy$y, labels, col='white', ... )
}
