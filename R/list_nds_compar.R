list_nds_compar <- function(lgrph, var = "type",
                            common.nds.color = "red", different.nds.color = "orange",
                            common.nds.size = 1, different.nds.size = 0.5,
                            verbose = FALSE) {
    # Gathering "different" and "common" parameters in vectors
    # avoids if statements.
    nds.color <- c(different.nds.color, common.nds.color)
    nds.size  <- c(different.nds.size,  common.nds.size)
    # Get the vertex names of each graph of the graph list.
    ldec.comp <- utils::combn(1:length(lgrph), 2)  # all pairwise comparisons
    if (verbose) {
        print(paste0("there is ", ncol(ldec.comp), " pairwise comparisons to compute"))
    }
    grphAllcompar <- list()
    for (dec in 1:ncol(ldec.comp)) {
        idx.g <- ldec.comp[, dec]
        if (verbose) {
            tit <- paste0("compare decorations '", lgrph[[idx.g[1]]]$name,
                          "' and '", lgrph[[idx.g[2]]]$name, "'")
            print(paste0("    ", dec, ") ", tit))
        }
        grphAllcompar[[dec]] <- decorr::nds_compar(lgrph[idx.g], var,
                                                   nds.color, nds.size)
    }
    return(grphAllcompar)
}

nds_compar <- function(grphs, var = "type",
                       nds.color = c("orange", "red"),
                       nds.size = c(0.5, 1)) {
    g.nds = lapply(grphs,
                   function(x) igraph::get.vertex.attribute(x, var,
                                                            index = igraph::V(x)))
    common.nodes <- intersect(g.nds[[1]], g.nds[[2]])
    for (i in 1:2) {
        # loop through graphs i <- 1
        v.com <- as.numeric(g.nds[[i]] %in% common.nodes)
        igraph::V(grphs[[i]])$color <- nds.color[v.com + 1]
        igraph::V(grphs[[i]])$cex <- nds.size[v.com + 1]
        igraph::V(grphs[[i]])$comm <- v.com
    }
    return(grphs)
}
