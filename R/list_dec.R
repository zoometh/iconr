list_dec <- function(imgs, nodes, edges, var = "type") {
    # 'var': field on which the comparison will be done create list of
    # graphs
    lgrph <- list()
    for (r in 1:nrow(imgs)) {
        a.enr <- imgs[r, ]
        g.nodes <- nodes[nodes$site == a.enr$site & nodes$decor == a.enr$decor,
                         ! (names(nodes) %in% c("site", "decor"))]
        g.edges <- edges[edges$site == a.enr$site & edges$decor == a.enr$decor,
                         ! (names(edges) %in% c("site", "decor"))]
        # create graph
        g <- igraph::graph_from_data_frame(g.edges, directed = FALSE,
                                           vertices = g.nodes)
        # Vertex names saved as idf and replaced by types.
        igraph::V(g)$idf <- igraph::V(g)$name
        igraph::V(g)$name <- igraph::as_data_frame(g, what = "vertices")[, var]
        # attributes
        g$name <- a.enr$idf
        g$site <- a.enr$site
        g$decor <- a.enr$decor
        g$label <- paste0(g$name, "-", g$site, ".", g$decor)
        g$img <- a.enr$img
        lgrph[[r]] <- g
    }
    return(lgrph)
}
