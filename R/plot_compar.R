plot_compar <- function(listg, graph2 = NULL, focus = "nodes",
                        doss = getwd(),
                        nds.color = c("orange", "red"), nds.size = c(0.5, 1),
                        eds.color = c("orange", "red"), eds.width = c(1, 2),
                        lbl.size = 0.5,
                        img.format = "png", res = 300) {
# If a single value is set for an nds or eds parameter, it affects both types:
  if (length(nds.color) == 1) nds.color[2] <- nds.color[1]
  if (length(nds.size) == 1) nds.size[2] <- nds.size[1]
  if (length(eds.color) == 1) eds.color[2] <- eds.color[1]
  if (length(eds.width) == 1) eds.width[2] <- eds.width[1]
# Focus-specific parameter defaults and names:
  if (focus == "nodes") {
    img.prefix <- "compar_nds_"
  } else if (focus == "edges") {
    if (missing(nds.color)) nds.color <- eds.color
    if (missing(nds.size)) nds.size[2] <- nds.size[1]
    img.prefix <- "compar_eds_"
  } else {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }

  out.compar.list <- character(0)
  for(i in 1:length(listg)) {
    # i <- 1
    g <- listg[[i]]
    g.names <- unlist(lapply(g, function(x) x$name))
    if(is.null(graph2) || all(g.names %in% graph2)) {
      nds.var <- attributes(g)$nds.var
      out.compar <- paste0(img.prefix, g.names[1], "_",
                           g.names[2], ".", img.format)
      com.elm.num <- ifelse(focus == "nodes", sum(igraph::V(g[[1]])$comm),
                                              sum(igraph::E(g[[1]])$comm))
      tit <- paste0("Common ", focus,
                    " (n=", com.elm.num, "): ",
                    "compare decorations '", g.names[1], "' and '", g.names[2],
                    "' on nodes '", nds.var, "'")
      decorr::grDeviceOpen(out.compar, width = 14, height = 7, res = res)
      # Set the plotting area into a 1*2 array
      graphics::par(mfrow = c(1, 2), mar = c(0, 0, 0, 0))
      side_plot(g[[1]], doss, nds.var, focus,
                nds.color, nds.size, eds.color, eds.width, lbl.size)
      side_plot(g[[2]], doss, nds.var, focus,
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
