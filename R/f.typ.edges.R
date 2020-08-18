#' @keywords internal
f.typ.edges <- function(sel.edges,lgrph){
  # presence/absence type of edge, to dataframe
  df.typ_edges <- as.data.frame(matrix(nrow = length(lgrph),
                                       ncol = length(sel.edges)))
  # rename col and row
  rownames(df.typ_edges) <- 1:length(lgrph)
  colnames(df.typ_edges) <- sel.edges
  df.typ_edges[is.na(df.typ_edges)] <- 0 # default empty cells
  for (i in 1:length(lgrph)){
    # graph have same idf in the list and in dataframes
    #print(i)
    #mat <- as_edgelist(lgrph[[i]])
    mat <- as.data.frame(igraph::as_edgelist(lgrph[[i]])) # edges
    mat$typ <- igraph::edge.attributes(lgrph[[i]])$typ # typ of edges
    mat$typ[is.na(mat$typ)] <- "=" # change NA to =
    for (j in 1:nrow(mat)){
      #j <- 1
      AB <- paste0(mat[j,1],mat[j,"typ"],mat[j,2])
      BA <- paste0(mat[j,2],mat[j,"typ"],mat[j,1])
      # undirected graphs
      # fill with "nez=vide" or "vide=nez"
      if (AB %in% colnames(df.typ_edges)){
        df.typ_edges[i,AB] <- df.typ_edges[i,AB]+1 # add +1
      }
      if (BA %in% colnames(df.typ_edges)){
        df.typ_edges[i,BA] <- df.typ_edges[i,BA]+1 # add +1
      }
    }
  }
  return(df.typ_edges)
}
