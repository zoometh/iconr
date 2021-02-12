#' @export
plot_dec_grph <- function(nodes = NULL, edges = NULL, imgs,
                          site, decor,
                          dir = getwd(),
                          nd.var = "id",
                          nd.color = "orange", nd.size = 0.5,
                          lbl.color = "black", lbl.size = 0.5,
                          ed.color = c("orange", "blue"), ed.lwd = 1,
                          dir.out = dir, out.file.name = NULL,
                          img.format = NULL, res = 300) {
    # Select the image corresponding to site and decor.
    img.select <- imgs[imgs$site == site & imgs$decor == decor, ]
    if (nrow(img.select) != 1){
        stop(paste0("There must be exactly 1 decoration. Here there is ",
                    nrow(img.select)))
    }
    idf <- as.character(img.select$idf)
    dec.img <- magick::image_read(paste0(dir, "/", img.select$img))

    if (is.null(out.file.name)) {
        out.file.name <- paste0(dir.out, "/", idf, "_", site, "_",
                                decor, "_", nd.var, ".", img.format)
    } else {
        img.format <- file_extension(out.file.name)
    }

    if (!is.null(edges) && nrow(edges)>0) {
        edges <- edges[edges$site  == site & edges$decor == decor, ]
        edges$lty <- ifelse(edges$type == "+", "33", "solid")
        edges$col <- ed.color[ifelse(edges$type == ">", 2, 1)]
        edges$lwd <- ed.lwd
    }
    if (!is.null(nodes) && nrow(nodes)>0) {
        nodes <- nodes[nodes$site  == site & nodes$decor == decor, ]
        nodes$cex <- nd.size
        nodes$col <- nd.color
        nodes$lbl.cex <- lbl.size
        nodes$lbl.col <- lbl.color
    }

    if (!is.null(img.format)) {
        img.ratio <- magick::image_info(dec.img)$width /
                        magick::image_info(dec.img)$height
        curdev <- grDevices::dev.cur()
        on.exit({if(grDevices::dev.cur() != curdev) {
                   grDevices::dev.off()
                   if(curdev > 1) grDevices::dev.set(curdev)
                 } })
        grDeviceOpen(out.file.name, width = 7*img.ratio, height = 7, res = res)
    }
    oldpar <- graphics::par(no.readonly = TRUE)
    on.exit(graphics::par(oldpar), add = TRUE, after = FALSE)
    graphics::par(mar = c(0, 0, 0, 0))

    draw_graph(nodes, edges, TRUE,
               nd.var, dec.img,
               paste0(idf, "\n", site, "\n", decor))

    if (!is.null(img.format)) return(out.file.name)
}
