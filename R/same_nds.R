same_nds <- function(lgrph, var = "type") {
    # var = 'type'
    lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name))  # get names
    lcomp <- as.data.frame(t(utils::combn(lgrph_nmes, 2)))
    mat.same_nodes <- matrix(nrow = length(lgrph), ncol = length(lgrph))
    mat.same_nodes <- as.data.frame(mat.same_nodes)
    rownames(mat.same_nodes) <- colnames(mat.same_nodes) <- lgrph_nmes
    mat.same_nodes[is.na(mat.same_nodes)] <- 0  # replace NA with 0
    for (g in 1:nrow(lcomp)) {
        # pairwise comparisons g <- 2
        idx.A <- lcomp[g, 1]
        idx.B <- lcomp[g, 2]
        # grphs
        g.a <- lgrph[[idx.A]]
        g.b <- lgrph[[idx.B]]
        # nodes
        nds.a <- igraph::get.vertex.attribute(g.a, var, index = igraph::V(g.a))
        nds.b <- igraph::get.vertex.attribute(g.b, var, index = igraph::V(g.b))
        # intersect
        comm.nds <- intersect(nds.a, nds.b)
        # write the value in the symetric matrix
        mat.same_nodes[lcomp[g, 1], lcomp[g, 2]] <- length(comm.nds)
        mat.same_nodes[lcomp[g, 2], lcomp[g, 1]] <- length(comm.nds)
    }
    return(mat.same_nodes)
}
