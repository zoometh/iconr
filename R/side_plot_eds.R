side_plot_eds <- function(g, idf, doss, var) {
    # a manner to use only plot() idf <- 1 ; var <- 'type'
    grp <- g[[idf]]
    dec.img <- magick::image_read(paste0(doss, "/", grp$img))
    # add the decor site and name
    dec.img <- magick::image_annotate(dec.img, paste0(grp$site, "\n", grp$decor), 
        gravity = "northwest", size = 20)
    drawing.decor <- grDevices::as.raster(dec.img)
    graphics::plot(drawing.decor)
    offset.img <- dim(drawing.decor)[1]  # offset depend on raster size
    # points(100,300) add all edges igraph::as_data_frame(gA)
    eds.xy <- read_eds(doss = doss, site = grp$site, decor = grp$decor)
    eds.xy$ya <- offset.img + eds.xy$ya  # add the offset
    eds.xy$yb <- offset.img + eds.xy$yb  # add the offset
    # eds.xy$ya <- abs(eds.xy$ya) ; eds.xy$yb <- abs(eds.xy$yb) # abs()
    nds.xy <- read_nds(doss = doss, site = grp$site, decor = grp$decor)
    nds.xy$y <- offset.img + nds.xy$y  # add the offset
    # nds.xy$y <- abs(nds.xy$y) # abs()
    g.edges <- cbind(igraph::as_data_frame(grp), eds.xy)  # bind to get coordinates & colors
    common.color <- unique(subset(g.edges, comm == 1)$color)
    # get common nodes (to plot labels)
    as <- subset(g.edges, comm == 1)$a
    bs <- subset(g.edges, comm == 1)$b
    abs <- sort(unique(c(as, bs)))
    nds.lbl <- subset(nds.xy, id %in% abs)
    # graph.j <- edges[edges$site==gA$site & edges$decor==gA$decor,]
    for (nd in 1:nrow(nds.xy)) {
        # all nodes
        graphics::points(c(nds.xy[nd, ]$x), c(nds.xy[nd, ]$y), pch = 16, 
            cex = 0.5, col = "orange")
    }
    for (edg in 1:nrow(g.edges)) {
        # all edges edg <- 1
        graphics::lines(c(g.edges[edg, "xa"], g.edges[edg, "xb"]), c(g.edges[edg, 
            "ya"], g.edges[edg, "yb"]), lwd = g.edges[edg, "width"], col = g.edges[edg, 
            "color"])
    }
    for (nd.c in 1:nrow(nds.lbl)) {
        # common nodes (end of common edges) label on the node coordinates
        labels_shadow(nds.lbl[nd.c, ]$x, nds.lbl[nd.c, ]$y, label = as.character(nds.lbl[nd.c, 
            var]), col = common.color, bg = "white", cex = 0.4, r = 0.2)
    }
}
