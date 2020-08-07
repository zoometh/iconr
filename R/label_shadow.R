labels.shadow <- function(x, y=NULL, labels, col='white', bg='black',
                          theta= seq(0, 2*pi, length.out=50), r=0.1, ... ) {
  # TODO: credits
  # drop shadow
  xy <- xy.coords(x,y)
  r=0.1
  xo <- r*strwidth('A')
  yo <- r*strheight('A')
  # draw background text with small shift in x and y in background colour
  theta= seq(0, 2*pi, length.out=50)
  for (i in theta) {
    text( xy$x + cos(i)*xo, xy$y + sin(i)*yo, labels,col='black', ... )
  }
  # draw actual text in exact xy position in foreground colour
  text(xy$x, xy$y, labels, col='white', ... )
}