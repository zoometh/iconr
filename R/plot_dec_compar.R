plot_dec_compar <- function(listg,graph2){
  # a manner to use only plot()
  # listg <- g.compar ; graph2 <- c(1,3)
  # get row index in tcompar
  flistg <- unlist(listg, recursive = FALSE) # flatten list
  lidf <- unique(unlist(lapply(flistg, function(x) x$name)))
  ldec.comp <- t(utils::combn(lidf, 2)) # all pairwise comparisons
  A <- graph2[1] ; B <- graph2[2] # ; nb.comm.eds <-
  ridx <- which(ldec.comp[,1] == A & ldec.comp[,2] == B, arr.ind = T)
  g <- listg[[ridx]]
  out.compar <- paste0("compar_",as.character(A),"_",as.character(B),".png")
  tit <- paste0("compare decorations '",A,"' and '",B,"'")
  grDevices::png(out.compar,width = 14,height=7, units = "cm", res=300)
  graphics::par(mfrow=c(1,2),
                mar=c(0,0,0,0))    # set the plotting area into a 1*2 array
  side_plot(g,1); side_plot(g,2) # call to plot
  graphics::mtext(tit, side = 1, line = -1, outer = TRUE)
  grDevices::dev.off()
  shell.exec(out.compar)
}
