f_typ_edges <- function(tot.edges,lgrph,verbose=TRUE){
  # presence/absence type of edge, to dataframe
  # verbose <- T
  sel.edges <- paste0(tot.edges[,1],tot.edges[,2])
  sel.edges <- gsub(".{1}$","",sel.edges) # rm last character
  df.typ_edges <- as.data.frame(matrix(nrow = length(lgrph),
                                       ncol = length(sel.edges)))
  # rename col and row
  lidf <- unlist(lapply(lgrph, function(x) x$name))
  rownames(df.typ_edges) <-  lidf # get names
  colnames(df.typ_edges) <- sel.edges
  df.typ_edges[is.na(df.typ_edges)] <- 0 # default empty cells
  for (i in 1:length(lgrph)){
    # graph have same idf in the list and in dataframes
    if (verbose){print(paste0("read graph: ",lgrph[[i]]$name))}
    #mat <- as_edgelist(lgrph[[i]])
    # i <- 4
    mat <- as.data.frame(igraph::as_edgelist(lgrph[[i]])) # edges
    mat$type <- igraph::edge.attributes(lgrph[[i]])$type # typ of edges
    # mat$type[is.na(mat$type)] <- "=" # change NA to =
    for (j in 1:nrow(mat)){
      #j <- 12
      AB <- paste0(mat[j,1],mat[j,"type"],mat[j,2])
      BA <- paste0(mat[j,2],mat[j,"type"],mat[j,1])
      if (verbose){print(paste0("      ",AB,' <=> ',BA))}
      # undirected graphs
      # fill with "nez=vide" or "vide=nez"
      if (AB %in% colnames(df.typ_edges)){
        df.typ_edges[i,AB] <- df.typ_edges[i,AB]+1 # add +1
        if (verbose){print("                       match!")}
      }
      if (BA %in% colnames(df.typ_edges)){
        df.typ_edges[i,BA] <- df.typ_edges[i,BA]+1 # add +1
        if (verbose){print("                       match!")}
      }
    }
  }
  return(df.typ_edges)
}
