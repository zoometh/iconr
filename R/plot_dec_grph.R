plot_dec_grph <- function(nds.df, eds.df, site, decor, doss = getwd(),
                          shw = c("nodes"), lbl.txt = "id",
                          nd.color = "orange", nd.size = 1.7,
                          lbl.color = "black", lbl.size = 1.2,
                          ed.color = "orange", ed.lwd = 4) {
    ## plot nodes on image lbl.txt = 'id' ; nd.color <- lbl.color <-
    ## ed.color <- 'orange' lbl.size=1.2 ; nd.size=1.7 ; ed.lwd <- 4 site <-
    ## 'Cerro Muriano' ; decor <- site <- 'Ibahernando' ; shw <- 'edges' ; shw
    ## <- c('nodes','edges') select nodes, edges
    nds.df.select <- nds.df[nds.df$site  == site &
                            nds.df$decor == decor, ]
    eds.df.select <- eds.df[eds.df$site  == site &
                            eds.df$decor == decor, ]
    # images
    imgs <- utils::read.table(file = paste0(doss, "/imgs.tsv"),
                              sep = "\t", header = TRUE)
    # select
    img.select <- imgs[imgs$site  == site &
                       imgs$decor == decor, ]
    # load
    img.in <- magick::image_read(paste0(doss, "/", img.select$img))
    img.out <- magick::image_draw(img.in)
    if ("edges" %in% shw) {
        for (edg in 1:nrow(eds.df.select)) {
            # edg <- 3
            edg.df <- eds.df.select[edg, ]
            # ed.type <- ifelse(edg.df$type %in% c("+", ">"), 2, 1)
            if(edg.df$type == "="){
                ed.type <- 1
                ed.color <- "orange"
            }
            if(edg.df$type == "+"){
                ed.type <- 2
                ed.color <- "orange"
            }
            if(edg.df$type == ">"){
                ed.type <- 1
                ed.color <- "blue"
            }
            graphics::lines(edg.df[c("xa", "xb")],
                            abs(edg.df[c("ya", "yb")]),
                            lty = ed.type, lwd = ed.lwd, col = ed.color)
        }
    }
    if ("nodes" %in% shw) {
        ## Plot nodes and labels
        ax <- nds.df.select$x
        ay <- abs(nds.df.select$y)  # coordinates
        lbl <- nds.df.select[, lbl.txt]  # labels
        graphics::points(ax, ay, pch = 21, col = nd.color, bg = nd.color,
            cex = nd.size)
        labels_shadow(ax, ay, label = lbl, col = lbl.color, bg = "white",
            cex = lbl.size, r = 0.2, pos = 3)
    }
    ## annotate studied variable up
    img.out <- magick::image_annotate(img.out, lbl.txt, size = 20,
                                      gravity = "northwest", color = "black")
    # decor title down
    tit.img <- paste0(site, "\n", decor)
    img.out <- magick::image_annotate(img.out, tit.img, size = 20,
                                      gravity = "southwest", color = "black")
    grDevices::dev.off()
    return(img.out)
}
