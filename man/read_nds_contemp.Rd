\name{contemp_nds}
\alias{contemp_nds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Select Comtempotoraneous Nodes}
\description{
  Subset contemporaneous nodes and remove the others with their edges
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
  contemp_nds(nds.df,
              eds.df,
              selected.nd,
              var = "type")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nds.df}{
    %%     ~~Describe \code{x} here~~
      a dataframe of the edges coming from the 'read_nds' function
  }
  \item{eds.df}{
    %%     ~~Describe \code{x} here~~
      a dataframe of the edges coming from the 'read_eds' function
  }
  \item{selected.nd}{
    %%     ~~Describe \code{x} here~~
      the 'id' of the node which will permit to identify the contemporaneous component of the decoration graph
  }
  \item{var}{
    %%     ~~Describe \code{x} here~~
      the field of 'eds.df' on which the '>' value will be search, by default the 'type' field
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
  return a list of length two with the dataframes of contemporaneous nodes (1) and contemporaneous edges (2)
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
# set data folder
dataDir <- system.file("extdata", package = "decorr")

# read a decoration
nds.df <- read_nds(site = "Ibahernando",
                   decor = "Ibahernando",
                   doss = dataDir)
eds.df <- read_eds(site = "Ibahernando",
                   decor = "Ibahernando",
                   doss = dataDir)
l_dec_df <- contemp_nds(nds.df, eds.df, selected.nd, var = "type")

l_dec_df[[1]]
#    id     type        x         y
# 39  2    lance 351.6009 -191.5644
# 40  3 bouclier 345.0360 -296.6023
# 41  4     epee 367.3566 -420.6782

l_dec_df[[2]]
#    a b type       xa        ya       xb        yb
# 50 2 3    = 351.6009 -191.5644 345.0360 -296.6023
# 51 3 4    = 345.0360 -296.6023 367.3566 -420.6782

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 graphs}% use one of  RShowDoc("KEYWORDS")
