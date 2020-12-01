plot_compar <- function(listg, graph2 = NULL, focus = "nodes",
                        doss = getwd(), var = "type",
                        nds.color = c("orange", "red"), nds.size = c(0.5, 1),
                        eds.color = c("orange", "red"), eds.width = c(1, 2),
                        lbl.size = 0.4,
                        img.format = "png", res = 300) {
  focus.option <- c("nodes", "edges") == focus
  if (!any(focus.option)) {
    stop(paste0("plot_compar option focus = \"", focus, "\" not recognized."))
  }
  img.prefix <- c("compar_nds_", "compar_eds_")[focus.option]
  caption.heading <- c("nodes: ", "edges: ")[focus.option]
  caption.end <- c("", paste0(" on '", var, "'"))[focus.option]

  out.compar.list <- character(0)
  for(i in 1:length(listg)) {
    # i <- 1
    g <- listg[[i]]
    g.names <- unlist(lapply(g, function(x) x$name))
    if(is.null(graph2) || all(g.names %in% graph2)) {
      out.compar <- paste0(img.prefix, g.names[1], "_",
                           g.names[2], ".", img.format)
      tit <- paste0(caption.heading, "compare decorations '", g.names[1],
                    "' and '", g.names[2], "'", caption.end)
      decorr::grDeviceOpen(out.compar, width = 14, height = 7, res = res)
      # Set the plotting area into a 1*2 array
      graphics::par(mfrow = c(1, 2), mar = c(0, 0, 0, 0))
      side_plot(g[[1]], doss, var, focus,
                nds.color, nds.size, eds.color, eds.width, lbl.size)
      side_plot(g[[2]], doss, var, focus,
                nds.color, nds.size, eds.color, eds.width, lbl.size)
      graphics::mtext(tit, side = 1, line = -1, outer = TRUE, cex = 0.6)
      grDevices::dev.off()
      out.compar.list[length(out.compar.list) + 1] <- out.compar
    }
  }
  return(paste0(getwd(), "/", out.compar.list))
}

grDeviceOpen <- function(img.file.name, width, height, res = res)
{
  #Extract image format from the extension of the file name.
  m <- regexpr("\\.([[:alnum:]])+", img.file.name)
  img.format <- regmatches(img.file.name, m+1)

  devices <- list(png = grDevices::png,
                  bmp = grDevices::bmp,
                  tiff = grDevices::tiff, tif = grDevices::tiff,
                  jpeg = grDevices::jpeg, jpg = grDevices::jpeg)
  # pdf is treated separately because it has different syntax.

  if (img.format %in% names(devices)){
    devices[[img.format]](img.file.name, width = 14, height = 7,
                          units = "cm", res = res)
  } else if (img.format == "pdf") {
    cm <- 1/2.54 #inches
    grDevices::pdf(img.file.name, width = 14*cm, height = 7*cm)
  } else {
    stop(paste0("Image format ", img.format, " not recognized."))
  }
}
