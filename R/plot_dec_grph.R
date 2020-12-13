#' @export
plot_dec_grph <- function(nodes = NULL, edges = NULL,
                          site, decor, doss = getwd(),
                          nd.var = "id",
                          nd.color = "orange", nd.size = 1.7,
                          lbl.color = "black", lbl.size = 1.2,
                          ed.color = c("orange", "blue"), ed.lwd = 4,
                          img.format = "png") {
    # images
    imgs <- utils::read.table(file = paste0(doss, "/imgs.tsv"),
                              sep = "\t", header = TRUE)
    # select
    img.select <- imgs[imgs$site  == site &
                           imgs$decor == decor, ]
    if (nrow(img.select) != 1){
        stop(paste0("There must be exactly 1 decoration. Here there is ",
                    nrow(img.select)))
    }
    id <- as.character(img.select$id)
    # load
    img.in <- magick::image_read(paste0(doss, "/", img.select$img))
    img <- magick::image_draw(img.in)
    if (!is.null(edges)){
        if (nrow(edges) > 0){
            edges.select <- edges[edges$site  == site &
                                      edges$decor == decor, ]
            for (edg in 1:nrow(edges.select)) {
                edg.df <- edges.select[edg, ]
                edg.type <- ifelse(edg.df$type == "+", 2, 1)
                edg.color <- ed.color[ifelse(edg.df$type == ">", 2, 1)]
                graphics::lines(edg.df[c("xa", "xb")],
                                -edg.df[c("ya", "yb")],
                                lty = edg.type, lwd = ed.lwd, col = edg.color)
            }
        }
    }
    if (!is.null(nodes)){
        if (nrow(nodes) > 0){
            ## Plot nodes and labels
            nodes.select <- nodes[nodes$site  == site &
                                      nodes$decor == decor, ]
            ax <- nodes.select$x
            ay <- -nodes.select$y  # coordinates
            lbl <- nodes.select[, nd.var]  # labels
            graphics::points(ax, ay, pch = 21, col = nd.color, bg = nd.color,
                             cex = nd.size)
            labels_shadow(ax, ay, labels = lbl, col = lbl.color, bg = "white",
                          cex = lbl.size, r = 0.2, pos = 3)
        }
    }
    # nd.var label
    img <- magick::image_annotate(img, nd.var, size = 20,
                                  gravity = "northeast", color = "black")
    # decor title
    tit.img <- paste0(id, "\n", site, "\n", decor)
    img <- magick::image_annotate(img, tit.img, size = 20,
                                  gravity = "northwest", color = "black")
    grDevices::dev.off()
    img.out <- paste0(doss, "/", id, "_", site, "_", decor, "_", nd.var, ".",img.format)
    magick::image_write(img, path = img.out,
                        format = img.format)
    return(img.out)
}
