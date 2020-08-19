same_nds <- function(imgs,nodes,edges,var="type"){
  # var = "type"
  lgrph <- list_grph(imgs,nodes,edges,var) # call function
  lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name)) # get names
  lcomp <- as.data.frame(t(combn(lgrph_nmes,2)))
  mat.same_nodes <- matrix(nrow = length(lgrph),
                           ncol = length(lgrph))
  mat.same_nodes <- as.data.frame(mat.same_nodes)
  rownames(mat.same_nodes) <- colnames(mat.same_nodes)<- lgrph_nmes
  mat.same_nodes[is.na(mat.same_nodes)] <- 0 # replace NA with 0
  for(g in 1:nrow(lcomp)){
    # g <- 1
    comp.a <- lcomp[g,1]
    comp.b <- lcomp[g,2]
    # grphs
    g.a <- lgrph[[comp.a]]
    g.b <- lgrph[[comp.b]]
    # nodes
    nds.a <- igraph::get.vertex.attribute(g.a, var, index=igraph::V(g.a))
    nds.b <- igraph::get.vertex.attribute(g.b, var, index=igraph::V(g.b))
    # intersect
    comm.nds <- intersect(nds.a,nds.b)
    # write the value in the matrix
    mat.same_nodes[comp.a,comp.b] <- mat.same_nodes[comp.b,comp.a] <- length(comm.nds)
  }
  return(mat.same_nodes)
}
