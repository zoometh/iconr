plot_eds_compar <- function(listg, graph2, doss=getwd(), var="type"){
  # a manner to use only plot()
  # listg <- g.compar ; graph2 <- c(1,4) ; var="type"
  # get row index in tcompar
  flistg <- unlist(listg, recursive = FALSE) # flatten list
  lidf <- unique(unlist(lapply(flistg, function(x) x$name)))
  ldec.comp <- t(utils::combn(lidf, 2)) # all pairwise comparisons
  A <- graph2[1] ; B <- graph2[2] # ; nb.comm.eds <-
  ridx <- which(ldec.comp[,1] == A & ldec.comp[,2] == B, arr.ind = T)
  g <- listg[[ridx]]
  out.compar <- paste0("compar_eds_",as.character(A),"_",as.character(B),".png")
  tit <- paste0("compare decorations '",A,"' and '",B,"' on '",var,"'")
  grDevices::png(out.compar,width = 14,height=7, units = "cm", res=300)
  graphics::par(mfrow=c(1,2),
                mar=c(0,0,0,0))    # set the plotting area into a 1*2 array
  side_plot_eds(g, 1, doss, var); side_plot_eds(g, 2, doss, var) # call to plot
  graphics::mtext(tit, side = 1, line = -1, outer = TRUE, cex=0.8)
  grDevices::dev.off()
  return(paste0(doss,"/",out.compar,".png"))
}
