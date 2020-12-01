same_elements <- function (lgrph, var = "type", focus = c("nodes")) {
  extract_elements <- list(nodes = function(x) igraph::vertex_attr(x, var),
                           edges = function(x) named_edges(x, var))
  if (!focus %in% names(extract_elements)) {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }
  lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name))
  if(focus == "nodes"){
    g.nds <- lapply(lgrph, function(x) igraph::vertex_attr(x, var))
    mat.same_nodes <- outer(g.nds, g.nds,
                            Vectorize(function(x,y) length(intersect(x,y))))
    rownames(mat.same_nodes) <- colnames(mat.same_nodes) <- lgrph_nmes
    return(mat.same_nodes)
  }
  if(focus == "edges"){
    # g.eds <- lapply(lgrph, function(x) named_edges(x, var))
    # mat.same_elements <- outer(g.eds, g.eds,
    #                         Vectorize(function(x,y) length(intersect(x,y))))
    # rownames(mat.same_elements) <- colnames(mat.same_elements) <- lgrph_nmes
    mat.same_elements <- matrix(nrow = length(lgrph), ncol = length(lgrph))
    mat.same_elements <- as.data.frame(mat.same_elements)
    rownames(mat.same_elements) <- colnames(mat.same_elements) <- lgrph_nmes
    mat.same_elements[is.na(mat.same_elements)] <- 0  # replace NA with 0  
    # list all edges
    tot.edges <- data.frame(V1 = character(), V2 = character(), type = character(), 
                            stringsAsFactors = FALSE)
    # all edges
    for (i in 1:length(lgrph)) {
      # i <- 4
      a.g <- lgrph[[i]]
      g.edg <- as.data.frame(igraph::as_edgelist(a.g))  # edges
      g.edg$type <- igraph::edge.attributes(a.g)$type  # 
      tot.edges <- rbind(tot.edges, g.edg)
    }
    tot.edges <- data.frame(lapply(tot.edges, as.character), stringsAsFactors = F)
    tot.edges$V1 <- paste0(tot.edges$V1, tot.edges$type)
    tot.edges$V2 <- paste0(tot.edges$V2, tot.edges$type)
    tot.edges <- tot.edges[!duplicated(t(apply(tot.edges[1:2], 1, sort))), 
                           ]  # rm duplicated
    sel.edges <- paste0(tot.edges[, 1], tot.edges[, 2])
    # anct 'f_typ_edges' function - - - - - - - - - - - - - - - - - - - - -
    # -
    sel.edges <- gsub(".{1}$", "", sel.edges)  # rm last character
    df.typ_edges <- as.data.frame(matrix(nrow = length(lgrph), ncol = length(sel.edges)))
    # rename col and row
    lidf <- unlist(lapply(lgrph, function(x) x$name))
    rownames(df.typ_edges) <- lidf  # get names
    colnames(df.typ_edges) <- sel.edges
    df.typ_edges[is.na(df.typ_edges)] <- 0  # default empty cells
    for (i in 1:length(lgrph)) {
      # graph have same idf in the list and in dataframes
      mat <- as.data.frame(igraph::as_edgelist(lgrph[[i]]))  # edges
      mat$type <- igraph::edge.attributes(lgrph[[i]])$type  # typ of edges
      # mat$type[is.na(mat$type)] <- '=' # change NA to =
      for (j in 1:nrow(mat)) {
        # j <- 12
        AB <- paste0(mat[j, 1], mat[j, "type"], mat[j, 2])
        BA <- paste0(mat[j, 2], mat[j, "type"], mat[j, 1])
        # undirected graphs fill with 'nez=vide' or 'vide=nez'
        if (AB %in% colnames(df.typ_edges)) {
          df.typ_edges[i, AB] <- df.typ_edges[i, AB] + 1  # add +1
        }
        if (BA %in% colnames(df.typ_edges)) {
          df.typ_edges[i, BA] <- df.typ_edges[i, BA] + 1  # add +1
        }
      }
    }
    # at least a common edge appears 2 times, limit the df
    df.typ_edges.sub <- df.typ_edges[, colSums(df.typ_edges) > 1]
    all.comp <- as.data.frame(t(utils::combn(row.names(df.typ_edges.sub), 
                                             2)))
    for (a.comp in 1:nrow(all.comp)) {
      # all pairwise comparisons a.comp <- 1
      idx.A <- as.character(all.comp[a.comp, 1])
      idx.B <- as.character(all.comp[a.comp, 2])
      df.typ_edges.sub.ct <- df.typ_edges.sub[c(idx.A, idx.B), ]
      ct <- 0
      for (c in 1:ncol(df.typ_edges.sub.ct)) {
        # c <- 1 take the min
        ct.col <- min(df.typ_edges.sub.ct[1, c], df.typ_edges.sub.ct[2, 
                                                                     c])
        ct <- ct + ct.col
      }
      mat.same_elements[idx.A, idx.B] <- ct
      mat.same_elements[idx.B, idx.A] <- ct
    }
    return(mat.same_elements)
  }
}
