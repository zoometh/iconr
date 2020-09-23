plot_dec_grph <- function(nds.df,
                          eds.df,
                          site,
                          decor,
                          doss=getwd(),
                          shw=c("nodes"),
                          lbl.txt='id',
                          nd.color='orange',
                          nd.size=1.7,
                          lbl.color='black',
                          lbl.size=1.2,
                          ed.color='orange',
                          ed.lwd=4){
  ## plot nodes on image
  # lbl.txt = 'id' ; nd.color <- lbl.color <- ed.color <- 'orange'
  # lbl.size=1.2 ; nd.size=1.7 ; ed.lwd <- 4
  # site <- "Cerro Muriano" ; decor <- "Cerro Muriano 1" ; 
  # shw <- "edges" ; shw <- c("nodes","edges")
  ## select
  # nodes, edges
  nds.df.select <- nds.df[nds.df[,"site"]==site & nds.df[,"decor"]==decor,]
  eds.df.select <- eds.df[eds.df[,"site"]==site & eds.df[,"decor"]==decor,]
  # images
  imgs <- utils::read.table(file = paste0(doss,"/imgs.tsv"), sep = '\t', header = TRUE)
  # select
  img.select <- imgs[imgs[,"site"]==site & imgs[,"decor"]==decor,]
  img.select <- img.select$img
  # load
  img.in <- magick::image_read(paste0(doss,'/',img.select))
  img.out <- magick::image_draw(img.in)
  if ("edges" %in% shw){
    for (edg in 1:nrow(eds.df.select)){
      # edg <- 1
      # type of edge
      ed.type <- ifelse(is.na(eds.df.select[edg,"type"]), 1,
                        ifelse(eds.df.select[edg,"type"]=='+'), 2,
                               ifelse(eds.df.select[edg,"type"]=='>'), 2, 1
      )
      graphics::lines(c(eds.df.select[edg,"xa"],eds.df.select[edg,"xb"]),
            c(abs(eds.df.select[edg,"ya"]),abs(eds.df.select[edg,"yb"])),
            lty=ed.type,
            lwd=ed.lwd,col=ed.color)
    }
  }
  if ("nodes" %in% shw){
    ## loop through nodes to plot them and labels
    for (n in 1:nrow(nds.df.select)){
      # n <- 1
      ax <- nds.df.select[n,"x"] ; ay <- abs(nds.df.select[n,"y"]) # coordinates
      lbl <- nds.df.select[n,lbl.txt] # labels
      graphics::points(ax,ay,
             pch=21,
             col=nd.color,
             bg=nd.color,
             cex=nd.size)
      labels_shadow(ax,ay,
                    label=lbl,
                    col=lbl.color,
                    bg="white",
                    cex=lbl.size,
                    r=0.2,
                    pos=3)
    }
  }
  ## annotate
  # studied variable up
  img.out <- magick::image_annotate(img.out, lbl.txt, size = 30,
                            gravity = "northwest", color = "black")
  # decor title down
  tit.img <- paste0(site,"\n",decor)
  img.out <- magick::image_annotate(img.out, tit.img, size = 30,
                            gravity = "southwest", color = "black")
  # img.out <- f.annotate(img.out,site,decor)
  grDevices::dev.off()
  return(img.out)
}
