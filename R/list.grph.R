list.grph <- function(imgs,
                       nodes,
                       edges,
                       var="type"){
    # 'var': field on which the comparison will be done
    # create list of graphs
    lgrph <- list()
    for (r in 1:nrow(imgs)){
      # r <- 1
      a.enr <- imgs[r,]
      a.site <- a.enr$site ; a.decor <- a.enr$decor ; a.idf <- a.enr$idf
      g.nodes <- subset(nodes, site == a.site & decor == a.decor) # nodes
      g.nodes <- subset(g.nodes, select=-c(site,decor))
      g.edges <- subset(edges, site == a.site & decor == a.decor) # edges
      g.edges <- subset(g.edges, select=-c(site,decor))
      # create graph
      g <- igraph::graph_from_data_frame(g.edges, directed = FALSE, vertices= g.nodes)
      g.nodes.idf <- igraph::V(g)$name # get name of vertices
      igraph::V(g)$name <- igraph::as_data_frame(g, what="vertices")[,var]
      # V(g)$name <- V(g)$type # remplace les numeros par leur types # TODO: permit change
      igraph::V(g)$idf <- g.nodes.idf
      # attributes
      g$name <- a.idf # graph name
      g$label <- paste0(as.character(g$name),'-',imgs[gA$name,"site"],'.',imgs[gA$name,"decor"])
      g$img <- imgs[gA$name,"img"]
      # g$name <- paste0(as.character(r),"-",a.site,'.',a.decor) # name
      lgrph[[length(lgrph)+1]] <- g
    }
    return(lgrph)
  }
