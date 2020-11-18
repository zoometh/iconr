same_nds <- function(lgrph, var = "type") {
    lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name))  # get names
    g.nds = lapply(lgrph,
                   function(x) igraph::get.vertex.attribute(x, var,
                                                        index = igraph::V(x)))
    mat.same_nodes <- outer(g.nds, g.nds,
                            Vectorize(function(x,y) length(intersect(x,y))))
    diag(mat.same_nodes) <- 0
    rownames(mat.same_nodes) <- colnames(mat.same_nodes) <- lgrph_nmes
    return(mat.same_nodes)
}
