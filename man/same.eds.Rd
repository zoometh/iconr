\name{same.eds}
\alias{same.eds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Matching Edges in a Pairwise Comparison}
\description{
  Count matching edges of each decoration will be comparated to edges from the other decorations. For example "epee--casque" from decoration A match with "epee--casque" from decoration B
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
  same.eds(imgs,
           nodes,
           edges,
           var="type")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{imgs}{
%%     ~~Describe \code{x} here~~
    list of decorations
}
        \item{nodes}{
%%     ~~Describe \code{x} here~~
    nodes
}
          \item{edges}{
%%     ~~Describe \code{x} here~~
    edges
}
            \item{var}{
%%     ~~Describe \code{x} here~~
    field name in 'nodes' dataframe on which the comparisons will be done, by default the fieldname is "type"
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
  create a symetric matrix of coincidences
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
# read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),sep="\t",stringsAsFactors = F)
# create the symetric matix
df.same_edges <- same.eds(imgs,nodes,edges,var="type")
# > df.same_edges
# 1 2 3 4
# 1 0 0 1 2
# 2 0 0 3 5
# 3 1 3 0 1
# 4 2 5 1 0

# heatmap
library(ggplot2)
library(reshape2)

df.same_edges[lower.tri(df.same_edges,diag=T)] <- NA
melt.df.same_edges <- melt(as.matrix(df.same_edges))
heat.mat <- ggplot(data = melt.df.same_edges, aes(x=Var1, y=Var2, fill=value)) + 
  ggtitle(paste0("counts of edges with the same 'type'",
                 "\nbetween ",nrow(df.same_edges)," decorations"))+
  geom_tile(na.rm = T) +
  scale_fill_gradient2(na.value = 'white',
                       breaks=c(1,3,8,12,18))+
  geom_text(aes(Var1, Var2, label = value),
            color = "black", size = 4)+
  theme_minimal() +
  theme(axis.title = element_blank()) +
  theme(legend.position = "none")
heat.mat
## output a ggplot heatmap
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
