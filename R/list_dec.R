#' @export
list_dec <- function(imgs, nodes, edges) {
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
        # attributes
        g$name <- a.enr$idf
        g$site <- a.enr$site
        g$decor <- a.enr$decor
        g$lbl <- paste0(g$name, "-", g$site, ".", g$decor)
        g$img <- a.enr$img
        lgrph[[r]] <- g
    }
    return(lgrph)
}
