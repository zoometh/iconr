#' @export
plot_compar <- function(listg, dec2comp = NULL, focus = "nodes",
                        dir = getwd(),
                        nd.color = c("orange", "red"), nd.size = c(0.5, 1),
                        ed.color = c("orange", "red"), ed.width = c(1, 2),
                        lbl.size = 0.5,
                        dir.out = dir, out.file.name = NULL,
                        img.format = NULL, res = 300) {
# If a single value is set for an nds or eds parameter, it affects both types:
  if (length(nd.color) == 1) nd.color[2] <- nd.color[1]
  if (length(nd.size) == 1) nd.size[2] <- nd.size[1]
  if (length(ed.color) == 1) ed.color[2] <- ed.color[1]
  if (length(ed.width) == 1) ed.width[2] <- ed.width[1]
# Focus-specific parameter defaults and names:
  if (focus == "nodes") {
    img.prefix <- "_compar_nds_"
  } else if (focus == "edges") {
    if (missing(nd.color)) nd.color <- ed.color
    if (missing(nd.size)) nd.size[2] <- nd.size[1]
    img.prefix <- "_compar_eds_"
  } else {
    stop(paste0("focus must be \"nodes\" or \"edges\"."))
  }

  out.list <- character(0)
  out.i <- 0
  for(i in seq_len(length(listg))) {
    g <- listg[[i]]
    g.names <- unlist(lapply(g, function(x) x$name))
    if(is.null(dec2comp) || all(g.names %in% dec2comp)) {
      out.i <- out.i + 1
      nd.var <- attributes(g)$nd.var
      if (is.null(out.file.name) || length(out.file.name) < out.i) {
        out.list[out.i] <- paste0(dir.out, "/", img.prefix, g.names[1],
                                  "_", g.names[2], ".", img.format)
      } else {
        img.format <- file_extension(out.file.name[out.i])
        out.list[out.i] <- out.file.name[out.i]
      }
      com.elm.num <- ifelse(focus == "nodes", sum(igraph::V(g[[1]])$comm),
                                              sum(igraph::E(g[[1]])$comm))
      tit <- paste0("Common ", focus, " (n=", com.elm.num, ")")

      plot_pair(img.format, out.list[out.i],
                g, dir, nd.var, focus,
                nd.color, nd.size, ed.color, ed.width, lbl.size,
                tit, res)
    }
  }
  if (!is.null(img.format)) return(out.list)
}

plot_pair <- function(img.format, img.filename,
                      g, dir, nd.var, focus,
                      nd.color, nd.size, ed.color, ed.width, lbl.size,
                      title, res)
{
  if (!is.null(img.format)) {
    curdev <- grDevices::dev.cur()
    on.exit({if(grDevices::dev.cur() != curdev) {
               grDevices::dev.off()
               if(curdev > 1) grDevices::dev.set(curdev)
             } })
    grDeviceOpen(img.filename, width = 14, height = 7, res = res)
  }

  # Set the plotting area into a 1*2 array
  oldpar <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(oldpar), add = TRUE, after = FALSE)
  graphics::par(mfrow = c(1, 2), mar = c(0, 0, 0, 0))
  side_plot(g[[1]], dir, nd.var, focus,
            nd.color, nd.size, ed.color, ed.width, lbl.size)
  side_plot(g[[2]], dir, nd.var, focus,
            nd.color, nd.size, ed.color, ed.width, lbl.size)
  graphics::mtext(title, side = 1, line = -1, outer = TRUE,
                  cex = 0.6 * scale_factor())
}


grDeviceOpen <- function(img.file.name, width, height, res = 300)
{
  img.format <- file_extension(img.file.name)

  devices <- list(png = grDevices::png,
                  bmp = grDevices::bmp,
                  tiff = grDevices::tiff, tif = grDevices::tiff,
                  jpeg = grDevices::jpeg, jpg = grDevices::jpeg)
  # pdf is treated separately because it has different syntax.
  if (img.format %in% names(devices)){
    devices[[img.format]](img.file.name,
                          width = width, height = height,
                          units = "cm", res = res)
  } else if (img.format == "pdf") {
    cm <- 1/2.54 #inches
    grDevices::pdf(img.file.name,
                   width = width*cm, height = height*cm)
  } else {
    stop(paste0("Image format ", img.format, " not recognized."))
  }
}

file_extension <- function(file.name)
{
  return(sub("([[:print:]])+\\.", "", file.name))
}

rm_file_extension <- function(file.name)
{
  m <- regexpr("([[:print:]])+\\.", file.name)
  return(regmatches(file.name, m-1))
}
