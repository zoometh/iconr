\name{labels_shadow}
\alias{labels_shadow}
\title{Plot Labels with Contrasting Shadow}
\description{
  Plot labels (text) with a contrasting buffer to make them more visible
  when located on a similar color background.
  This function is the \code{shadowtext()} function developed by Greg Snow.
  Called by plot functions: \code{\link[iconr]{plot_dec_grph}}, \code{\link[iconr]{plot_compar}}
}
\usage{
labels_shadow(x, y = NULL, labels,
              col = "black", bg = "white",
              theta = seq(0, 2 * pi, length.out = 50),
              r = 0.1,
              cex = 1, ...)
}
\arguments{
        \item{x, y}{
    Numeric vector of coordinates where the labels should be plotted.
    Alternatively, a single argument \code{x} can be provided
    with the same syntax as in \code{\link[grDevices]{xy.coords}}.
}
          \item{labels}{
    Set of labels provided as a character vector.
}
        \item{col, bg}{
    Graphical parameters for the label color and background (buffer) color.
}
        \item{theta}{
    Angles for generating the buffer with possible anisotropy along one
    direction (default is isotropic)
    and controlling buffer smoothness (angular resolution).
}
        \item{r}{
    Thickness of the buffer relative to the size of the used font, by default 0.1.
}
        \item{cex}{
    Size of the label, by default 1.
}
        \item{...}{
    Further graphical parameter accepted by \code{\link[graphics]{text}}, such as
    \code{pos}, \code{offset}, or \code{family}.
}
}
\value{No return value, create a contrasting buffer to make labels more visible}

\references{
  https://rdrr.io/cran/TeachingDemos/man/shadowtext.html
}
\keyword{ ~kwd1 graphs}
