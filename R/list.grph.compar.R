list.grph.compar <- function(lgrph,
                             common.eds.color="red",
                             different.eds.color="orange",
                             common.eds.width=2,
                             different.eds.width=1,
                             verbose=F){
  lidf <- unlist(lapply(lgrph, function(x) x$name))
  ldec.comp <- t(combn(lidf, 2)) # all pairwise comparisons
  if(verbose){
    print(paste0("there is ",nrow(ldec.comp)," pairwise comparisons to compute"))
  }
  grphAllcompar <- list()
  for (dec in 1:nrow(ldec.comp)){
    # dec <- 1
    A <- ldec.comp[dec,][1]
    B <- ldec.comp[dec,][2]
    gA <- lgrph[[A]]
    gB <- lgrph[[B]]
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
                                          common.edges.same.type)
    # common.edges <- delete.edges(common.edges,E(common.edges))
    # common.edges <- add.edges(common.edges,common.edges.same.type)
    ab <- igraph::as_data_frame(common.edges)
    if(nrow(ab)>0){
      ab.same <- subset(ab, same == 1)
      ab.same <- c(ab.same$from,ab.same$to,ab.same$type_1)
    }
    if(nrow(ab)==0){
      ab.same <- NA
    }
    grph.comp <- list(gA,gB)
    grph2compar <- list() # out list
    for(g in 1:length(grph.comp)){
      # g <- 1
      grp <- grph.comp[[g]]
      g.sz <- igraph::gsize(grp)
      for (e in 1:g.sz){
        # e <- 1
        grp.ed.from <- igraph::as_data_frame(grp)[e,]$from
        grp.ed.to <- igraph::as_data_frame(grp)[e,]$to
        grp.ed.type <- igraph::as_data_frame(grp)[e,]$type
        grp.ed.is <- c(grp.ed.from,grp.ed.to,grp.ed.type)
        if(all(grp.ed.is %in% ab.same)){
          grp <- igraph::set_edge_attr(grp, "color", index = e, common.eds.color)
          grp <- igraph::set_edge_attr(grp, "width", index = e, common.eds.width)
        }
        if(!all(grp.ed.is %in% ab.same)){
          grp <- igraph::set_edge_attr(grp, "color", index = e, different.eds.color)
          grp <- igraph::set_edge_attr(grp, "width", index = e, different.eds.width)
        }
      }
      grph2compar[[length(grph2compar)+1]] <- grp
    }
    grphAllcompar[[length(grphAllcompar)+1]] <- grph2compar
  }
  return(grphAllcompar)
}
