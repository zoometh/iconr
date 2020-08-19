same_eds <- function(imgs,nodes,edges,var="type"){
  # TODO: change "type" to 'var'
  lgrph <- list_grph(imgs,nodes,edges,var) # call function
  lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name)) # get names
  mat.same_edges <- matrix(nrow = length(lgrph),
                           ncol = length(lgrph))
  mat.same_edges <- as.data.frame(mat.same_edges)
  rownames(mat.same_edges) <- colnames(mat.same_edges)<- lgrph_nmes
  mat.same_edges[is.na(mat.same_edges)] <- 0 # replace NA with 0
  # lgrph_nmes <- c()
  # for (i in 1:length(lgrph)){
  #   lgrph_nmes <- c(lgrph_nmes,lgrph[[i]]$name)
  #   print (lgrph[[i]]$name)
  # }
  # identify same edges btw graphs
  # return all edges as a vector character
  
  # list all edges
  tot.edges <- data.frame("V1"=character(),
                          "V2"=character(),
                          "type"=character(),
                          stringsAsFactors=FALSE)
  # all unique type of edges
  for(i in 1:length(lgrph)){
    # i <- 1
    a.g <- lgrph[[i]]
    #print(paste0(i,".",a.g$name))
    g.edg <- as.data.frame(igraph::as_edgelist(a.g)) # edges
    g.edg$type <- igraph::edge.attributes(a.g)$type # 
    # if (rm.attributes){
    #   g.edg <- g.edg[g.edg$typ != "+",]
    # }
    tot.edges <- rbind(tot.edges,g.edg)
  }
  #tot.edges$typ[is.na(tot.edges$typ)] <- "=" # change NA to =
  # opt suppress duplicated
  tot.edges <- tot.edges[!duplicated(t(apply(tot.edges[c("V1", "V2","type")], 1, sort))), ]
  sel.edges <- paste0(tot.edges[,1],tot.edges[,"type"],tot.edges[,2]) # like "nez=vide"
  # sel.edges <- f.tot.edges(lgrph)
  df.typ_edges <- f.typ.edges(sel.edges,lgrph) # call function
  # at least a common edge appears 2 times, limit the df
  df.typ_edges.sub <- df.typ_edges[,colSums(df.typ_edges) > 1]
  for (c in 1:ncol(df.typ_edges.sub)){
    #c <- 2
    a.col <- df.typ_edges.sub[,c] # get column
    # at least 2 decoration without 0
    if(length(a.col[!a.col %in% 0]) > 1){
      idxs <- which(a.col %in% c(1:100)) # count of egal betw 1 and Inf
      all.comb <- subset(expand.grid(rep(list(idxs),2)), Var1 != Var2)
      for (r in 1:nrow(all.comb)){
        #r <- 1
        x <- all.comb[r,"Var1"];y <- all.comb[r,"Var2"]
        mat.same_edges[x,y] <- mat.same_edges[x,y]+1
        mat.same_edges[y,x] <- mat.same_edges[y,x]+1
      }
    }
  }
  # divide all cells by 2 (symetry)
  mat.same_edges[] <- lapply(mat.same_edges, function(x) x/2)
  colnames(mat.same_edges) <- row.names(mat.same_edges) <- lgrph_nmes
  return(mat.same_edges)
}
