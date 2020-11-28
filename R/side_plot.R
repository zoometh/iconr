# I have recreate it from side_plot_nds
# up to now, common nds are correctlty plotted
# but it do not plot correctly the common edges

side_plot<- function(grp, doss, var,
                          nds.color = c("orange", "red"),
                          nds.size = c(0.5, 1),
                          eds.color = c("orange", "red"),
                          eds.width = c(1, 2),
                          lbl.size = 0.4) {
    dec.img <- magick::image_read(paste0(doss, "/", grp$img))
    # add the decor site and name
    dec.img <- magick::image_annotate(dec.img,
                                      paste0(grp$site, "\n", grp$decor),
                                      gravity = "northwest", size = 20)
    drawing.decor <- grDevices::as.raster(dec.img)
    graphics::plot(drawing.decor)
    offset.img <- nrow(drawing.decor)  # offset depends on raster size

    igraph::V(grp)$name <- 1:igraph::gorder(grp)
    g.nodes <- igraph::as_data_frame(grp, what = "vertices")
    g.nodes$y <- g.nodes$y + offset.img  # add the offset
    g.edges <- igraph::as_data_frame(grp)
    ed.type <- ifelse(g.edges$type %in% c("+", ">"), 2, 1)
    for (edg in 1:nrow(g.edges)) {
        edg.vert <- as.numeric(g.edges[edg, c("from","to")]) # Edge vertices.
        graphics::lines(g.nodes$x[edg.vert],
                        g.nodes$y[edg.vert],
                        # lty = ed.type[edg],
                        # lwd = g.edges$width[edg], col = eds.color)
                        lty = ed.type[edg],
                        lwd = eds.width[g.edges$comm],
                        col = eds.color[g.edges$comm])
    }
    graphics::points(g.nodes$x, g.nodes$y, pch = 16,
                     cex = nds.size[g.nodes$comm + 1],
                     col = nds.color[g.nodes$comm + 1])
    # Get common nodes to plot labels
    nds.lbl <- g.nodes[g.nodes$comm == 1, ]
    labels_shadow(nds.lbl$x, nds.lbl$y, label = nds.lbl[, var],
                  col = nds.color[2], bg = "white", cex = lbl.size, r = 0.2)
}
