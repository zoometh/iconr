plot_nds_compar <- function(listg, graph2 = NULL, doss = getwd(), var = "type",
                            common.nds.color = "red", different.nds.color = "orange",
                            common.nds.size = 1, different.nds.size = 0.5,
                            eds.color = "orange", eds.width = 1,
                            lbl.size = 0.4,
                            img.format = "png", res = 300) {
    # Gathering "different" and "common" parameters in vectors
    # avoids if statements.
    nds.color <- c(different.nds.color, common.nds.color)
    nds.size  <- c(different.nds.size,  common.nds.size)
    eds.color <- rep(eds.color, 2)
    eds.width <- rep(eds.width, 2)

    return(plot_compar(listg, graph2, "nodes", doss, var,
                       nds.color, nds.size,
                       eds.color, eds.width,
                       lbl.size,
                       img.format, res))
}
