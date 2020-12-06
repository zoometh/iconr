\name{labels_shadow}
\alias{labels_shadow}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot Labels with Contrasting Shadow}
\description{
  Plot labels (text) with a contrasting buffer to make them more visible
  when located on a similar color background.

  This function is the \code{shadowtext()} function developed by Greg Snow.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
labels_shadow(x, y = NULL, labels,
              col = "black", bg = "white",
              theta = seq(0, 2 * pi, length.out = 50),
              r = 0.1,
              cex = 1, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
        \item{x, y}{
%%     ~~Describe \code{x} here~~
    Numeric vector of coordinates where the labels should be plotted.
    Alternatively, a single argument \code{x} can be provided
    with the same syntax as in \code{\link[grDevices]{xy.coords}}.
}
          \item{labels}{
%%     ~~Describe \code{x} here~~
    Set of labels provided as a character vector.
}
        \item{col, bg}{
%%     ~~Describe \code{x} here~~
    Graphical parameters for the label color and background (buffer) color.
}
        \item{theta}{
%%     ~~Describe \code{x} here~~
    Angles for generating the buffer with possible anisotropy along one
    direction (default is isotropic)
    and controling buffer smoothness (angular resolution).
}
        \item{r}{
%%     ~~Describe \code{x} here~~
    Thickness of the buffer relative to the size of the used font, by default 0.1.
}
        \item{cex}{
%%     ~~Describe \code{x} here~~
    Size of the label, by default 1.
}
        \item{...}{
%%     ~~Describe \code{x} here~~
    Further graphical parameter accepted by \code{\link[graphics]{text}}, such as
    \code{pos}, \code{offset}, or \code{family}.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...

}
\references{
%% ~put references to the literature/web site here ~
  https://rdrr.io/cran/TeachingDemos/man/shadowtext.html
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
