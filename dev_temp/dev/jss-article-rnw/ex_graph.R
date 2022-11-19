library(igraph)
# "art"
ugs <- data.frame(name=c("a","r","t"))
edg <- data.frame(from=c("a", "r"),to=c("r", "t"),property.name=c("",""))
g <- graph_from_data_frame(edg, directed=FALSE, vertices= ugs)
plot(g,layout = layout.fruchterman.reingold)
graph.density(g,loop=FALSE)
betweenness(g)
