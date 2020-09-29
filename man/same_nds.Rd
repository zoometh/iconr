\name{same_nds}
\alias{same_nds}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Matching Nodes in a Pairwise Comparison}
\description{
  Depending on the field 'var', count matching nodes between each decoration pairwise. For example "casque" value in "type" field, from decoration A, matches with "casque" from decoration B
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
  same_nds(lgrph,var="type")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
      \item{lgrph}{
%%     ~~Describe \code{x} here~~
    list of decorations coming from the 'list_dec' function
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

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link[decorr]{list_dec}}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# set wd to data folder
setwd(system.file("extdata", package = "decorr"))
# read imgs, nodes and edges dataframes
imgs <- read.table(system.file("extdata", "imgs.tsv", package = "decorr"),
                   sep="\t",stringsAsFactors = FALSE)
nodes <- read.table(system.file("extdata", "nodes.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
edges <- read.table(system.file("extdata", "edges.tsv", package = "decorr"),
                    sep="\t",stringsAsFactors = FALSE)
lgrph <- list_dec(imgs,nodes,edges,"type") # call function
df.same_nodes<- same_nds(lgrph,"type")
df.same_nodes
#   1 2 3 4
# 1 0 2 3 4
# 2 2 0 5 7
# 3 3 5 0 4
# 4 4 7 4 0

# heatmap
require(ggplot2)
require(reshape2)

df.same_nodes[lower.tri(df.same_nodes,diag=TRUE)] <- NA
melt.df.same_nodes <- melt(as.matrix(df.same_nodes))
heat.mat <- ggplot(data = melt.df.same_nodes, aes(x=Var1, y=Var2, fill=value)) + 
  ggtitle(paste0("counts of nodes with the same 'type'",
                 "\nbetween ",nrow(df.same_nodes)," decorations"))+
  geom_tile(na.rm = TRUE) +
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
\keyword{ ~kwd1 graph}% use one of  RShowDoc("KEYWORDS")
