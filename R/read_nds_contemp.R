read_nds_contemp <- function(nds.df, eds.df, selected.nd){
  # selected.nd <- 3
  nds.df$site <- nds.df$decor <- NULL
  eds.df$site <- eds.df$decor <- NULL
  g <- igraph::graph_from_data_frame(eds.df, vertices= nds.df, directed=FALSE)
  list.vertex.attributes(g)
  # rm '>' edges
  # match(E(g)$type,'>')
  eds.overlap <- which(match(E(g)$type,'>') %in% 1)
  g <- delete.edges(g, edg.overlap)
  g.member <- components(g)$membership

  selected.comp <- as.numeric(g.member[selected.nd])
  # match(g.member,selected.comp)
  # which(match(E(g)$type,'>') %in% selected.comp)
  nds.overlap <- as.numeric(which(g.member != selected.comp))
  # g <- delete.vertices(g, over.nds)
  nds.df.contemp <- nds.df[!(nds.df$id %in% nds.overlap),]
  eds.df.contemp <- eds.df[-eds.overlap,]
  return(list(nds.df.contemp,eds.df.contemp))
}
