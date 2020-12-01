same_eds <- function(lgrph, var = "type") {
    lgrph_nmes <- unlist(lapply(lgrph, function(x) x$name))  # get names
    g.eds <- lapply(lgrph, function(x) named_edges(x, var))
    mat.same_edges <- outer(g.eds, g.eds,
                            Vectorize(function(x,y) length(intersect(x,y))))
    rownames(mat.same_edges) <- colnames(mat.same_edges) <- lgrph_nmes
    return(mat.same_edges)
}
