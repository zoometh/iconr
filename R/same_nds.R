same_nds <- function(lgrph, var = "type") {
    lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name))  # get names
    g.nds <- lapply(lgrph, function(x) igraph::vertex_attr(x, var))
    mat.same_nodes <- outer(g.nds, g.nds,
                            Vectorize(function(x,y) length(intersect(x,y))))
    rownames(mat.same_nodes) <- colnames(mat.same_nodes) <- lgrph_nmes
    return(mat.same_nodes)
}
                                      
