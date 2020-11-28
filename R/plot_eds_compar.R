plot_eds_compar <- function(listg, graph2 = NULL, doss = getwd(), var = "type",
                            common.eds.color = "red", different.eds.color = "orange",
                            common.eds.width = 2, different.eds.width = 1,
                            nds.size = 0.5,
                            lbl.size = 0.4,
                            img.format = "png", res = 300) {
    # Gathering "different" and "common" parameters in vectors
    # avoids if statements.
    eds.color <- c(different.eds.color, common.eds.color)
    eds.width <- c(different.eds.width,  common.eds.width)
    nds.color = eds.color
    nds.size = rep(nds.size, 2)

    return(plot_compar(listg, graph2, "edges", doss, var,
                       nds.color, nds.size,
                       eds.color, eds.width,
                       lbl.size,
                       img.format, res))
}
