list_nds_compar <- function(lgrph,
                            var="type",
                            common.nds.color="red",
                            different.nds.color="orange",
                            common.nds.size=1,
                            different.nds.size=.5,
                            verbose=FALSE){
  # verbose <- T ; var <- "type"
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
    gA.nds <- igraph::get.vertex.attribute(gA, var, index=igraph::V(gA))
    gB.nds <- igraph::get.vertex.attribute(gB, var, index=igraph::V(gB))
    common.nodes <- intersect(gA.nds,gB.nds)
    grph2compar <- list() # out list
    for(i in c(A,B)){
      # loop through graphs
      # i <- 1
      idx.g <- which(unlist(lapply(lgrph, function(x) x$name==i)))
      grp <- lgrph[[idx.g]]
      g.sz <- igraph::gorder(grp) # by edges
      igraph::get.vertex.attribute(grp, "name", index=igraph::V(grp))
      for (n in 1:g.sz){
        # n <- 2
        a.n <- eval(parse(text=paste0("igraph::V(grp)[n]$",var))) # useful to get var
        if(a.n %in% common.nodes){
          grp <- igraph::set_vertex_attr(grp, "color", index = n, common.nds.color)
          grp <- igraph::set_vertex_attr(grp, "cex", index = n, common.nds.size)
          grp <- igraph::set_vertex_attr(grp, "comm", index = n, 1)
        } else {
          grp <- igraph::set_vertex_attr(grp, "color", index = n, different.nds.color)
          grp <- igraph::set_vertex_attr(grp, "cex", index = n, different.nds.size)
          grp <- igraph::set_vertex_attr(grp, "comm", index = n, 0)
        }
      }
      grph2compar[[length(grph2compar)+1]] <- grp # recompose list
    }
    grphAllcompar[[length(grphAllcompar)+1]] <- grph2compar
  }
  return(grphAllcompar)
}
