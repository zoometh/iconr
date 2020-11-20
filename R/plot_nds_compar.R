plot_nds_compar <- function(listg, graph2 = NULL, doss = getwd(), var = "type",
                            common.nds.color = "red", different.nds.color = "orange",
                            common.nds.size = 1, different.nds.size = 0.5,
                            eds.color = "orange") {
    # Gathering "different" and "common" parameters in vectors
    # avoids if statements.
    nds.color <- c(different.nds.color, common.nds.color)
    nds.size  <- c(different.nds.size,  common.nds.size)
    out.compar.list <- character(0)
    for(i in 1:length(listg)) {
        g <- listg[[i]]
        g.names <- unlist(lapply(g, function(x) x$name))
        if(is.null(graph2) || all(g.names %in% graph2)) {
            out.compar <- paste0("compar_nds_", g.names[1], "_",
                                 g.names[2], ".png")
            tit <- paste0("nodes: compare decorations '", g.names[1],
                          "' and '", g.names[2], "'")
            grDevices::png(out.compar, width = 14, height = 7,
                           units = "cm", res = 300)
            # Set the plotting area into a 1*2 array
            graphics::par(mfrow = c(1, 2), mar = c(0, 0, 0, 0))
            side_plot_nds(g[[1]], doss, var, nds.color, nds.size, eds.color)
            side_plot_nds(g[[2]], doss, var, nds.color, nds.size, eds.color)
            graphics::mtext(tit, side = 1, line = -1, outer = TRUE, cex = 0.6)
            grDevices::dev.off()
            out.compar.list[length(out.compar.list) + 1] <- out.compar
        }
    }
    return(paste0(getwd(), "/", out.compar.list))
}
