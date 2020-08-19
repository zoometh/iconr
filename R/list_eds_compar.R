list_eds_compar <- function(lgrph,
                             common.eds.color="red",
                             different.eds.color="orange",
                             common.eds.width=2,
                             different.eds.width=1,
                             verbose=F){
  # verbose <- T
  lidf <- unlist(lapply(lgrph, function(x) x$name))
  ldec.comp <- t(utils::combn(lidf, 2)) # all pairwise comparisons
  if(verbose){
    print(paste0("there is ",nrow(ldec.comp)," pairwise comparisons to compute"))
  }
  grphAllcompar <- list()
  for (dec in 1:nrow(ldec.comp)){
    # dec <- 1
    A <- ldec.comp[dec,][1]
    B <- ldec.comp[dec,][2]
    # get index in the list
    idxA <- which(unlist(lapply(lgrph, function(x) x$name==A)))
    idxB <- which(unlist(lapply(lgrph, function(x) x$name==B)))
    # get graph
    gA <- lgrph[[idxA]]
    gB <- lgrph[[idxB]]
    # default colors
    tit <- paste0("compare decorations '",A,"' and '",B,"'")
    if (verbose){
      print (paste0("    ",dec,") ", tit))
    }
    # lgcomp <- list(lgrph[[to.compare[1]]],lgrph[[to.compare[2]]])
    # esss <- igraph::intersection(lgcomp)
    common.edges <- igraph::intersection(gA,gB)
    # check on type of edge
    same.type <- igraph::E(common.edges)$type_1 == igraph::E(common.edges)$type_2
    common.edges.same.type <- igraph::E(common.edges)[same.type]
    common.edges <- igraph::set_edge_attr(common.edges, "same",
                                          index = igraph::E(common.edges),
                                          1)
    ab <- igraph::as_data_frame(common.edges)
    if(nrow(ab)>0){
      ab.same <- subset(ab, same == 1)
      ab.same <- subset.data.frame(ab.same,select=c("from","to","type_1"))
      colnames(ab.same)[which(names(ab.same) == "type_1")] <- "type"
      # ab.same <- c(ab.same$from,ab.same$to,ab.same$type_1)
    }
    if(nrow(ab)==0){
      ab.same <- ab
      # next
    }
    grph.comp <- list(gA,gB)
    grph2compar <- list() # out list
    for(g in 1:length(grph.comp)){
      # g <- 1
      grp <- grph.comp[[g]]
      g.sz <- igraph::gsize(grp) # by edges
      for (e in 1:g.sz){
        # loop through edges
        # e <- 1
        grp.ed.from <- igraph::as_data_frame(grp)[e,]$from
        grp.ed.to <- igraph::as_data_frame(grp)[e,]$to
        grp.ed.type <- igraph::as_data_frame(grp)[e,]$type
        grp.ed.is <- c(grp.ed.from,grp.ed.to,grp.ed.type)
        flag.same <- FALSE
        for(c.e in 1:nrow(ab.same)){
          # loop through same edges
          # c.e <- 1
          same.ed.from <- ab.same[c.e,]$from
          same.ed.to <- ab.same[c.e,]$to
          same.ed.type <- ab.same[c.e,]$type
          same.ed.is <- c(same.ed.from,same.ed.to,same.ed.type)
          # undirected, so %in% works
          if(all(grp.ed.is %in% same.ed.is)){
            flag.same <- TRUE
          }
        }
        if(flag.same){
          grp <- igraph::set_edge_attr(grp, "color", index = e, common.eds.color)
          grp <- igraph::set_edge_attr(grp, "width", index = e, common.eds.width)
        } else {
          grp <- igraph::set_edge_attr(grp, "color", index = e, different.eds.color)
          grp <- igraph::set_edge_attr(grp, "width", index = e, different.eds.width)
        }
      }
      grph2compar[[length(grph2compar)+1]] <- grp # recompose list
    }
    grphAllcompar[[length(grphAllcompar)+1]] <- grph2compar
  }
  return(grphAllcompar)
}
