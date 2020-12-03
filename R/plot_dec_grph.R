plot_dec_grph <- function(nodes = NULL, edges = NULL,
                          site, decor, doss = getwd(),
                          nd.color = "orange", nd.size = 1.7,
                          lbl.color = "black", lbl.size = 1.2, nds.lbl = "id",
                          eds.color = c("orange","blue"), ed.lwd = 4) {
    ## plot nodes on image nds.lbl = 'id' ; nd.color <- lbl.color <-
    ## ed.color <- 'orange' lbl.size=1.2 ; nd.size=1.7 ; ed.lwd <- 4 site <-
    ## 'Cerro Muriano' ; decor <- site <- 'Ibahernando' ;
    # images
    imgs <- utils::read.table(file = paste0(doss, "/imgs.tsv"),
                              sep = "\t", header = TRUE)
    # select
    img.select <- imgs[imgs$site  == site &
                       imgs$decor == decor, ]
    # load
    img.in <- magick::image_read(paste0(doss, "/", img.select$img))
    img.out <- magick::image_draw(img.in)
    if (!is.null(edges)) {
        edges.select <- edges[edges$site  == site &
                                edges$decor == decor, ]
        for (edg in 1:nrow(edges.select)) {
            # edg <- 1
            edg.df <- edges.select[edg, ]
            ed.type <- ifelse(edg.df$type == "+", 2, 1)
            ed.color <- eds.color[ifelse(edg.df$type == ">", 2,1)]
            graphics::lines(edg.df[c("xa", "xb")],
                            -edg.df[c("ya", "yb")],
                            lty = ed.type, lwd = ed.lwd, col = ed.color)
        }
    }
    if (!is.null(nodes)) {
        ## Plot nodes and labels
        nodes.select <- nodes[nodes$site  == site &
                                nodes$decor == decor, ]
        ax <- nodes.select$x
        ay <- -nodes.select$y  # coordinates
        lbl <- nodes.select[, nds.lbl]  # labels
        graphics::points(ax, ay, pch = 21, col = nd.color, bg = nd.color,
            cex = nd.size)
        labels_shadow(ax, ay, label = lbl, col = lbl.color, bg = "white",
            cex = lbl.size, r = 0.2, pos = 3)
    }
    ## annotate studied variable up
    img.out <- magick::image_annotate(img.out, nds.lbl, size = 20,
                                      gravity = "northwest", color = "black")
    # decor title down
    tit.img <- paste0(site, "\n", decor)
    img.out <- magick::image_annotate(img.out, tit.img, size = 20,
                                      gravity = "southwest", color = "black")
    grDevices::dev.off()
    return(img.out)
}
