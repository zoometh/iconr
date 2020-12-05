\name{contemp_nds}
\alias{contemp_nds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Select Contemporaneous Nodes}
\description{
  Find the connected component of contemporaneous nodes given a selected node and remove the
  other components
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
  contemp_nds(nds.df, eds.df, selected.nd)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nds.df}{
    %%     ~~Describe \code{x} here~~
      Dataframe of the nodes as the one obtained by the function
      \code{\link[decorr]{read_nds}}.
  }
  \item{eds.df}{
    %%     ~~Describe \code{x} here~~
      Dataframe of the edges as the one obtained by the function
      \code{\link[decorr]{read_eds}}.
  }
  \item{selected.nd}{
    %%     ~~Describe \code{x} here~~
      The node of the decoration graph for which to extract the connected component. It can be either the node order (numeric) or the node name/id (character).
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
  \code{contemp_nds()} returns a list of two dataframes, the first one including
  the contemporaneous nodes and the second one, the contemporaneous edges.
}
\references{
  %% ~put references to the literature/web site here ~
}
\author{
  %%  ~~who you are~~
}
\note{
  %%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# Set data folder
dataDir <- system.file("extdata", package = "decorr")

# Read a decoration
nds.df <- read_nds(site = "Ibahernando",
                   decor = "Ibahernando",
                   doss = dataDir)
eds.df <- read_eds(site = "Ibahernando",
                   decor = "Ibahernando",
                   doss = dataDir)

# Extract the graph contemporaneous to the node 2
l_dec_df <- contemp_nds(nds.df, eds.df, selected.nd = 2)

l_dec_df
# $nodes
#           site       decor id     type        x         y
# 39 Ibahernando Ibahernando  2    lance 351.6009 -191.5644
# 40 Ibahernando Ibahernando  3 bouclier 345.0360 -296.6023
# 41 Ibahernando Ibahernando  4     epee 367.3566 -420.6782
#
# $edges
#           site       decor a b type       xa        ya       xb        yb
# 50 Ibahernando Ibahernando 2 3    = 351.6009 -191.5644 345.0360 -296.6023
# 51 Ibahernando Ibahernando 3 4    = 345.0360 -296.6023 367.3566 -420.6782
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
