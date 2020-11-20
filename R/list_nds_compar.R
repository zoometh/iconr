list_nds_compar <- function(lgrph, var = "type",
                            verbose = FALSE) {
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

nds_compar <- function(grphs, var = "type") {
    g.nds = lapply(grphs,
                   function(x) igraph::get.vertex.attribute(x, var,
                                                            index = igraph::V(x)))
    common.nodes <- intersect(g.nds[[1]], g.nds[[2]])
    for (i in 1:2) {
        igraph::V(grphs[[i]])$comm <- as.numeric(g.nds[[i]] %in% common.nodes)
    }
    return(grphs)
}
